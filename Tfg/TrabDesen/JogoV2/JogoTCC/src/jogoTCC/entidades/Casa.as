package jogoTCC.entidades
{
	
	import jogoTCC.estrutura.Partida;
	import starling.display.Quad;
	import flash.geom.Matrix;
	import starling.display.DisplayObject;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import flash.geom.Point;
	
	public class Casa extends Quad
	{
		// matriz de transforcao que aplica  perspectiva isometrica
		private var matrizTransformacao:Matrix = new Matrix();
		
		// caracteristicas e atributos da casa
		private var TAMANHO_CASA:Number = 32;
		
		// variaveis para controle do pathfinder
		public var ehPassavel:Boolean = true;
		public var f:Number = 0;
		public var g:Number = 0;
		public var h:Number = 0;
		public var casaPai:Casa;
		public var casaLE:Casa;
		public var casaTR:Casa;
		public var casaFR:Casa;
		public var casaLD:Casa;
		public var casaD1:Casa;
		public var casaD2:Casa;
		public var casaD3:Casa;
		public var casaD4:Casa;
		
		public var l:Number;
		public var c:Number;
		
		public var camada:Number;
		public var direc:String;
		
		public var nrTime:Number;
		
		public function Casa(posX:Number, posY:Number, inicioX:Number, inicioY:Number, alpha:Number, c:Number, l:Number)
		{
			this.l = l;
			this.c = c;
			
			if (c == 10 && l == 0 || c == 11 && l == 0 || c == 10 && l == 1 || c == 11 && l == 1 || c == 12 && l == 0 || c == 12 && l == 1)
			{
				ehPassavel = false;
				nrTime = 0;
			}
			
			if (c == 10 && l == 21 || c == 11 && l == 21 || c == 12 && l == 21 || c == 10 && l == 23 || c == 11 && l == 23 || c == 12 && l == 23 || c == 10 && l == 22 || c == 11 && l == 22 || c == 12 && l == 22)
			{
				ehPassavel = false;
				nrTime = 1;
			}
			
			matrizTransformacao.rotate(Math.PI / 4);
			matrizTransformacao.scale(2.0, 1);
			
			super(TAMANHO_CASA, TAMANHO_CASA);
			
			super.transformationMatrix = matrizTransformacao;
			
			super.color = 0xFF444F;
			
			super.x = inicioX + (posX * 45) + (45 * posY);
			super.y = inicioY - (posX * 22) + (22 * posY);
			super.alpha = alpha;
			addEventListener(TouchEvent.TOUCH, controlaEventos);
		
		}
		
		private function controlaEventos(e:TouchEvent):void
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
						var partida:Partida = c.parent.parent as Partida;
						var perso:Personagem = partida.personagemMarcado as Personagem;
						if (this.ehPassavel)
						{
							
							if (perso != null)
								perso.setLocalPersonagem(c);
						}
						else
						{
							if (perso != null)
								partida.mapa.atacaTorre(this, perso);
						}
					}
				}
				
			}
		}
	
	}

}
