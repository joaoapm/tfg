package jogoTCC.estrutura
{
	import flash.display.DisplayObject;
	import starling.display.Sprite;
	import jogoTCC.entidades.Mapa;
	import jogoTCC.entidades.Personagem;
	import starling.events.Touch;
	import flash.geom.Point;
	import starling.events.TouchPhase;
	import starling.events.TouchEvent;
	import starling.events.Event;
	
	public class Partida extends Sprite
	{
		
		public var personagemMarcado:Object;
		public var mapa:Mapa;
		public var moveMapaD:Boolean = false;
		public var moveMapaE:Boolean = false;
		public var moveMapaC:Boolean = false;
		public var moveMapaB:Boolean = false;
		public var VEL_SCROLLX:Number = 14;
		public var VEL_SCROLLY:Number = 7;
		
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
			// adiciona mapa ao jogo
			mapa = new Mapa();
			addChild(mapa);
			
			// adiciona jogadores
			var p1:Personagem = new Personagem("monstro");
			addChild(p1);
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
	}

}