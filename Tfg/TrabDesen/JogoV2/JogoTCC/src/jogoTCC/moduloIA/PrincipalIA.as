package jogoTCC.moduloIA
{
	import jogoTCC.entidades.Mapa;
	import jogoTCC.entidades.Personagem;
	
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
		}
		
		public function processaJogada():void
		{
		
		}
	
	}

}