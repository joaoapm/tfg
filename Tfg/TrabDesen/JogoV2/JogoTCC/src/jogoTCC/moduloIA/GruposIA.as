package jogoTCC.moduloIA {
	import jogoTCC.entidades.Mapa;
	import jogoTCC.entidades.Personagem;
	import jogoTCC.estrutura.AtributoFuzzy;
	import jogoTCC.estrutura.GrupoFuzzy;
	
	public class GruposIA {
		
		private var BAIXO:AtributoFuzzy;
		private var MEDIO:AtributoFuzzy;
		private var ALTO:AtributoFuzzy;
		
		public var PERSON_AOREDOR:GrupoFuzzy;
		public var DISTANCIA_T1_TORRE1:GrupoFuzzy;
		public var VIDA_TORRE:GrupoFuzzy;
		public var VIDA_TORRE_INI:GrupoFuzzy;
		public var VIDA_PERSO:GrupoFuzzy;
		public var INI_ATQ_VIDA:GrupoFuzzy;
		
		public var VIDA_P_T1:GrupoFuzzy;
		public var VIDA_P_T2:GrupoFuzzy;
		
		public function GruposIA(listaGrupos:Array) {
			
			PERSON_AOREDOR = iniciaGrupo("PERSON_AOREDOR", 0, 1, 2, 1, 2, 4, 3, 5, 6);
			DISTANCIA_T1_TORRE1 = iniciaGrupo("DISTANCIA_T1_TORRE1", 0, 4, 8, 9, 15, 18, 19, 25, 28);
			VIDA_TORRE = iniciaGrupo("VIDA_TORRE", 0, 2, 4,   3, 5, 6,  7, 10, 11);			
			VIDA_TORRE_INI = iniciaGrupo("VIDA_TORRE_INI", 0, 2, 4, 3, 5, 7, 6, 10, 11);			
			VIDA_PERSO = iniciaGrupo("VIDA_PERSO", 0, 2, 4, 3, 5, 7, 6, 10, 11);
			INI_ATQ_VIDA = iniciaGrupo("INI_ATQ_VIDA", 0, 2, 4, 3, 5, 7, 6, 10, 11);
			VIDA_P_T1 = iniciaGrupo("VIDA_P_T1", 0, 1, 2, 1, 2, 4, 3, 5, 6);
			VIDA_P_T2 = iniciaGrupo("VIDA_P_T2", 0, 1, 2, 1, 2, 4, 3, 5, 6);	
		
		}
		
		private function iniciaGrupo(nomeGr:String, bIni:Number, bMeio:Number, bFim:Number, mIni:Number, mMeio:Number, mFim:Number, aIni:Number, aMeio:Number, aFim:Number):GrupoFuzzy {
			
			var GPFZ:GrupoFuzzy = new GrupoFuzzy(nomeGr);
			
			BAIXO = new AtributoFuzzy();
			BAIXO.nomeAtrib = "BAIXO";
			BAIXO.inicio = bIni;
			BAIXO.fim = bFim;
			BAIXO.meio = bMeio;
			
			MEDIO = new AtributoFuzzy();
			MEDIO.nomeAtrib = "MEDIO";
			MEDIO.inicio = mIni
			MEDIO.fim = mFim;
			MEDIO.meio = mMeio;
			
			ALTO = new AtributoFuzzy();
			ALTO.nomeAtrib = "ALTO";
			ALTO.inicio = aIni;
			ALTO.fim = aFim;
			ALTO.meio = aMeio;
			
			GPFZ.baixo = BAIXO;
			GPFZ.medio = MEDIO;
			GPFZ.alto = ALTO;
			
			return GPFZ;
		
		}
	
	}

}
