package jogoTCC.estrutura {
	
	import jogoTCC.entidades.Casa;
	import jogoTCC.moduloIA.ExecutaAcaoIA;
	import jogoTCC.moduloIA.PrincipalIA;
	import starling.display.Sprite;
	import jogoTCC.entidades.Mapa;
	import jogoTCC.entidades.Personagem;
	import jogoTCC.util.Scroll;
	import flash.utils.setTimeout;
	import flash.display.Bitmap;
	import starling.display.Button;
	import starling.textures.Texture;
	import starling.events.Event;
	
	public class Partida extends Sprite {
		
		// variaveis para controle do jogo
		private var listaPersonagens:Array;
		private var scroll:Scroll;
		public var personagemMarcado:Personagem;
		public var mapa:Mapa;
		public var turnoAtual:Number = 0;
		private var executaAcaoIA:ExecutaAcaoIA;
		public var isIaVsIa:Boolean = false;
		
		[Embed(source = "../../../assets/mapa/joga.png")]
		private static const texturaBtnJoga:Class;
		
		[Embed(source = "../../../assets/mapa/pause.png")]
		private static const texturaBtnPause:Class;
		
		public var isParado:Boolean = false;
		
		public function Partida() {
			// rotina para iniciar a estrutura do jogo
			iniciaPartida();
		}
		
		public function iniciaPartida():void {
			// adiciona mapa ao jogo
			mapa = new Mapa();
			addChild(mapa);
			
			// scroll da partida
			scroll = new Scroll(this);
			addChild(scroll);
			scroll.inciaScroll();
			
			// inicia jogadores			
			listaPersonagens = new Array();
			adicionaJogadores();
			
			// inicia modulo IA
			executaAcaoIA = new ExecutaAcaoIA(mapa, listaPersonagens);
		
		}
		
		private function adicionaJogadores():void {
			
			// personagens do time do jogador
			var p1:Personagem = new Personagem("guerreiro", 0);
			addChild(p1);
			p1.setLocalInicialPersonagem(mapa.casas[4][3] as Casa);
			
			var p2:Personagem = new Personagem("guerreiro", 0);
			addChild(p2);
			p2.setLocalInicialPersonagem(mapa.casas[7][3] as Casa);
			
			var p3:Personagem = new Personagem("guerreiro", 0);
			addChild(p3);
			p3.setLocalInicialPersonagem(mapa.casas[11][3] as Casa);
			
			/*var p4:Personagem = new Personagem("guerreiro", 0);
			   addChild(p4);
			   p4.setLocalInicialPersonagem(mapa.casas[12][3] as Casa);
			
			   var p5:Personagem = new Personagem("guerreiro", 0);
			   addChild(p5);
			   p5.setLocalInicialPersonagem(mapa.casas[15][3] as Casa);*/
			
			// personagens do time do computador
			
			var pc1:Personagem = new Personagem("monstro", 1);
			addChild(pc1);
			pc1.setLocalInicialPersonagem(mapa.casas[4][20] as Casa);
			
			var pc2:Personagem = new Personagem("monstro", 1);
			addChild(pc2);
			pc2.setLocalInicialPersonagem(mapa.casas[7][20] as Casa);
			
			var pc3:Personagem = new Personagem("monstro", 1);
			addChild(pc3);
			pc3.setLocalInicialPersonagem(mapa.casas[10][20] as Casa);
			
			/*var pc4:Personagem = new Personagem("monstro", 1);
			   addChild(pc4);
			   pc4.setLocalInicialPersonagem(mapa.casas[12][20] as Casa);
			
			   var pc5:Personagem = new Personagem("monstro", 1);
			   addChild(pc5);
			   pc5.setLocalInicialPersonagem(mapa.casas[15][20] as Casa);*/
			
			listaPersonagens.push(p1);
			listaPersonagens.push(p2);
			listaPersonagens.push(p3);
			//listaPersonagens.push(p4);
			//listaPersonagens.push(p5);
			listaPersonagens.push(pc1);
			listaPersonagens.push(pc2)
			listaPersonagens.push(pc3);
			//listaPersonagens.push(pc4);
			//listaPersonagens.push(pc5);
		
		}
		
		public function atualizaPersonagemMarcado(personagem:Personagem):void {
			if (personagemMarcado != null)
				personagemMarcado.mostraRange(false);
			personagemMarcado = personagem;
		}
		
		public function gerenciaAtaque(personagem:Personagem):void {
			if ((personagem != null && personagemMarcado != null) && personagem != personagemMarcado && personagem.time != personagemMarcado.time) {
					if (personagem.isCasaDestinoValida(this.personagemMarcado.casaAtual)) {
							personagem.sofreAtaque();
							personagemMarcado.ataca();
						}
				}
		}
		
		public function organizaLayers():void {
			mapa.organizaLayers(listaPersonagens);
		}
		
		public function verificaEstadoPartida():void {
			var telaFim:TelaFinal;
			
			var vivosT0:Number = 0;
			var vivosT1:Number = 0;
			
			for each (var p:Personagem in this.listaPersonagens) {
					{
						if (p.time == 0 && p.vida > 1)
							vivosT0++;
						else if (p.time == 1 && p.vida > 1)
							vivosT1++;
					}
				}
			
			if (this.mapa != null) {
					if (this.mapa.vidaC0 == 1 || vivosT0 == 0) {
							telaFim = new TelaFinal();
							telaFim.criaTela("time2");
							this.parent.addChild(telaFim);
							
						} else if (this.mapa.vidaC1 == 1 || vivosT1 == 0) {
							telaFim = new TelaFinal();
							telaFim.criaTela("time1");
							this.parent.addChild(telaFim);
							
						}
					
				}
		
		}
		
		public function trocaTurno():void {
	 
			if (!isParado) {
					if (this.turnoAtual == 0) {
							this.turnoAtual = 1;
							setTimeout(executaAcaoIA.processaJogada, 300);
						} else if (this.turnoAtual == 1) {
							this.turnoAtual = 0;
							
							if (isIaVsIa) {
									setTimeout(executaAcaoIA.processaJogadaSimples, 300);
								}
						}
				}
		}
		
		public function iniciaIaVsIa():void {
			executaAcaoIA.processaJogadaSimples();
			trocaTurno();
		}
	
	}

}
