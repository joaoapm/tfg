package jogoTCC.util
{
	import jogoTCC.entidades.Asset;
	
	public class CarregaAssets
	{
		
		[Embed(source="../../../assets/personagens/monstro/monstro_andando.xml",mimeType="application/octet-stream")]
		public static const atlasDescr:Class;
		
		[Embed(source="../../../assets/personagens/monstro/monstro_andando.png")]
		public static const atlasImagem:Class;
		
		public var listaAssestAtlasDescr:Vector.<Asset> = new Vector.<Asset>();
		public var listaAssestAtlasImagem:Vector.<Asset> = new Vector.<Asset>();
		
		public function CarregaAssets()
		{
			var assetAndandoDescr:Asset = new Asset("monstro_andando", atlasDescr);
			var assetAndandoImagem:Asset = new Asset("monstro_andando", atlasImagem);
			
			listaAssestAtlasDescr.push(assetAndandoDescr);
			listaAssestAtlasImagem.push(assetAndandoImagem);
		
		}
		
		public function buscaAssetDescr(nome:String):Class
		{
			
			return buscaAsset(listaAssestAtlasDescr, nome).getAsset();
		}
		
		public function buscaAssetImagem(nome:String):Class
		{
			return buscaAsset(listaAssestAtlasImagem, nome).getAsset();
		}
		
		public function buscaAsset(lista:Vector.<Asset>, nome:String):Asset
		{
			var i:Number = 0;
			for (i = 0; i < lista.length; i++)
			{
				if (lista[i].getNomeAsset() == nome)
					return lista[i];
			}
			return null;
		}
	
	}

}