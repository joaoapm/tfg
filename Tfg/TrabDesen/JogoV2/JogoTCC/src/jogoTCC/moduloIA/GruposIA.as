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
		
		public var QTD_PERSONAGEM_INI:GrupoFuzzy;
		public var PERSON_AOREDOR:GrupoFuzzy;
		public var DISTANCIA_T1_TORRE1:GrupoFuzzy;
		
		public function GruposIA(listaGrupos:Array)
		{
			
			//QTD_PERSONAGEM_INI
			QTD_PERSONAGEM_INI = new GrupoFuzzy("QTD_PERSONAGEM_INI");
			BAIXO = new AtributoFuzzy();
			BAIXO.nomeAtrib = "BAIXO";
			BAIXO.inicio = 0;
			BAIXO.fim = 4;
			MEDIO = new AtributoFuzzy();
			MEDIO.nomeAtrib = "MEDIO";
			MEDIO.inicio = 2;
			MEDIO.fim = 5;
			ALTO = new AtributoFuzzy();
			ALTO.nomeAtrib = "ALTO";
			ALTO.inicio = 4;
			ALTO.fim = 8;
			QTD_PERSONAGEM_INI.baixo = BAIXO;
			QTD_PERSONAGEM_INI.medio = MEDIO;
			QTD_PERSONAGEM_INI.alto = ALTO;
			
			//PERSON_AOREDOR
			PERSON_AOREDOR = new GrupoFuzzy("PERSON_AOREDOR");
			BAIXO = new AtributoFuzzy();
			BAIXO.nomeAtrib = "BAIXO";
			BAIXO.inicio = 0;
			BAIXO.fim = 4;
			MEDIO = new AtributoFuzzy();
			MEDIO.nomeAtrib = "MEDIO";
			MEDIO.inicio = 2;
			MEDIO.fim = 5;
			ALTO = new AtributoFuzzy();
			ALTO.nomeAtrib = "ALTO";
			ALTO.inicio = 4;
			ALTO.fim = 8;
			PERSON_AOREDOR.baixo = BAIXO;
			PERSON_AOREDOR.medio = MEDIO;
			PERSON_AOREDOR.alto = ALTO;
			
			//DISTANCIA_T1_TORRE1
			DISTANCIA_T1_TORRE1 = new GrupoFuzzy("DISTANCIA_T1_TORRE1");
			BAIXO = new AtributoFuzzy();
			BAIXO.nomeAtrib = "BAIXO";
			BAIXO.inicio = 0;
			BAIXO.fim = 8;
			MEDIO = new AtributoFuzzy();
			MEDIO.nomeAtrib = "MEDIO";
			MEDIO.inicio = 6;
			MEDIO.fim = 14;
			ALTO = new AtributoFuzzy();
			ALTO.nomeAtrib = "ALTO";
			ALTO.inicio = 12;
			ALTO.fim = 20;
			DISTANCIA_T1_TORRE1.baixo = BAIXO;
			DISTANCIA_T1_TORRE1.medio = MEDIO;
			DISTANCIA_T1_TORRE1.alto = ALTO;
			
			listaGrupos.push(QTD_PERSONAGEM_INI);
			listaGrupos.push(PERSON_AOREDOR);
			listaGrupos.push(DISTANCIA_T1_TORRE1);
		
		}
	
	}

/*
   QTD_PERSONAGEM_INI (BAIXO 0-3, MEIO 2-4, ALTO 3-*)
   QTD_PERSONAGEM_ALI  (BAIXO 0-3, MEIO 2-4, ALTO 3-*)

   DISTANCIA_T0_TORRE1 (BAIXO 0-7, MEIO 6-12, ALTO 10-*)
   DISTANCIA_T0_TORRE2  (BAIXO 0-7, MEIO 6-12, ALTO 10-*)

   DISTANCIA_T1_TORRE1  (BAIXO 0-7, MEIO 6-12, ALTO 10-*)
   DISTANCIA_T1_TORRE2  (BAIXO 0-7, MEIO 6-12, ALTO 10-*)

   PERSON_AOREDOR  (BAIXO 0-3, MEIO 2-4, ALTO 3-*)




   SE (PERSON_AOREDOR = ALTO) E (DISTANCIA_T1_TORRE1 = ALTO) ENTAO ATACA_PERSONAGEM
   SE (PERSON_AOREDOR = MEDIO) E (DISTANCIA_T1_TORRE1 = MEDIO) ENTAO ATACA_PERSONAGEM

   SE (PERSON_AOREDOR = BAIXO) E (DISTANCIA_T1_TORRE1 = ALTO) ENTAO MOVE_DIRECAO_TORRE_0
   SE (PERSON_AOREDOR = MEDIO) E (DISTANCIA_T1_TORRE1 = ALTO) ENTAO MOVE_DIRECAO_TORRE_0
   SE (PERSON_AOREDOR = BAIXO) E (DISTANCIA_T1_TORRE1 = MEDIO) ENTAO MOVE_DIRECAO_TORRE_0
   SE (PERSON_AOREDOR = MEDIO) E (DISTANCIA_T1_TORRE1 = MEDIO) ENTAO MOVE_DIRECAO_TORRE_0

   SE (QTD_PERSONAGEM_INI = BAIXO) E (DISTANCIA_T1_TORRE1 = MEDIO) MOVE_DIRECAO_TORRE_0

   SE (DISTANCIA_T1_TORRE1 = BAIXO)  ENTAO ATACA_TORRE
 */
}
