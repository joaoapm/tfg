package jogoTCC.estrutura
{
	
	import jogoTCC.entidades.Casa;
	import starling.display.Sprite;
	import jogoTCC.entidades.Mapa;
	import jogoTCC.entidades.Personagem;
	import starling.events.Touch;
	import flash.geom.Point;
	import starling.events.TouchEvent;
	import starling.events.Event;
	
	public class Partida extends Sprite
	{
		
		// variaveis para controle do jogo
		public var personagemMarcado:Personagem;
		public var mapa:Mapa;
		
		// variaveis para controle do scroll da tela
		public var moveMapaD:Boolean = false;
		public var moveMapaE:Boolean = false;
		public var moveMapaC:Boolean = false;
		public var moveMapaB:Boolean = false;
		
		// velocidade de scroll
		public var VEL_SCROLLX:Number = 10;
		public var VEL_SCROLLY:Number = 5;
		private static var POS_PARTIDAX:Number = -320;
		private static var POS_PARTIDAY:Number = -160;
		
		public var posicaoMapa:Point = new Point();
		
		public function Partida()
		{
			// rotina para iniciar a estrutura do jogo
			iniciaPartida();
			
			// adiciona controle de eventos 
			addEventListener(TouchEvent.TOUCH, posMouse);
			addEventListener(Event.ENTER_FRAME, scrollMapa);
		}
		
		public function iniciaPartida():void
		{
			
			// posiciona partida
			this.x = POS_PARTIDAX;
			this.y = -160;
			
			// adiciona mapa ao jogo
			mapa = new Mapa();
			addChild(mapa);
			
			adicionaJogadores();
		}
		
		private function adicionaJogadores():void
		{
			
			// personagens do time do jogador
			var p1:Personagem = new Personagem("guerreiro", 0);
			addChild(p1);
			
			p1.setLocalInicialPersonagem(mapa.casas[5][3] as Casa);
			
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
		
		}
		
		private function scrollMapa(e:Event):void
		{
			if (moveMapaD)
			{
				if (this.x < 0 && this.y < 0)
				{
					this.x += VEL_SCROLLX;
					this.y += VEL_SCROLLY;
				}
			}
			else if (moveMapaE)
			{
				if (mapa.x > -800)
				{
					if (this.x > -1100 && this.y > -1100)
					{
						this.x -= VEL_SCROLLX;
						this.y -= VEL_SCROLLY;
					}
				}
			}
		
		}
		
		private function posMouse(e:TouchEvent):void
		{
			
			var touch:Touch = e.getTouch(stage);
			
			if (touch)
			{
				var p:Point = touch.getLocation(stage);
				
				if (p.x < 40)
				{
					moveMapaD = true;
				}
				else if (p.x > 765)
				{
					moveMapaE = true;
				}
				else if (p.y < 30)
				{
					moveMapaC = true;
				}
				else if (p.y > 575)
				{
					moveMapaB = true;
				}
				else
				{
					moveMapaD = false;
					moveMapaE = false;
					moveMapaB = false;
					moveMapaC = false;
				}
			}
		
		}
		
		public function atualizaPersonagemMarcado(personagem:Personagem):void
		{
			if (personagemMarcado != null)
				personagemMarcado.mostraRange(false);
			personagemMarcado = personagem;
		}
		
		public function gerenciaAtaque(personagem:Personagem):void
		{
			if ((personagem != null && personagemMarcado != null) && 
			     personagem != personagemMarcado && personagem.time != personagemMarcado.time)
			{
				personagem.sofreAtaque();
				personagemMarcado.ataca();
			}
		}
	}

}