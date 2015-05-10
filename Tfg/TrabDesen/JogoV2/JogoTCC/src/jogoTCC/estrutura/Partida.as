package jogoTCC.estrutura
{
	
	import jogoTCC.entidades.Casa;
	import starling.display.Sprite;
	import jogoTCC.entidades.Mapa;
	import jogoTCC.entidades.Personagem;
	import jogoTCC.util.Scroll;
	
	public class Partida extends Sprite
	{
		
		// variaveis para controle do jogo
		private var listaPersonagens:Array;
		private var scroll:Scroll;
		public var personagemMarcado:Personagem;
		public var mapa:Mapa;
		
		public function Partida()
		{
			// rotina para iniciar a estrutura do jogo
			iniciaPartida();
		}
		
		public function iniciaPartida():void
		{
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
		}
		
		private function adicionaJogadores():void
		{
			
			// personagens do time do jogador
			var p1:Personagem = new Personagem("guerreiro", 0);
			addChild(p1);
			p1.setLocalInicialPersonagem(mapa.casas[5][20] as Casa);
			
			var p2:Personagem = new Personagem("guerreiro", 0);
			addChild(p2);
			p2.setLocalInicialPersonagem(mapa.casas[8][3] as Casa);
			
			// personagens do time do computador
			
			var pc1:Personagem = new Personagem("monstro", 1);
			addChild(pc1);
			pc1.setLocalInicialPersonagem(mapa.casas[5][7] as Casa);
			
			var pc2:Personagem = new Personagem("monstro", 1);
			addChild(pc2);
			pc2.setLocalInicialPersonagem(mapa.casas[8][7] as Casa);
			
			listaPersonagens.push(p1);
			listaPersonagens.push(p2);
			listaPersonagens.push(pc1);
			listaPersonagens.push(pc2);
		
		}
		
		public function atualizaPersonagemMarcado(personagem:Personagem):void
		{
			if (personagemMarcado != null)
				personagemMarcado.mostraRange(false);
			personagemMarcado = personagem;
		}
		
		public function gerenciaAtaque(personagem:Personagem):void
		{
			if ((personagem != null && personagemMarcado != null) && personagem != personagemMarcado && personagem.time != personagemMarcado.time)
			{
				if (personagem.isCasaDestinoValida(this.personagemMarcado.casaAtual))
				{
					personagem.sofreAtaque();
					personagemMarcado.ataca();
				}
			}
		}
		
		public function organizaLayers():void
		{
			mapa.organizaLayers(listaPersonagens);
		}
		
		public function verificaEstadoPartida():void
		{
			var telaFim:TelaFinal;
			if (this.mapa != null)
			{
				if (this.mapa.vidaC0 == 1)
				{
					telaFim = new TelaFinal();
					telaFim.criaTela("time2");
					this.parent.addChild(telaFim);
					this.dispose()
					parent.removeFromParent(this);
					
				}
				else if (this.mapa.vidaC1 == 1)
				{
					telaFim = new TelaFinal();
					telaFim.criaTela("time1");
					this.parent.addChild(telaFim);
			 
					
				}
				
			}
		}
	
	}

}
