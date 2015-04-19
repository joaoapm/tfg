package jogoTCC.entidades
{
	import jogoTCC.util.CarregaAssets;
	import starling.animation.Juggler;
	import starling.display.Sprite;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	import starling.display.MovieClip;
	import starling.core.Starling;
	
	public class Personagem extends Sprite
	{
		
		private var mvAndandoD1:MovieClip;
		
		public function Personagem()
		{
			mvAndandoD1 = carregaAnimacao(mvAndandoD1, 8, "andandoFR");
			
			addChild(mvAndandoD1);
			mvAndandoD1.play();
			Starling.juggler.add(mvAndandoD1);
		}
		
		private function carregaAnimacao(movieClip:MovieClip, nrFrames:Number, nomeAnimacao:String):MovieClip
		{
			
			var assets:CarregaAssets = new CarregaAssets();
			var listaFrames:Vector.<Texture> = new Vector.<Texture>();
			
			var texture:Texture = Texture.fromEmbeddedAsset(assets.buscaAssetImagem("monstro_andando"));
			
			var objXml:Class = assets.buscaAssetDescr("monstro_andando");
			var xml:XML = XML(new objXml());
			
			var atlas:TextureAtlas = new TextureAtlas(texture, xml);
			
			var i:Number;
			var frame:String = "";
			
			for (i = 1; i <= nrFrames; i++)
			{
				if (i < 9)
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