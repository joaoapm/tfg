package jogoTCC.estrutura
{
	
	import flash.display.Bitmap;
	import starling.display.Sprite;
	import starling.textures.Texture;
	import starling.display.Image;
	import starling.display.Button;
	import starling.events.Event;
	
	public class TelaFinal extends Sprite
	{
		
		// instancia variavel com imagem final
		[Embed(source="../../../assets/telaFinal/vence1.png")]
		private var time0Vence:Class;
		
		[Embed(source="../../../assets/telaFinal/vence2.png")]
		private var time1Vence:Class;
		private var textura:Texture;
		private var imagem:Image;
		
		public function TelaInicial():void
		{
		
		}
		
		public function criaTela(timeVence:String):void
		{
			var bitmap:Bitmap;
			
			if (timeVence == "time1")
			{
				// adiciona imagem do mapa
				bitmap = new time0Vence();
				var textura:Texture = Texture.fromBitmap(new time0Vence());
				var imagem:Image = new Image(textura);
				
				addChild(imagem);
				
			}
			else if (timeVence == "time2")
			{
				bitmap = new time1Vence();
				textura = Texture.fromBitmap(new time1Vence());
				imagem = new Image(textura);
				
				addChild(imagem);
				 
			}
		}
	}

}
