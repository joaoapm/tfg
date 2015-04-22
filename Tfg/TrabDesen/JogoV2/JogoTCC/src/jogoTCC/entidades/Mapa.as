package jogoTCC.entidades
{
	
	import jogoTCC.entidades.Casa;
	import starling.display.Sprite;
	import flash.display.Bitmap;
	import starling.textures.Texture;
	import starling.display.Image;
	
	public class Mapa extends Sprite
	{
		
		// variaveis de controle da criacao das casas
		private var INICIO_X:Number = 45
		private var INICIO_Y:Number = 500;
		private var ALPHA:Number = 0.05;
		
		// instancia variavel com imagem do mapa
		[Embed(source="../../../assets/mapa/mapa.png")]
		private var MAPA:Class;
		
		public function Mapa()
		{
			iniciaImagemMapa();
			iniciaCasas();
		}
		
		private function iniciaImagemMapa():void
		{
			// adiciona imagem do mapa
			var bitmap:Bitmap = new MAPA();
			var textura:Texture = Texture.fromBitmap(new MAPA());
			var imagem:Image = new Image(textura);
			
			imagem.x = 0;
			imagem.y = -65;
			
			imagem.scaleX = 1.5;
			imagem.scaleY = 1.5;
			addChild(imagem);
		}
		
		private function iniciaCasas():void
		{
			// cria casas
			var casa:Casa;
			for (var i:Number = 0; i < 19; i++)
			{
				for (var j:Number = 0; j < 24; j++)
				{
					casa = new Casa(i, j, INICIO_X, INICIO_Y, ALPHA);
					addChild(casa);
				}
			}
		}
	
	}

}