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
			
		public function PrincipalIA(mapa:Mapa, listaPerso:Array,vlEntrada:Number)
		{
			
			var grupos:GruposIA = new GruposIA(listaGrupos);
			var expressoes:ExpressoesIA = new ExpressoesIA(listaExpressoes);
			
			// fase de fuzzificacao dos valores de entrada
			//fuzzificar(QTD_PERSONAGEM_INI, vlEntrada);
			//fuzzificar(QTD_PERSONAGEM_INI, vlEntrada);
			//fuzzificar(QTD_PERSONAGEM_INI, vlEntrada);
			
			// fase de inferencia das regras
			realizaInferencia();
			
			// fase de defuzzificacao e realizadao da decisao retornada
			defuzzificar();
		
		}
		
		private function fuzzificar(gp:GrupoFuzzy, vlEntrada:Number):void
		{
			gp.baixo.vlAtual = calculaGrauPertinencia(gp.baixo, vlEntrada);
			gp.medio.vlAtual = calculaGrauPertinencia(gp.medio, vlEntrada);
			gp.alto.vlAtual = calculaGrauPertinencia(gp.alto, vlEntrada);
		}
		
		private function calculaGrauPertinencia(atrib:AtributoFuzzy, vlEntrada:Number):Number
		{
			var pertN:Number = (vlEntrada * 100) / (atrib.fim - atrib.inicio);
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
		
		private function defuzzificar():void
		{
			var maiorGrau:ExpressaoFuzzy;
			for each (var exp:ExpressaoFuzzy in listaExpressoes)
			{
				if (exp.grau1 != 0 && exp.grau2 != 0)
					if (maiorGrau != null && maiorGrau.grau < exp.grau)
						maiorGrau = exp;
			}
			
			// executa acao
			executaAcao[maiorGrau.metodoExecuta]();
		}
	
	}

}
