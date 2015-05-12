package jogoTCC.moduloIA
{
	import jogoTCC.entidades.Mapa;
	import jogoTCC.entidades.Personagem;
	import jogoTCC.estrutura.AtributoFuzzy;
	import jogoTCC.estrutura.ExpressaoFuzzy;
	import jogoTCC.estrutura.GrupoFuzzy;
	
	public class ExpressoesIA
	{
		
		public function ExpressoesIA(listaExpre:Array)
		{ 
			
			var expressao:ExpressaoFuzzy = new ExpressaoFuzzy("SE PERSON_AOREDOR = ALTO E DISTANCIA_T1_TORRE1 = ALTO ENTAO ATACA_PERSONAGEM");
			var expressao2:ExpressaoFuzzy = new ExpressaoFuzzy("SE PERSON_AOREDOR = BAIXO E DISTANCIA_T1_TORRE1 = ALTO ENTAO MOVE_TORRE_INI");
			var expressao3:ExpressaoFuzzy = new ExpressaoFuzzy("SE PERSON_AOREDOR = MEDIO E DISTANCIA_T1_TORRE1 = ALTO ENTAO MOVE_TORRE_INI");
			
			var expressao4:ExpressaoFuzzy = new ExpressaoFuzzy("SE PERSON_AOREDOR = BAIXO E DISTANCIA_T1_TORRE1 = BAIXO ENTAO MOVE_ATACA_TORRE_INI");
			var expressao5:ExpressaoFuzzy = new ExpressaoFuzzy("SE PERSON_AOREDOR = MEDIO E DISTANCIA_T1_TORRE1 = BAIXO ENTAO MOVE_ATACA_TORRE_INI");
			var expressao6:ExpressaoFuzzy = new ExpressaoFuzzy("SE PERSON_AOREDOR = ALTO E DISTANCIA_T1_TORRE1 = BAIXO ENTAO MOVE_ATACA_TORRE_INI");
			
			var expressao7:ExpressaoFuzzy = new ExpressaoFuzzy("SE PERSON_AOREDOR = BAIXO E VIDA_TORRE = BAIXO ENTAO MOVE_DEFESA");
			var expressao8:ExpressaoFuzzy = new ExpressaoFuzzy("SE PERSON_AOREDOR = MEDIO E VIDA_TORRE = BAIXO ENTAO MOVE_DEFESA");
			var expressao9:ExpressaoFuzzy = new ExpressaoFuzzy("SE PERSON_AOREDOR = ALTO E VIDA_TORRE = BAIXO ENTAO MOVE_DEFESA");			
			
			var expressao10:ExpressaoFuzzy = new ExpressaoFuzzy("SE PERSON_AOREDOR = BAIXO E VIDA_TORRE_INI = BAIXO ENTAO MOVE_ATACA_TORRE_INI");
			var expressao11:ExpressaoFuzzy = new ExpressaoFuzzy("SE PERSON_AOREDOR = MEDIO E VIDA_TORRE_INI = BAIXO ENTAO MOVE_ATACA_TORRE_INI");
			var expressao12:ExpressaoFuzzy = new ExpressaoFuzzy("SE PERSON_AOREDOR = ALTO E VIDA_TORRE_INI = BAIXO ENTAO MOVE_ATACA_TORRE_INI");	
			
			var expressao13:ExpressaoFuzzy = new ExpressaoFuzzy("SE PERSON_AOREDOR = BAIXO E INI_ATQ_VIDA = BAIXO ENTAO MOVE_ATACA_INI");
			var expressao14:ExpressaoFuzzy = new ExpressaoFuzzy("SE PERSON_AOREDOR = MEDIO E INI_ATQ_VIDA = BAIXO ENTAO MOVE_ATACA_INI");
			var expressao15:ExpressaoFuzzy = new ExpressaoFuzzy("SE PERSON_AOREDOR = ALTO E INI_ATQ_VIDA = BAIXO ENTAO MOVE_ATACA_INI");	
			
			var expressao16:ExpressaoFuzzy = new ExpressaoFuzzy("SE VIDA_PERSO = BAIXO E INI_ATQ_VIDA = BAIXO ENTAO MOVE_TORRE_INI");
			var expressao17:ExpressaoFuzzy = new ExpressaoFuzzy("SE VIDA_PERSO = MEDIO E INI_ATQ_VIDA = BAIXO ENTAO MOVE_TORRE_INI");
			var expressao18:ExpressaoFuzzy = new ExpressaoFuzzy("SE VIDA_PERSO = ALTO E INI_ATQ_VIDA = BAIXO ENTAO MOVE_TORRE_INI");
			
			listaExpre.push(expressao);
			listaExpre.push(expressao2);
			listaExpre.push(expressao3);
			listaExpre.push(expressao4);
			listaExpre.push(expressao5);
			listaExpre.push(expressao6);
			listaExpre.push(expressao7);
			listaExpre.push(expressao8);
			listaExpre.push(expressao9);
			listaExpre.push(expressao10);
			listaExpre.push(expressao11);
			listaExpre.push(expressao12);
			listaExpre.push(expressao13);
			listaExpre.push(expressao14);
			listaExpre.push(expressao15);
			listaExpre.push(expressao16);
			listaExpre.push(expressao17);
			listaExpre.push(expressao18);
			
		}
	
	}
 
}
