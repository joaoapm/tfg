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
		
		[Embed(source="../../../assets/personagens/barraVida/c1.png")]
		private var vidac1:Class;
		
		[Embed(source="../../../assets/personagens/barraVida/c2.png")]
		private var vidac2:Class;
		
		[Embed(source="../../../assets/personagens/barraVida/c3.png")]
		private var vidac3:Class;
		
		[Embed(source="../../../assets/personagens/barraVida/c4.png")]
		private var vidac4:Class;
		
		[Embed(source="../../../assets/personagens/barraVida/c5.png")]
		private var vidac5:Class;
		
		[Embed(source="../../../assets/personagens/barraVida/c6.png")]
		private var vidac6:Class;
		
		[Embed(source="../../../assets/personagens/barraVida/c7.png")]
		private var vidac7:Class;
		
		[Embed(source="../../../assets/personagens/barraVida/c8.png")]
		private var vidac8:Class;
		
		[Embed(source="../../../assets/personagens/barraVida/c9.png")]
		private var vidac9:Class;
		
		[Embed(source="../../../assets/personagens/barraVida/c10.png")]
		private var vidac10:Class;
		
		private var bitmap:Bitmap;
		private var textura:Texture;
		
		public var imgVida1:Image;
		public var imgVida2:Image;
		public var imgVida3:Image;
		public var imgVida4:Image;
		public var imgVida5:Image;
		public var imgVida6:Image;
		
		public var imgVidac1:Image;
		public var imgVidac2:Image;
		public var imgVidac3:Image;
		public var imgVidac4:Image;
		public var imgVidac5:Image;
		public var imgVidac6:Image;
		public var imgVidac7:Image;
		public var imgVidac8:Image;
		public var imgVidac9:Image;
		public var imgVidac10:Image;
		
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
			
			if (imgVidac1 == null)
				imgVidac1 = criaBarraVida(vidac1);
			if (imgVidac2 == null)
				imgVidac2 = criaBarraVida(vidac2);
			if (imgVidac3 == null)
				imgVidac3 = criaBarraVida(vidac3);
			if (imgVidac4 == null)
				imgVidac4 = criaBarraVida(vidac4);
			if (imgVidac5 == null)
				imgVidac5 = criaBarraVida(vidac5);
			if (imgVidac6 == null)
				imgVidac6 = criaBarraVida(vidac6);
			if (imgVidac7 == null)
				imgVidac7 = criaBarraVida(vidac7);
			if (imgVidac8 == null)
				imgVidac8 = criaBarraVida(vidac8);
			if (imgVidac9 == null)
				imgVidac9 = criaBarraVida(vidac9);
			if (imgVidac10 == null)
				imgVidac10 = criaBarraVida(vidac10);
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