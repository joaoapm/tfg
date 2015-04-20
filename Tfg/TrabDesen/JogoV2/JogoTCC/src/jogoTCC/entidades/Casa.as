package jogoTCC.entidades
{
	
	import starling.display.Quad;
	import flash.geom.Matrix;
	
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
			
			super.color = Math.random() * 0xFFFFFF;
			super.x = (inicioX + (posX * TAMANHO_CASA));
			super.y = (inicioY + (posY * TAMANHO_CASA));
		
		}
	
	}

}