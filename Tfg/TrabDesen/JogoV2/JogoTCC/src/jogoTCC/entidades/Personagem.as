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
		private var mvAndandoD2:MovieClip;
		private var mvAndandoD3:MovieClip;
		private var mvAndandoD4:MovieClip;
		
		private var mvAtacandoD1:MovieClip;
		private var mvAtacandoD2:MovieClip;
		private var mvAtacandoD3:MovieClip;
		private var mvAtacandoD4:MovieClip;
		
		private var mvMorrendoD1:MovieClip;
		private var mvMorrendoD2:MovieClip;
		private var mvMorrendoD3:MovieClip;
		private var mvMorrendoD4:MovieClip;
		
		private var mvParadoD1:MovieClip;
		private var mvParadoD2:MovieClip;
		private var mvParadoD3:MovieClip;
		private var mvParadoD4:MovieClip;
		
		private var mvAndandoFR:MovieClip;
		private var mvAndandoTR:MovieClip;
		private var mvAndandoLD:MovieClip;
		private var mvAndandoLE:MovieClip;
		
		private var mvAtacandoFR:MovieClip;
		private var mvAtacandoTR:MovieClip;
		private var mvAtacandoLD:MovieClip;
		private var mvAtacandoLE:MovieClip;
		
		private var mvMorrendoFR:MovieClip;
		private var mvMorrendoTR:MovieClip;
		private var mvMorrendoLD:MovieClip;
		private var mvMorrendoLE:MovieClip;
		
		private var mvParadoFR:MovieClip;
		private var mvParadoTR:MovieClip;
		private var mvParadoLD:MovieClip;
		private var mvParadoLE:MovieClip;
		
		public function Personagem(tipoJogador:String)
		{
			// inicializa animacoes
			this.tipoJogador = tipoJogador;
			
			mvAndandoD1 = carregaAnimacao(mvAndandoD1, 8, "andandoD1", "andando", tipoJogador);
			mvAndandoD2 = carregaAnimacao(mvAndandoD1, 8, "andandoD2", "andando", tipoJogador);
			mvAndandoD3 = carregaAnimacao(mvAndandoD1, 8, "andandoD3", "andando", tipoJogador);
			mvAndandoD4 = carregaAnimacao(mvAndandoD1, 8, "andandoD4", "andando", tipoJogador);
			
			mvAtacandoD1 = carregaAnimacao(mvAtacandoD1, 13, "ataqueD1", "atacando", tipoJogador);
			mvAtacandoD2 = carregaAnimacao(mvAtacandoD2, 13, "ataqueD2", "atacando", tipoJogador);
			mvAtacandoD3 = carregaAnimacao(mvAtacandoD3, 13, "ataqueD3", "atacando", tipoJogador);
			mvAtacandoD4 = carregaAnimacao(mvAtacandoD4, 13, "ataqueD4", "atacando", tipoJogador);
			
			mvMorrendoD1 = carregaAnimacao(mvMorrendoD1, 11, "morrendoD1", "morrendo", tipoJogador);
			mvMorrendoD2 = carregaAnimacao(mvMorrendoD2, 11, "morrendoD2", "morrendo", tipoJogador);
			mvMorrendoD3 = carregaAnimacao(mvMorrendoD3, 11, "morrendoD3", "morrendo", tipoJogador);
			mvMorrendoD4 = carregaAnimacao(mvMorrendoD4, 11, "morrendoD4", "morrendo", tipoJogador);
			
			mvParadoD1 = carregaAnimacao(mvParadoD1, 13, "paradoD1", "parado", tipoJogador);
			mvParadoD2 = carregaAnimacao(mvParadoD2, 13, "paradoD2", "parado", tipoJogador);
			mvParadoD3 = carregaAnimacao(mvParadoD3, 13, "paradoD3", "parado", tipoJogador);
			mvParadoD4 = carregaAnimacao(mvParadoD4, 13, "paradoD4", "parado", tipoJogador);
			
			mvAndandoFR = carregaAnimacao(mvAndandoFR, 8, "andandoFR", "andando", tipoJogador);
			mvAndandoTR = carregaAnimacao(mvAndandoTR, 8, "andandoTR", "andando", tipoJogador);
			mvAndandoLE = carregaAnimacao(mvAndandoLE, 8, "andandoLE", "andando", tipoJogador);
			mvAndandoLD = carregaAnimacao(mvAndandoLD, 8, "andandoLD", "andando", tipoJogador);
			
			mvAtacandoFR = carregaAnimacao(mvAtacandoFR, 13, "ataqueFR", "atacando", tipoJogador);
			mvAtacandoTR = carregaAnimacao(mvAtacandoTR, 13, "ataqueTR", "atacando", tipoJogador);
			mvAtacandoLE = carregaAnimacao(mvAtacandoLE, 13, "ataqueLE", "atacando", tipoJogador);
			mvAtacandoLD = carregaAnimacao(mvAtacandoLD, 13, "ataqueLD", "atacando", tipoJogador);
			
			mvMorrendoFR = carregaAnimacao(mvMorrendoFR, 11, "morrendoFR", "morrendo", tipoJogador);
			mvMorrendoTR = carregaAnimacao(mvMorrendoTR, 11, "morrendoTR", "morrendo", tipoJogador);
			mvMorrendoLE = carregaAnimacao(mvMorrendoLE, 11, "morrendoLE", "morrendo", tipoJogador);
			mvMorrendoLD = carregaAnimacao(mvMorrendoLD, 11, "morrendoLD", "morrendo", tipoJogador);
			
			mvParadoFR = carregaAnimacao(mvParadoFR, 13, "paradoFR", "parado", tipoJogador);
			mvParadoTR = carregaAnimacao(mvParadoTR, 13, "paradoTR", "parado", tipoJogador);
			mvParadoLE = carregaAnimacao(mvParadoLE, 13, "paradoLE", "parado", tipoJogador);
			mvParadoLD = carregaAnimacao(mvParadoLD, 13, "paradoLD", "parado", tipoJogador);
			
			addChild(mvAndandoFR);
			mvAndandoFR.play();
			Starling.juggler.add(mvAndandoFR);
		
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