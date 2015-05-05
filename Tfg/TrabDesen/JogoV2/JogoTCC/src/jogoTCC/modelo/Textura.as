package jogoTCC.modelo
{
	import starling.textures.Texture;
	
	public class Textura
	{
		public var texture:Texture;
		
		public var nomeAtlas:String;
		
		public function Textura(textura:Texture, nome:String)
		{
			texture = textura;
			nomeAtlas = nome;
		}
	
	}

}