package jogoTCC
{
	import flash.display.Sprite;
	import starling.core.Starling;
	[SWF(width="800",height="600",frameRate="60",backgroundColor="#ffffff")]
	
	public class Main extends Sprite
	{
		   private var _starling:Starling
		public function Main()
		{
		 _starling = new Starling(Mapa, stage);
		 _starling.antiAliasing = 100;
		 
        _starling.start();
		}
	
	}

}