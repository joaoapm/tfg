package jogoTCC.entidades {
	
	import flash.display.Bitmap;
	import jogoTCC.estrutura.Partida;
	import starling.display.Button;
	import starling.display.Sprite;
	import starling.textures.Texture;
	import starling.events.Event;
	import starling.core.Starling;
	
	public class MenuControle extends Sprite {
		
		[Embed(source = "../../../assets/mapa/joga.png")]
		private static const texturaBtnJoga:Class;
		
		[Embed(source = "../../../assets/mapa/pause.png")]
		private static const texturaBtnPause:Class;
		
		private var partida:Partida;
		private var btnJoga:Button ;
		private var btnPause:Button ;
		
		public function MenuControle(partida:Partida) {
			this.partida = partida;
			adicionaMenuControle();
		}
		
		public function adicionaMenuControle():void {
			// adiciona botao pause
			var imgPause:Bitmap = new texturaBtnPause();
			var textPause:Texture = Texture.fromBitmap(imgPause);
			btnPause = new Button(textPause, "");
			
			btnPause.y = 20;
			btnPause.x = 20;
			
			btnPause.addEventListener(Event.TRIGGERED, btnPausePressionado);
			
			this.addChild(btnPause);
			
			
			// adiciona botao play
			var imgJoga:Bitmap = new texturaBtnJoga();
			var textJoga:Texture = Texture.fromBitmap(imgJoga);
			btnJoga = new Button(textJoga, "");
			
			btnJoga.y = 20;
			btnJoga.x = 20;
			
			btnJoga.addEventListener(Event.TRIGGERED, btnJogaPressionado);
			
			this.addChild(btnJoga);
			btnJoga.visible = false;
		
		}
		
		private function btnPausePressionado(event:Event):void {
			
			this.partida.isParado = true;
			
			btnPause.visible = false;
			btnJoga.visible = true;
		}
		
		private function btnJogaPressionado(event:Event):void {
			
			this.partida.isParado = false;
			
			btnPause.visible = !false;
			btnJoga.visible = !true;
			
			this.partida.trocaTurno();
		}
	
	}

}