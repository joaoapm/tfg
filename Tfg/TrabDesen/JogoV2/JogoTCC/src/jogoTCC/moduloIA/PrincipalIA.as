package jogoTCC.moduloIA
{
	import jogoTCC.entidades.Mapa;
	import jogoTCC.entidades.Personagem;
	import jogoTCC.estrutura.AtributoFuzzy;
	import jogoTCC.estrutura.GrupoFuzzy;
	
	public class PrincipalIA
	{
		private var mapa:Mapa;
		private var listaPersonagens:Array;
		private var persoTime0:Array = new Array();
		private var persoTime1:Array = new Array();
		
		public function PrincipalIA(mapa:Mapa, listaPerso:Array)
		{
			this.mapa = mapa;
			this.listaPersonagens = listaPerso;
			
			for each (var p:Personagem in this.listaPersonagens)
			{
				if (p.time == 0)
					persoTime0.push(p)
				else
					persoTime1.push(p)
			}
			
			//QTD_PERSONAGEM_INI
			var QTD_PERSONAGEM_INI:GrupoFuzzy = new GrupoFuzzy();
			var BAIXO_QTD_PERSONAGEM_INI:AtributoFuzzy = new AtributoFuzzy();
			BAIXO_QTD_PERSONAGEM_INI.inicio = 0;
			BAIXO_QTD_PERSONAGEM_INI.fim = 3;
			var MEDIO_QTD_PERSONAGEM_INI:AtributoFuzzy = new AtributoFuzzy();
			MEDIO_QTD_PERSONAGEM_INI.inicio = 2;
			MEDIO_QTD_PERSONAGEM_INI.fim = 4;
			var ALTO_QTD_PERSONAGEM_INI:AtributoFuzzy = new AtributoFuzzy();
			ALTO_QTD_PERSONAGEM_INI.inicio = 3;
			ALTO_QTD_PERSONAGEM_INI.fim = -1;
			QTD_PERSONAGEM_INI.baixo = BAIXO_QTD_PERSONAGEM_INI;
			QTD_PERSONAGEM_INI.medio = MEDIO_QTD_PERSONAGEM_INI;
			QTD_PERSONAGEM_INI.alto = ALTO_QTD_PERSONAGEM_INI;
			
			//PERSON_AOREDOR
			var PERSON_AOREDOR:GrupoFuzzy = new GrupoFuzzy();
			var BAIXO_PERSON_AOREDOR:AtributoFuzzy = new AtributoFuzzy();
			BAIXO_PERSON_AOREDOR.inicio = 0;
			BAIXO_PERSON_AOREDOR.fim = 3;
			var MEDIO_PERSON_AOREDOR:AtributoFuzzy = new AtributoFuzzy();
			MEDIO_PERSON_AOREDOR.inicio = 2;
			MEDIO_PERSON_AOREDOR.fim = 4;
			var ALTO_PERSON_AOREDOR:AtributoFuzzy = new AtributoFuzzy();
			ALTO_PERSON_AOREDOR.inicio = 3;
			ALTO_PERSON_AOREDOR.fim = -1;
			PERSON_AOREDOR.baixo = BAIXO_PERSON_AOREDOR;
			PERSON_AOREDOR.medio = MEDIO_PERSON_AOREDOR;
			PERSON_AOREDOR.alto = ALTO_PERSON_AOREDOR;
			
			//DISTANCIA_T1_TORRE1
			var DISTANCIA_T1_TORRE1:GrupoFuzzy = new GrupoFuzzy();
			var BAIXO_DISTANCIA_T1_TORRE1:AtributoFuzzy = new AtributoFuzzy();
			BAIXO_DISTANCIA_T1_TORRE1.inicio = 0;
			BAIXO_DISTANCIA_T1_TORRE1.fim = 7;
			var MEDIO_DISTANCIA_T1_TORRE1:AtributoFuzzy = new AtributoFuzzy();
			MEDIO_DISTANCIA_T1_TORRE1.inicio = 6;
			MEDIO_DISTANCIA_T1_TORRE1.fim = 12;
			var ALTO_DISTANCIA_T1_TORRE1:AtributoFuzzy = new AtributoFuzzy();
			ALTO_DISTANCIA_T1_TORRE1.inicio = 10;
			ALTO_DISTANCIA_T1_TORRE1.fim = -1;
			PERSON_AOREDOR.baixo = BAIXO_DISTANCIA_T1_TORRE1;
			PERSON_AOREDOR.medio = MEDIO_DISTANCIA_T1_TORRE1;
			PERSON_AOREDOR.alto = ALTO_DISTANCIA_T1_TORRE1;
		
		}
		
		public function processaJogada():void
		{
		
		}
		
		private function fizzificar():void
		{
		
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