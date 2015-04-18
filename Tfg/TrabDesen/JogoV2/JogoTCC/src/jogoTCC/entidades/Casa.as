package jogoTCC.entidades
{
	
	import starling.display.Sprite;
	import starling.display.Shape;
	import flash.geom.Matrix;
	
	public class Casa extends starling.display.Shape
	{
		
		private var graficoCasa:Shape = new Shape();
		private var matrizTransformacao:Matrix = new Matrix();
		private var TAMANHO_CASA:Number = 38;
		
		public function Casa(posX:Number, posY:Number, inicioX:Number, inicioY:Number, alpha:Number)
		{
			matrizTransformacao.rotate(Math.PI / 4);
			matrizTransformacao.scale(2.0, 1);
			
			super.graphics.beginFill(0x990000, alpha);
			super.graphics.lineStyle(2, 0x000000);
			super.graphics.drawRect((inicioX + (posX * TAMANHO_CASA)), (inicioY + (posY * TAMANHO_CASA)), TAMANHO_CASA, TAMANHO_CASA);
			super.graphics.endFill();
			super.transformationMatrix = matrizTransformacao;
		}
	
	}

}