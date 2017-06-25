package jogoTCC.estrutura {
	
	import flash.display.Bitmap;
	import flash.display.FrameLabel;
	import jogoTCC.entidades.MenuControle;
	import starling.display.Sprite;
	import starling.textures.Texture;
	import starling.display.Image;
	import starling.display.Button;
	import starling.events.Event;
	import starling.text.TextField;
	
	public class TelaInicial extends Sprite {
		
		// instancia variavel com imagem do mapa
		[Embed(source = "../../../assets/telaInicial/telaInicial.png")]
		private var telanicial:Class;
		
		[Embed(source = "../../../assets/telaInicial/bt1.png")]
		private static const texturaBt1:Class;
		
		[Embed(source = "../../../assets/telaInicial/bt2.png")]
		private static const texturaBt2:Class;
		
		[Embed(source = "../../../assets/telaInicial/bt3.png")]
		private static const texturaBt3:Class;
		
		public function TelaInicial() {
			// adiciona imagem do mapa
			var bitmap:Bitmap = new telanicial();
			var textura:Texture = Texture.fromBitmap(new telanicial());
			var imagem:Image = new Image(textura);
			
			addChild(imagem);
			
			// adiciona botao aleatorio
			var imgBt1:Bitmap = new texturaBt1();
			var textureBt1:Texture = Texture.fromBitmap(imgBt1);
			var bt1:Button = new Button(textureBt1, "");
			
			bt1.y = 525;
			bt1.x = 200;
			//addChild(bt1);
			
			// adiciona botao fuzzy
			var imgBt2:Bitmap = new texturaBt2();
			var textureBt2:Texture = Texture.fromBitmap(imgBt2);
			var bt2:Button = new Button(textureBt2, "");
			
			bt2.y = 525;
			bt2.x = 670;
			
			bt2.addEventListener(Event.TRIGGERED, bt1Pressionado);
			
			addChild(bt2);
			
			// adiciona botao ia vs ia
			var imgBt3:Bitmap = new texturaBt3();
			var textureBt3:Texture = Texture.fromBitmap(imgBt3);
			var bt3:Button = new Button(textureBt3, "");
			
			bt3.y = 525;
			bt3.x = 540;
			
			bt3.addEventListener(Event.TRIGGERED, bt3Pressionado);
			
			addChild(bt3);
			
			var versao:TextField = new TextField(50, 50, "v0.10");
			
			addChild(versao);
		
		}
		
		private function bt1Pressionado(event:Event):void {
			parent.dispose();
			
			var partida:Partida = new Partida();
			
			addChild(partida);
		}
		
		private function bt3Pressionado(event:Event):void {
			parent.dispose();
			
			var partida:Partida = new Partida();
			partida.isIaVsIa = true;
							
			addChild(partida);
			
			var menuControle:MenuControle = new MenuControle(partida);
			
			addChild(menuControle);
			
			partida.iniciaIaVsIa();
		}
	
	}

}
