package jogoTCC.moduloIA
{
	import jogoTCC.entidades.Mapa;
	import jogoTCC.entidades.Personagem;
	import jogoTCC.estrutura.AtributoFuzzy;
	import jogoTCC.estrutura.GrupoFuzzy;
	import jogoTCC.estrutura.ExpressaoFuzzy;
	
	public class PrincipalIA
	{
		
		private var executaAcao:ExecutaAcaoIA;
		
		private var listaGrupos:Array = new Array();
		private var listaExpressoes:Array = new Array();
		
		public var grupos:GruposIA;
		
		public function PrincipalIA()
		{
			grupos = new GruposIA(listaGrupos);
			var expressoes:ExpressoesIA = new ExpressoesIA(listaExpressoes);
		}
		
		public function processar(vlEntradaQtdPerso:Number, persoAoRedor:Number, distT1Torre1:Number):ExpressaoFuzzy
		{
			
			// fase de fuzzificacao dos valores de entrada
			fuzzificar(grupos.QTD_PERSONAGEM_INI, vlEntradaQtdPerso);
			fuzzificar(grupos.PERSON_AOREDOR, persoAoRedor);
			fuzzificar(grupos.DISTANCIA_T1_TORRE1, distT1Torre1);
			
			// fase de inferencia das regras
			realizaInferencia();
			
			// fase de defuzzificacao e realizadao da decisao retornada
			return defuzzificar();
		
		}
		
		private function fuzzificar(gp:GrupoFuzzy, vlEntrada:Number):void
		{
			gp.baixo.vlAtual = calculaGrauPertinencia(gp.baixo, vlEntrada);
			gp.medio.vlAtual = calculaGrauPertinencia(gp.medio, vlEntrada);
			gp.alto.vlAtual = calculaGrauPertinencia(gp.alto, vlEntrada);
		}
		
		private function calculaGrauPertinencia(atrib:AtributoFuzzy, vlEntrada:Number):Number
		{
			var pertN:Number = (vlEntrada * 1) / (atrib.fim);
			if (pertN > 1)
				return 1;
			return pertN;
		}
		
		private function realizaInferencia():void
		{
			for each (var expr:ExpressaoFuzzy in listaExpressoes)
			{
				var listaExp:Array = expr.expressao.split(" ");
				
				expr.grau1 = avaliaExpressao(listaExp[1], listaExp[3]);
				expr.grau2 = avaliaExpressao(listaExp[5], listaExp[7]);
				
				expr.grau = Math.min(expr.grau1, expr.grau2);
				expr.metodoExecuta = listaExp[9];
			}
		
		}
		
		private function avaliaExpressao(n1:String, n2:String):Number
		{
			for each (var gp:GrupoFuzzy in listaGrupos)
			{
				if (gp.nome == n1)
				{
					return calculaGrauExpressao(gp, n2);
				}
			}
			return null;
		}
		
		private function calculaGrauExpressao(gp:GrupoFuzzy, nomeAtrib:String):Number
		{
			if (gp.baixo.nomeAtrib == nomeAtrib)
				return gp.baixo.vlAtual;
			if (gp.medio.nomeAtrib == nomeAtrib)
				return gp.medio.vlAtual;
			if (gp.alto.nomeAtrib == nomeAtrib)
				return gp.alto.vlAtual;
			
			return null;
		}
		
		private function defuzzificar():ExpressaoFuzzy
		{
			var maiorGrau:ExpressaoFuzzy;
			for each (var exp:ExpressaoFuzzy in listaExpressoes)
			{
				if (maiorGrau == null)
				{
					maiorGrau = exp;
				}
				else
				{
					if (exp.grau1 != 0 && exp.grau2 != 0)
						if (maiorGrau.grau < exp.grau)
							maiorGrau = exp;
				}
			}
			
			return maiorGrau;
		}
	
	}

}
