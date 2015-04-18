package jogoTCC.entidades
{
	
	import jogoTCC.entidades.Casa;
	import starling.display.Sprite;
	import flash.display.Bitmap;
	import starling.textures.Texture;
	import starling.display.Image;
	
	public class Mapa extends Sprite
	{
		
		private var INICIO_X:Number = 300;
		private var INICIO_Y:Number = -610;
		private var ALPHA:Number = .01;
		
		[Embed(source="../../../assets/mapa.png")]
		private var MAPA:Class;
		
		public function Mapa()
		{
			iniciaImagemMapa();
			iniciaCasas();
		}
		
		private function iniciaImagemMapa():void
		{
			var bitmap:Bitmap = new MAPA();
			var textura:Texture = Texture.fromBitmap(new MAPA());
			var imagem:Image = new Image(textura);
			
			imagem.x = -10;
			imagem.y = 50;
			
			addChild(imagem);
		}
		
		private function iniciaCasas():void
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