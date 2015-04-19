package jogoTCC.util
{
	import jogoTCC.entidades.Asset;
	
	public class CarregaAssets
	{
		
		// Carrega descritores dos sprites
		
		[Embed(source="../../../assets/personagens/monstro/monstro_andando.xml",mimeType="application/octet-stream")]
		public static const atlasDescrMonstroAndando:Class;
		
		[Embed(source="../../../assets/personagens/monstro/monstro_atacando.xml",mimeType="application/octet-stream")]
		public static const atlasDescrMonstroAtacando:Class;
		
		[Embed(source="../../../assets/personagens/monstro/monstro_morrendo.xml",mimeType="application/octet-stream")]
		public static const atlasDescrMonstroMorrendo:Class;
		
		[Embed(source="../../../assets/personagens/monstro/monstro_parado.xml",mimeType="application/octet-stream")]
		public static const atlasDescrMonstroParado:Class;
		
		[Embed(source="../../../assets/personagens/guerreiro/guerreiro_andando.xml",mimeType="application/octet-stream")]
		public static const atlasDescrGuerreiroAndando:Class;
		
		[Embed(source="../../../assets/personagens/guerreiro/guerreiro_atacando.xml",mimeType="application/octet-stream")]
		public static const atlasDescrGuerreiroAtacando:Class;
		
		[Embed(source="../../../assets/personagens/guerreiro/guerreiro_morrendo.xml",mimeType="application/octet-stream")]
		public static const atlasDescrGuerreiroMorrendo:Class;
		
		[Embed(source="../../../assets/personagens/guerreiro/guerreiro_parado.xml",mimeType="application/octet-stream")]
		public static const atlasDescrGuerreiroParado:Class;
		
		// Carrega a textura dos sprites
		
		[Embed(source="../../../assets/personagens/monstro/monstro_andando.png")]
		public static const atlasImagemMonstroAndando:Class;
		
		[Embed(source="../../../assets/personagens/monstro/monstro_atacando.png")]
		public static const atlasImagemMonstroAtacando:Class;
		
		[Embed(source="../../../assets/personagens/monstro/monstro_morrendo.png")]
		public static const atlasImagemMonstroMorrendo:Class;
		
		[Embed(source="../../../assets/personagens/monstro/monstro_parado.png")]
		public static const atlasImagemMonstroParado:Class;
		
		[Embed(source="../../../assets/personagens/guerreiro/guerreiro_andando.png")]
		public static const atlasImagemGuerreiroAndando:Class;
		
		[Embed(source="../../../assets/personagens/guerreiro/guerreiro_atacando.png")]
		public static const atlasImagemGuerreiroAtacando:Class;
		
		[Embed(source="../../../assets/personagens/guerreiro/guerreiro_morrendo.png")]
		public static const atlasImagemGuerreiroMorrendo:Class;
		
		[Embed(source="../../../assets/personagens/guerreiro/guerreiro_parado.png")]
		public static const atlasImagemGuerreiroParado:Class;
		
		public var listaAssestAtlasDescr:Vector.<Asset> = new Vector.<Asset>();
		public var listaAssestAtlasImagem:Vector.<Asset> = new Vector.<Asset>();
		
		public function CarregaAssets()
		{
			var assetDescrMonstroAndando:Asset = new Asset("monstro_andando", atlasDescrMonstroAndando);
			var assetDescrMonstroAtacando:Asset = new Asset("monstro_atacando", atlasDescrMonstroAtacando);
			var assetDescrMonstroMorrendo:Asset = new Asset("monstro_morrendo", atlasDescrMonstroMorrendo);
			var assetDescrMonstroParado:Asset = new Asset("monstro_parado", atlasDescrGuerreiroParado);
			var assetDescrGuerreiroAndando:Asset = new Asset("guerreiro_andando", atlasDescrGuerreiroAndando);
			var assetDescrGuerreiroAtacando:Asset = new Asset("guerreiro_atacando", atlasDescrGuerreiroAtacando);
			var assetDescrGuerreiroMorrendo:Asset = new Asset("guerreiro_morrendo", atlasDescrGuerreiroMorrendo);
			var assetDescrGuerreiroParado:Asset = new Asset("guerreiro_parado", atlasDescrGuerreiroParado);
			
			var assetImagemMonstroAndando:Asset = new Asset("monstro_andando", atlasImagemMonstroAndando);
			var assetImagemMonstroAtacando:Asset = new Asset("monstro_atacando", atlasImagemMonstroAtacando);
			var assetImagemMonstroMorrendo:Asset = new Asset("monstro_morrendo", atlasImagemMonstroMorrendo);
			var assetImagemMonstroParado:Asset = new Asset("monstro_parado", atlasImagemMonstroParado);
			var assetImagemGuerreiroAndando:Asset = new Asset("guerreiro_andando", atlasImagemGuerreiroAndando);
			var assetImagemGuerreiroAtacando:Asset = new Asset("guerreiro_atacando", atlasImagemGuerreiroAtacando);
			var assetImagemGuerreiroMorrendo:Asset = new Asset("guerreiro_morrendo", atlasImagemGuerreiroMorrendo);
			var assetImagemGuerreiroParado:Asset = new Asset("guerreiro_parado", atlasImagemGuerreiroParado);
			
			listaAssestAtlasDescr.push(assetDescrMonstroAndando);
			listaAssestAtlasDescr.push(assetDescrMonstroAtacando);
			listaAssestAtlasDescr.push(assetDescrMonstroMorrendo);
			listaAssestAtlasDescr.push(assetDescrMonstroParado);
			listaAssestAtlasDescr.push(assetDescrGuerreiroAndando);
			listaAssestAtlasDescr.push(assetDescrGuerreiroAtacando);
			listaAssestAtlasDescr.push(assetDescrGuerreiroMorrendo);
			listaAssestAtlasDescr.push(assetDescrGuerreiroParado);
			
			listaAssestAtlasImagem.push(assetImagemMonstroAndando);
			listaAssestAtlasImagem.push(assetImagemMonstroAtacando);
			listaAssestAtlasImagem.push(assetImagemMonstroParado);
			listaAssestAtlasImagem.push(assetImagemMonstroMorrendo);
			listaAssestAtlasImagem.push(assetImagemGuerreiroAndando);
			listaAssestAtlasImagem.push(assetImagemGuerreiroAtacando);
			listaAssestAtlasImagem.push(assetImagemGuerreiroMorrendo);
			listaAssestAtlasImagem.push(assetImagemGuerreiroParado);
		
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