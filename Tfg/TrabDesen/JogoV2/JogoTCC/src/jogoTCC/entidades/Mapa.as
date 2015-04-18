package jogoTCC.entidades
{
	
	import jogoTCC.entidades.Casa;
	import starling.display.Sprite;
	
	public class Mapa extends Sprite
	{
		
		private var INICIO_X:Number = 100;
		private var INICIO_Y:Number = -310;
		private var ALPHA:Number = .01;
		
		public function Mapa()
		{
			var i:int;
			var j:int;
			
			var casa:Casa;
			
			for (i = 0; i < 24; i++)
			{
				for (j = 0; j < 24; j++)
				{
					casa = new Casa(i, j, INICIO_X, INICIO_Y, ALPHA);
					
					addChild(casa);
				}
			}
		}
	
	}

}