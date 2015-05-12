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
			
			iniciaGrupo(PERSON_AOREDOR, "PERSON_AOREDOR", 0, 4, 2, 5, 4, 8);
			iniciaGrupo(DISTANCIA_T1_TORRE1, "DISTANCIA_T1_TORRE1", 0, 8, 6, 14, 12, 20);
			iniciaGrupo(VIDA_TORRE, "VIDA_TORRE", 0, 4, 3, 7, 6, 10);
			iniciaGrupo(VIDA_TORRE_INI, "VIDA_TORRE_INI", 0, 4, 3, 7, 6, 10);
			iniciaGrupo(VIDA_PERSO, "VIDA_PERSO", 0, 3, 2, 4, 3, 6);
			iniciaGrupo(INI_ATQ_VIDA, "INI_ATQ_VIDA", 0, 3, 2, 4, 3, 6);
			
			listaGrupos.push(PERSON_AOREDOR);
			listaGrupos.push(DISTANCIA_T1_TORRE1);
			listaGrupos.push(VIDA_TORRE);
			listaGrupos.push(VIDA_TORRE_INI);
			listaGrupos.push(VIDA_PERSO);
			listaGrupos.push(INI_ATQ_VIDA);
		}
		
		private function iniciaGrupo(GPFZ:GrupoFuzzy, nomeGr:String, bIni:Number, bFim:Number, mIni:Number, mFim:Number, aIni:Number, aFim:Number):void
		{
			GPFZ = new GrupoFuzzy(nomeGr);
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
		}
	
	}

}
