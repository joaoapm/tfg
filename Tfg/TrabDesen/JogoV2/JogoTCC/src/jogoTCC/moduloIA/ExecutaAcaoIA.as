package jogoTCC.moduloIA
{
	import jogoTCC.entidades.Mapa;
	import jogoTCC.entidades.Personagem;
	import jogoTCC.estrutura.AtributoFuzzy;
	import jogoTCC.estrutura.ExpressaoFuzzy;
	import jogoTCC.estrutura.GrupoFuzzy;
	
	public class ExecutaAcaoIA
	{
		
		private var mapa:Mapa;
		private var listaPersonagens:Array;
		private var persoTime0:Array = new Array();
		private var persoTime1:Array = new Array();
		private var principalIA:PrincipalIA = new PrincipalIA();
		
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
		
		public function processaJogada():void
		{
			var express:ExpressaoFuzzy = principalIA.processar(0, 2, 10);
		}
		
		public function ATACA_PERSONAGEM():void
		{
		
		}
	
	}

}
