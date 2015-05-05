package jogoTCC.util
{
	import jogoTCC.modelo.Textura;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	import starling.display.MovieClip;
	
	public class CarregaAnimacao
	{
		public var assets:CarregaAssets = new CarregaAssets();
		private static var listaTexturas:Array = new Array();
		
		public function CarregaAnimacao()
		{
			listaTexturas.push(new Textura(Texture.fromEmbeddedAsset(assets.buscaAssetImagem("monstro_andando")), "monstro_andando"));
			listaTexturas.push(new Textura(Texture.fromEmbeddedAsset(assets.buscaAssetImagem("monstro_atacando")), "monstro_atacando"));
			listaTexturas.push(new Textura(Texture.fromEmbeddedAsset(assets.buscaAssetImagem("monstro_morrendo")), "monstro_morrendo"));
			listaTexturas.push(new Textura(Texture.fromEmbeddedAsset(assets.buscaAssetImagem("monstro_parado")), "monstro_parado"));
			
			listaTexturas.push(new Textura(Texture.fromEmbeddedAsset(assets.buscaAssetImagem("guerreiro_andando")), "guerreiro_andando"));
			listaTexturas.push(new Textura(Texture.fromEmbeddedAsset(assets.buscaAssetImagem("guerreiro_atacando")), "guerreiro_atacando"));
			listaTexturas.push(new Textura(Texture.fromEmbeddedAsset(assets.buscaAssetImagem("guerreiro_morrendo")), "guerreiro_morrendo"));
			listaTexturas.push(new Textura(Texture.fromEmbeddedAsset(assets.buscaAssetImagem("guerreiro_parado")), "guerreiro_parado"));
		
		}
		
		public function carregaAnimacao(movieClip:MovieClip, nrFrames:Number, nomeAnimacao:String, nomeAtlas:String, tpPeson:String):MovieClip
		{
			
			nomeAtlas = tpPeson + "_" + nomeAtlas;
			
			var listaFrames:Vector.<Texture> = new Vector.<Texture>();
			
			if (texture != null)
				texture.dispose();
			
			var texture:Texture = procuraTextura(nomeAtlas).texture;
			
			var objXml:Class = assets.buscaAssetDescr(nomeAtlas);
			var xml:XML = XML(new objXml());
			
			var atlas:TextureAtlas = new TextureAtlas(texture, xml);
			
			var i:Number;
			var frame:String = "";
			
			for (i = 1; i <= nrFrames; i++)
			{
				if (i <= 9)
					frame = "0" + i.toString();
				else
					frame = i.toString();
				listaFrames.push(atlas.getTexture(nomeAnimacao + " 00" + frame + ".png"));
			}
			
			movieClip = new MovieClip(listaFrames);
			movieClip.loop = true;
			
			return movieClip;
		
		}
		
		private function procuraTextura(nomeAtlas:String):Textura
		{
			for each (var tex:Textura in listaTexturas)
			{
				if (tex.nomeAtlas == nomeAtlas)
					return tex;
			}
			return null;
		}
	
	}

}