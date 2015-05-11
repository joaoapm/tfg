package jogoTCC.moduloIA
{
	import jogoTCC.entidades.Mapa;
	import jogoTCC.entidades.Personagem;
	import jogoTCC.estrutura.AtributoFuzzy;
	import jogoTCC.estrutura.GrupoFuzzy;
	
	public class ExecutaAcaoIA
	{
		
		private var mapa:Mapa;
		private var listaPersonagens:Array;
		private var persoTime0:Array = new Array();
		private var persoTime1:Array = new Array();
		
		public function ExecutaAcaoIA(mapa:Mapa, listaPerso:Array):void
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
		
		}
		
		public function ATACA_PERSONAGEM():void
		{
		
		}
	
	}

/*


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
