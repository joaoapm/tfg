package jogoTCC.moduloIA
{
	import jogoTCC.entidades.Mapa;
	import jogoTCC.entidades.Personagem;
	import jogoTCC.estrutura.AtributoFuzzy;
	import jogoTCC.estrutura.ExpressaoFuzzy;
	import jogoTCC.estrutura.GrupoFuzzy;
	
	public class ExpressoesIA
	{
		
		public function ExpressoesIA(listaExpre:Array, tipoExpressao:Number)
		{
			
			if (tipoExpressao == 0)
			{
				var expressao1:ExpressaoFuzzy = new ExpressaoFuzzy("SE PERSON_AOREDOR = ALTO E DISTANCIA_T1_TORRE1 = ALTO ENTAO MOVE_ATACA_INI");
				var expressao2:ExpressaoFuzzy = new ExpressaoFuzzy("SE PERSON_AOREDOR = MEDIO E DISTANCIA_T1_TORRE1 = ALTO ENTAO MOVE_ATACA_INI");
				var expressao3:ExpressaoFuzzy = new ExpressaoFuzzy("SE PERSON_AOREDOR = BAIXO E DISTANCIA_T1_TORRE1 = ALTO ENTAO MOVE_ATACA_INI");
				
				var expressao4:ExpressaoFuzzy = new ExpressaoFuzzy("SE PERSON_AOREDOR = ALTO E DISTANCIA_T1_TORRE1 = MEDIO ENTAO MOVE_ATACA_TORRE_INI");
				var expressao5:ExpressaoFuzzy = new ExpressaoFuzzy("SE PERSON_AOREDOR = MEDIO E DISTANCIA_T1_TORRE1 = MEDIO ENTAO MOVE_ATACA_INI");
				var expressao6:ExpressaoFuzzy = new ExpressaoFuzzy("SE PERSON_AOREDOR = BAIXO E DISTANCIA_T1_TORRE1 = MEDIO ENTAO MOVE_ATACA_TORRE_INI");
				
				var expressao7:ExpressaoFuzzy = new ExpressaoFuzzy("SE DISTANCIA_T1_TORRE1 = BAIXO E VIDA_TORRE_INI = BAIXO ENTAO MOVE_ATACA_INI");
				var expressao8:ExpressaoFuzzy = new ExpressaoFuzzy("SE DISTANCIA_T1_TORRE1 = MEDIO E VIDA_TORRE_INI = BAIXO ENTAO MOVE_ATACA_TORRE_INI");
				
				var expressao9:ExpressaoFuzzy = new ExpressaoFuzzy("SE DISTANCIA_T1_TORRE1 = BAIXO E VIDA_TORRE_INI = BAIXO ENTAO MOVE_ATACA_TORRE_INI");
				
				listaExpre.push(expressao1);
				listaExpre.push(expressao2);
				listaExpre.push(expressao3);
				listaExpre.push(expressao4);
				listaExpre.push(expressao5);
				listaExpre.push(expressao6);
				listaExpre.push(expressao7);
				listaExpre.push(expressao8);
				listaExpre.push(expressao9);
			}
			else if (tipoExpressao == 1)
			{
				
				var expressao10:ExpressaoFuzzy = new ExpressaoFuzzy("SE VIDA_TORRE = ALTO E VIDA_TORRE_INI = ALTO ENTAO TIME_ATAQUE ");
				
				var expressao11:ExpressaoFuzzy = new ExpressaoFuzzy("SE VIDA_TORRE = BAIXO E VIDA_TORRE_INI = ALTO ENTAO TIME_DEFESA ");
				var expressao12:ExpressaoFuzzy = new ExpressaoFuzzy("SE VIDA_TORRE = BAIXO E VIDA_TORRE_INI = MEDIO ENTAO TIME_DEFESA ");
				var expressao13:ExpressaoFuzzy = new ExpressaoFuzzy("SE VIDA_TORRE = BAIXO E VIDA_TORRE_INI = BAIXO ENTAO TIME_DEFESA ");
				
				listaExpre.push(expressao10);
				listaExpre.push(expressao11);
				listaExpre.push(expressao12);
				listaExpre.push(expressao13);
			}
			 else if (tipoExpressao == 2)
			{
				
				var expressao14:ExpressaoFuzzy = new ExpressaoFuzzy("SE VIDA_P_T1 = ALTO E VIDA_P_T2 = ALTO ENTAO ATACA_INI ");
				var expressao15:ExpressaoFuzzy = new ExpressaoFuzzy("SE VIDA_P_T1 = ALTO E VIDA_P_T2 = BAIXO ENTAO ATACA_INI ");
				var expressao16:ExpressaoFuzzy = new ExpressaoFuzzy("SE VIDA_P_T1 = ALTO E VIDA_P_T2 = MEDIO ENTAO ATACA_INI ");
				
				var expressao17:ExpressaoFuzzy = new ExpressaoFuzzy("SE VIDA_P_T1 = BAIXO E VIDA_P_T2 = ALTO ENTAO ATACA_INI ");
				var expressao18:ExpressaoFuzzy = new ExpressaoFuzzy("SE VIDA_P_T1 = BAIXO E VIDA_P_T2 = BAIXO ENTAO ATACA_INI ");
				var expressao19:ExpressaoFuzzy = new ExpressaoFuzzy("SE VIDA_P_T1 = BAIXO E VIDA_P_T2 = MEDIO ENTAO MOVE_TORRE_INI ");
				
				var expressao20:ExpressaoFuzzy = new ExpressaoFuzzy("SE VIDA_P_T1 = MEDIO E VIDA_P_T2 = ALTO ENTAO MOVE_TORRE_INI ");
				var expressao21:ExpressaoFuzzy = new ExpressaoFuzzy("SE VIDA_P_T1 = MEDIO E VIDA_P_T2 = BAIXO ENTAO MOVE_TORRE_INI ");
				var expressao22:ExpressaoFuzzy = new ExpressaoFuzzy("SE VIDA_P_T1 = MEDIO E VIDA_P_T2 = MEDIO ENTAO ATACA_INI ");
				
				
				listaExpre.push(expressao14);
				listaExpre.push(expressao15);
				listaExpre.push(expressao16);
				listaExpre.push(expressao17);
				listaExpre.push(expressao18);
				listaExpre.push(expressao19);
				listaExpre.push(expressao20);
				listaExpre.push(expressao21);
				listaExpre.push(expressao22);
			}
		}
	
	}

}
