package jogoTCC.entidades
{
	import jogoTCC.modelo.TipoJogador;
	import jogoTCC.util.CarregaAssets;
	import starling.animation.Juggler;
	import starling.display.Sprite;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	import starling.display.MovieClip;
	import starling.core.Starling;
	
	public class Personagem extends Sprite
	{
		
		private var tipoJogador:String;
		private var mvAndandoD1:MovieClip;
		
		public function Personagem(tipoJogador:String)
		{
			
			this.tipoJogador = tipoJogador;
			
			mvAndandoD1 = carregaAnimacao(mvAndandoD1, 8, "andandoFR", "andando", tipoJogador);
			
		}
		
		private function carregaAnimacao(movieClip:MovieClip, nrFrames:Number, nomeAnimacao:String, nomeAtlas:String, tpPeson:String):MovieClip
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