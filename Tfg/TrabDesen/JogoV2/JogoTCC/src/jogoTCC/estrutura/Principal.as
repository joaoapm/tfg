package jogoTCC.estrutura
{
	import flash.display.Sprite;
	import jogoTCC.estrutura.Partida;
	import starling.core.Starling;
	
	import starling.display.Quad;
	[SWF(width="800",height="600",frameRate="60",backgroundColor="#ffffff")]
	
	public class Principal extends Sprite
	{
		private var _starling:Starling
		
		public function Principal()
		{
			stage.quality = "HIGH";
			_starling = new Starling(TelaInicial, stage);
			_starling.antiAliasing = 40;
			
			_starling.start();
		
		}
	
	}

}