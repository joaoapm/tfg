package jogoTCC.entidades
{
	
	import starling.display.Quad;
	import flash.geom.Matrix;
	import starling.display.DisplayObject;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.events.Event;
	import flash.geom.Point;
	
	public class Casa extends Quad
	{
		
		private var matrizTransformacao:Matrix = new Matrix();
		
		private var TAMANHO_CASA:Number = 32;
		
		public var nomeC:String = "casinha";
		
		public function Casa(posX:Number, posY:Number, inicioX:Number, inicioY:Number, alpha:Number)
		{
			matrizTransformacao.rotate(Math.PI / 4);
			matrizTransformacao.scale(2.0, 1);
			
			super(TAMANHO_CASA, TAMANHO_CASA);
			
			super.transformationMatrix = matrizTransformacao;
			
			super.color = 0xF30F0F;
			super.x = inicioX + (posX * 45) + (45 * posY);
			super.y = inicioY - (posX * 22) + (22 * posY);
			super.alpha = alpha;
			addEventListener(TouchEvent.TOUCH, touchHandler);
		
		}
		
		private function touchHandler(e:TouchEvent):void
		{
			var touch:Touch = e.getTouch(stage);
			if (touch != null)
			{
				var position:Point = touch.getLocation(stage);
				var target:DisplayObject = e.target as DisplayObject;
				
				if (touch.phase == TouchPhase.ENDED)
				{
					if (target as Casa)
					{
						var c:Casa = target as Casa;
						trace(c.x);
						c.x += 1;
					}
				}
			}
		}
	
	}

}