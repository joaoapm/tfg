package jogoTCC.entidades
{
	import starling.display.Sprite;
	import flash.display.Bitmap;
	import starling.textures.Texture;
	import starling.display.Image;
	
	public class BarraVida extends Sprite
	{
		
		// instancia variavel com imagem do mapa
		[Embed(source="../../../assets/personagens/barraVida/1.png")]
		private var vida1:Class;
		
		[Embed(source="../../../assets/personagens/barraVida/2.png")]
		private var vida2:Class;
		
		[Embed(source="../../../assets/personagens/barraVida/3.png")]
		private var vida3:Class;
		
		[Embed(source="../../../assets/personagens/barraVida/4.png")]
		private var vida4:Class;
		
		[Embed(source="../../../assets/personagens/barraVida/5.png")]
		private var vida5:Class;
		
		[Embed(source="../../../assets/personagens/barraVida/6.png")]
		private var vida6:Class;
		
		private var bitmap:Bitmap;
		private var textura:Texture;
		
		public  var imgVida1:Image;
		public  var imgVida2:Image;
		public  var imgVida3:Image;
		public  var imgVida4:Image;
		public  var imgVida5:Image;
		public  var imgVida6:Image;
		
		public function BarraVida()
		{
			if (imgVida1 == null)
				imgVida1 = criaBarraVida(vida1);
			if (imgVida2 == null)
				imgVida2 = criaBarraVida(vida2);
			if (imgVida3 == null)
				imgVida3 = criaBarraVida(vida3);
			if (imgVida4 == null)
				imgVida4 = criaBarraVida(vida4);
			if (imgVida5 == null)
				imgVida5 = criaBarraVida(vida5);
			if (imgVida6 == null)
				imgVida6 = criaBarraVida(vida6);
		}
		
		private function criaBarraVida(img:Class):Image
		{
			bitmap = new img();
			textura = Texture.fromBitmap(new img());
			
			var imagem:Image = new Image(textura);
			imagem.height -= 10;
			imagem.width -= 40;
			return imagem;
		}
	
	}

}