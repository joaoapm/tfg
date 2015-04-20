package jogoTCC.entidades
{
	
	import jogoTCC.entidades.Casa;
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	import flash.display.Bitmap;
	import starling.textures.Texture;
	import starling.display.Image;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.events.Event;
	import flash.geom.Point;
	
	public class Mapa extends Sprite
	{
		
		private var INICIO_X:Number = 250;
		private var INICIO_Y:Number = 150;
		private var ALPHA:Number = 1;
		public var personagemMarcado:Object;
		
		[Embed(source="../../../assets/mapa/mapa.png")]
		private var MAPA:Class;
		
		public function Mapa()
		{
			
			iniciaImagemMapa();
			iniciaCasas();
			
			var p1:Personagem = new Personagem("monstro");
			addChild(p1);
		
		}
		
		private function iniciaImagemMapa():void
		{
			var bitmap:Bitmap = new MAPA();
			var textura:Texture = Texture.fromBitmap(new MAPA());
			var imagem:Image = new Image(textura);
			
			imagem.x -= 750;
			imagem.y -= 200;
			
			imagem.scaleX = 1.5;
			imagem.scaleY = 1.5;
			addChild(imagem);
		}
		
		private function touchHandler(e:TouchEvent):void
		{
			var touch:Touch = e.getTouch(stage);
			if (touch != null)
			{
				var position:Point = touch.getLocation(stage);
				var target:DisplayObject = e.target as DisplayObject;
				
				if (touch.phase == TouchPhase.ENDED)
				{
					if (target as Casa)
					{
						var c:Casa = target as Casa;
					}
				}
			}
		}
		
		private function iniciaCasas():void
		{
			
			var casa:Casa;
			for (var i:Number = 0; i < 24; i++)
			{
				for (var j:Number = 0; j < 24; j++)
				{
					casa = new Casa(i, j, INICIO_X, INICIO_Y, ALPHA);
					casa.addEventListener(TouchEvent.TOUCH, touchHandler);
					addChild(casa);
				}
			}
		}
	
	}

}