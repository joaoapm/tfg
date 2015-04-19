package jogoTCC.util
{
	

	public class CarregaAssets
	{
		
		[Embed(source="../../../assets/personagens/monstro/monstro_andando.xml",mimeType="application/octet-stream")]
		public static const atlasDescr:Class;
		
		[Embed(source="../../../assets/personagens/monstro/monstro_andando.png")]
		public static const atlasImagem:Class;
	
		public var mapaAssestAtlasDescr:Object = new Object();
		public var mapaAssestAtlasImagem:Object = new Object();
				 
		public function CarregaAssets() {
			mapaAssestAtlasDescr["andando"] = atlasDescr;
			mapaAssestAtlasImagem["andando"] = atlasImagem;
		}
		
		public function buscaAssetDescr(nome:String):Class {
			return  mapaAssestAtlasDescr["andando"] ;
		}
		
		public function buscaAssetImagem(nome:String):Class {
			return mapaAssestAtlasImagem["andando"];
		}
		
	}

}