package jogoTCC.moduloIA {
	import jogoTCC.entidades.Mapa;
	import jogoTCC.entidades.Personagem;
	import jogoTCC.estrutura.AtributoFuzzy;
	import jogoTCC.estrutura.GrupoFuzzy;
	import jogoTCC.estrutura.ExpressaoFuzzy;
	
	public class PrincipalIA {
		
		private var executaAcao:ExecutaAcaoIA;
		
		private var listaGrupos:Array = new Array();
		private var listaExpressoesJogadores:Array = new Array();
		private var listaExpressoesTime:Array = new Array();
		
		public var exprRetorno:ExpressaoFuzzy;
		public var exprRetornoTime:ExpressaoFuzzy;
		
		public var grupos:GruposIA;
		
		public function PrincipalIA() {
			grupos = new GruposIA(listaGrupos);
			var expressoes:ExpressoesIA = new ExpressoesIA(listaExpressoesJogadores,0); 
			var expressoesTime:ExpressoesIA = new ExpressoesIA(listaExpressoesTime,1);
		}
		
		public function processarPesonagem(persoAoRedor:Number, distT1Torre1:Number, vidaTorre:Number, vidaTorreIni:Number, vidaPerso:Number, iniVida:Number):void {
			
			// fase de fuzzificacao dos valores de entrada			
			fuzzificar(grupos.PERSON_AOREDOR, persoAoRedor);
			fuzzificar(grupos.DISTANCIA_T1_TORRE1, distT1Torre1);
			fuzzificar(grupos.VIDA_TORRE, vidaTorre);
			fuzzificar(grupos.VIDA_TORRE_INI, vidaTorreIni);
			fuzzificar(grupos.VIDA_PERSO, vidaPerso);
			fuzzificar(grupos.INI_ATQ_VIDA, iniVida);
			
			// fase de inferencia das regras
			realizaInferencia(listaExpressoesJogadores);
			
			// fase de defuzzificacao e realizadao da decisao retornada
			exprRetorno = defuzzificar(listaExpressoesJogadores);
 
		}
		
		public function processarTime(vidaTorre:Number, vidaTorreIni:Number):void {
			
			// fase de fuzzificacao dos valores de entrada			
			fuzzificar(grupos.VIDA_TORRE, vidaTorre);
			fuzzificar(grupos.VIDA_TORRE_INI, vidaTorreIni);
			
			// fase de inferencia das regras
			realizaInferencia(listaExpressoesTime);
			
			// fase de defuzzificacao e realizadao da decisao retornada
			exprRetornoTime = defuzzificar(listaExpressoesTime);			
 
		}		
		
		private function fuzzificar(gp:GrupoFuzzy, vlEntrada:Number):void {
			gp.baixo.vlAtual = calculaGrauPertinencia(gp.baixo, vlEntrada);
			gp.medio.vlAtual = calculaGrauPertinencia(gp.medio, vlEntrada);
			gp.alto.vlAtual = calculaGrauPertinencia(gp.alto, vlEntrada);
		}
		
		private function calculaGrauPertinencia(atrib:AtributoFuzzy, vlEntrada:Number):Number {
			
			if (vlEntrada < atrib.inicio || vlEntrada > atrib.fim) {
				return 0;
			} else {
				
				var d1:Number = (Math.abs((vlEntrada - atrib.inicio)) / Math.abs((atrib.meio - atrib.inicio)));
				var d2:Number = (Math.abs((atrib.fim - vlEntrada)) / Math.abs((atrib.fim - atrib.meio)));
				
				var d3:Number = d1 < d2 ? d1 : d2;
				var d4:Number = d3 > 0 ? d3 : 0;
				
				return d4;
			}
		
		}
		
		private function realizaInferencia(lista:Array):void {
			for each (var expr:ExpressaoFuzzy in lista) {
				var listaExp:Array = expr.expressao.split(" ");
				
				expr.grau1 = avaliaExpressao(listaExp[1], listaExp[3]);
				expr.grau2 = avaliaExpressao(listaExp[5], listaExp[7]);
				
				expr.grau = Math.max(expr.grau1, expr.grau2);
				expr.metodoExecuta = listaExp[9];
			}
		
		}
		
		private function avaliaExpressao(n1:String, n2:String):Number {
			
			if (grupos.DISTANCIA_T1_TORRE1.nome == n1)
				return calculaGrauExpressao(grupos.DISTANCIA_T1_TORRE1, n2);
			
			if (grupos.VIDA_PERSO.nome == n1)
				return calculaGrauExpressao(grupos.VIDA_PERSO, n2);
			
			if (grupos.VIDA_TORRE_INI.nome == n1)
				return calculaGrauExpressao(grupos.VIDA_TORRE_INI, n2);
			
			if (grupos.VIDA_TORRE.nome == n1)
				return calculaGrauExpressao(grupos.VIDA_TORRE, n2);
			
			if (grupos.INI_ATQ_VIDA.nome == n1)
				return calculaGrauExpressao(grupos.INI_ATQ_VIDA, n2);
			
			return null;
		}
		
		private function calculaGrauExpressao(gp:GrupoFuzzy, nomeAtrib:String):Number {
			if (gp.baixo.nomeAtrib == nomeAtrib)
				return gp.baixo.vlAtual;
			if (gp.medio.nomeAtrib == nomeAtrib)
				return gp.medio.vlAtual;
			if (gp.alto.nomeAtrib == nomeAtrib)
				return gp.alto.vlAtual;
			
			return null;
		}
		
		private function defuzzificar(lista:Array):ExpressaoFuzzy {
			var maiorGrau:ExpressaoFuzzy;
			for each (var exp:ExpressaoFuzzy in lista) {
				//trace(exp.expressao + ": " + exp.grau);
				if (maiorGrau == null) {
					maiorGrau = exp;
				} else {
					if (exp.grau > maiorGrau.grau) {
						maiorGrau = exp;
					}
				}
			}
			
			trace(maiorGrau.expressao + ": " + maiorGrau.grau);
			
			return maiorGrau;
		}
	
	}

}
