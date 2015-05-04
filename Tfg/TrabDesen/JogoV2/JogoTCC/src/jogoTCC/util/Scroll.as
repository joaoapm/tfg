package jogoTCC.util
{
	
	import starling.display.Sprite;
	import flash.geom.Point;
	import jogoTCC.entidades.Casa;
	import jogoTCC.estrutura.Partida;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	
	public class Scroll extends Sprite
	{
		// variaveis para controle do scroll da tela
		private var moveMapaD:Boolean = false;
		private var moveMapaE:Boolean = false;
		private var moveMapaC:Boolean = false;
		private var moveMapaB:Boolean = false;
		
		private var VEL_SCROLLX:Number = 10;
		private var VEL_SCROLLY:Number = 5;
		
		private var POS_PARTIDAX:Number = -320;
		private var POS_PARTIDAY:Number = -160;
		
		private var posicaoMapa:Point = new Point();
		
		private var partida:Partida;
		
		public function Scroll(partida:Partida):void
		{
			this.partida = partida;
		}
		
		public function inciaScroll():void
		{
			// adiciona controle de eventos  a partida
			this.partida.addEventListener(TouchEvent.TOUCH, posMouse);
			this.partida.addEventListener(Event.ENTER_FRAME, scrollMapa);
			
			this.partida.x = POS_PARTIDAX;
			this.partida.y = POS_PARTIDAY;
		}
		
		private function scrollMapa(e:Event):void
		{
			if (moveMapaD)
			{
				if (this.parent.x < 0 && this.parent.y < 0)
				{
					this.parent.x += VEL_SCROLLX;
					this.parent.y += VEL_SCROLLY;
				}
			}
			else if (moveMapaE)
			{
				var partida:Partida = this.parent as Partida;
				if (partida.mapa.x > -800)
				{
					if (this.parent.x > -1100 && this.parent.y > -1100)
					{
						this.parent.x -= VEL_SCROLLX;
						this.parent.y -= VEL_SCROLLY;
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
