package jogoTCC.estrutura
{
	
	public class GrupoFuzzy
	{
		public var nome:String;
		public var baixo:AtributoFuzzy;
		public var medio:AtributoFuzzy;
		public var alto:AtributoFuzzy;
		
		public var vlExpre1:Number;
		public var vlExpre2:Number;
		
		public function GrupoFuzzy(nome:String)
		{
			this.nome = nome;
		}
	
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
 */
