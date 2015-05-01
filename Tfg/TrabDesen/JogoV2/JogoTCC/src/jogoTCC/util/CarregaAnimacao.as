package jogoTCC.util
{
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	import starling.display.MovieClip;
	
	public class CarregaAnimacao
	{
		
		public function CarregaAnimacao()
		{
		
		}
		
		public function carregaAnimacao(movieClip:MovieClip, nrFrames:Number, nomeAnimacao:String, nomeAtlas:String, tpPeson:String):MovieClip
		{
			
			nomeAtlas = tpPeson + "_" + nomeAtlas;
			
			var assets:CarregaAssets = new CarregaAssets();
			var listaFrames:Vector.<Texture> = new Vector.<Texture>();
			
			var texture:Texture = Texture.fromEmbeddedAsset(assets.buscaAssetImagem(nomeAtlas));
			
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
	
	}

}