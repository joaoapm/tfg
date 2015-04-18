package jogoTCC
{
	
	/**
	 * ...
	 * @author
	 */
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.display.Shape;
	
	public class Mapa extends Sprite
	{
		
		public function Mapa()
		{ var i:int; 
			for ( i = 0; i < 5;i++){
			var circle:Shape = new Shape();
			circle.graphics.beginFill(0x990000, 1); // Fill the circle with the color 990000
			circle.graphics.lineStyle(2, 0x000000); // Give the ellipse a black, 2 pixels thick line
			circle.graphics.drawRect(300,  (110 + (i * 50)), 50 , 50); // Draw the circle, assigning it a x position, y position, raidius.
			circle.graphics.endFill(); // End the filling of the circle
			circle.skewX = 0.3;
			circle.rotation = 0.8;
			
			addChild(circle); // Add a child
			
			}
		}
	
	}

}