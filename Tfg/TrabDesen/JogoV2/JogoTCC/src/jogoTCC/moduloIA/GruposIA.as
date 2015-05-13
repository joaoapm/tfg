package jogoTCC.moduloIA
{
	import jogoTCC.entidades.Mapa;
	import jogoTCC.entidades.Personagem;
	import jogoTCC.estrutura.AtributoFuzzy;
	import jogoTCC.estrutura.GrupoFuzzy;
	
	public class GruposIA
	{
		
		private var BAIXO:AtributoFuzzy;
		private var MEDIO:AtributoFuzzy;
		private var ALTO:AtributoFuzzy;
		
		public var PERSON_AOREDOR:GrupoFuzzy;
		public var DISTANCIA_T1_TORRE1:GrupoFuzzy;
		public var VIDA_TORRE:GrupoFuzzy;
		public var VIDA_TORRE_INI:GrupoFuzzy;
		public var VIDA_PERSO:GrupoFuzzy;
		public var INI_ATQ_VIDA:GrupoFuzzy;
		
		public function GruposIA(listaGrupos:Array)
		{
			
			PERSON_AOREDOR = iniciaGrupo("PERSON_AOREDOR", 0, 4, 2, 5, 4, 8);
			DISTANCIA_T1_TORRE1 = iniciaGrupo("DISTANCIA_T1_TORRE1", 0, 8, 6, 14, 12, 20);
			VIDA_TORRE = iniciaGrupo("VIDA_TORRE", 0, 4, 3, 7, 6, 10);
			VIDA_TORRE_INI = iniciaGrupo("VIDA_TORRE_INI", 0, 4, 3, 7, 6, 10);
			VIDA_PERSO = iniciaGrupo("VIDA_PERSO", 0, 3, 2, 4, 3, 6);
			INI_ATQ_VIDA = iniciaGrupo("INI_ATQ_VIDA", 0, 3, 2, 4, 3, 6);
		
		}
		
		private function iniciaGrupo(nomeGr:String, bIni:Number, bFim:Number, mIni:Number, mFim:Number, aIni:Number, aFim:Number):GrupoFuzzy
		{
			var GPFZ:GrupoFuzzy = new GrupoFuzzy(nomeGr);
			BAIXO = new AtributoFuzzy();
			BAIXO.nomeAtrib = "BAIXO";
			BAIXO.inicio = bIni;
			BAIXO.fim = bFim;
			MEDIO = new AtributoFuzzy();
			MEDIO.nomeAtrib = "MEDIO";
			MEDIO.inicio = mIni
			MEDIO.fim = mFim;
			ALTO = new AtributoFuzzy();
			ALTO.nomeAtrib = "ALTO";
			ALTO.inicio = aIni;
			ALTO.fim = aFim;
			GPFZ.baixo = BAIXO;
			GPFZ.medio = MEDIO;
			GPFZ.alto = ALTO;
			
			return GPFZ;
		
		}
	
	}

}
