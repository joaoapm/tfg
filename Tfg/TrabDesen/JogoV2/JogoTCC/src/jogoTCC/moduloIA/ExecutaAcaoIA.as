package jogoTCC.moduloIA {
	import jogoTCC.entidades.Casa;
	import jogoTCC.entidades.Mapa;
	import jogoTCC.entidades.Personagem;
	import jogoTCC.estrutura.AtributoFuzzy;
	import jogoTCC.estrutura.ExpressaoFuzzy;
	import jogoTCC.estrutura.GrupoFuzzy;
	import jogoTCC.util.Pathfinder;
	
	public class ExecutaAcaoIA {
		
		private var mapa:Mapa;
		private var listaPersonagens:Array;
		private var persoTime0:Array = new Array();
		private var persoTime1:Array = new Array();
		
		private var persoTime1Ataque:Array = new Array();
		private var persoTime1Defesa:Array = new Array();
		
		private var principalIA:PrincipalIA = new PrincipalIA();
		private var iniAtacar:Personagem;
		private var perso:Personagem;
		private var pathFind:Pathfinder;
		private var listaIniAoRedor:Array;
		private var caminho:Array;
		private var qntAoRedor:Number;
		private var dist:Number;
		
		public function ExecutaAcaoIA(mapa:Mapa, listaPerso:Array):void {
			this.mapa = mapa;
			this.listaPersonagens = listaPerso;
			
			for each (var p:Personagem in this.listaPersonagens) {
				if (p.time == 0)
					persoTime0.push(p)
				else
					persoTime1.push(p)
			}
			
			persoTime1Ataque.push(persoTime1[0]);
			persoTime1Ataque.push(persoTime1[1]);
			//persoTime1Ataque.push(persoTime1[4]);
			
			persoTime1Defesa.push(persoTime1[2]);
			//persoTime1Defesa.push(persoTime1[3]);
			
		
		}
		
		public function processaJogada():void {
								
			// personagem a ser processado
			 principalIA.processarTime(mapa.vidaC1, mapa.vidaC0);
			
 		    if(principalIA.exprRetornoTime.metodoExecuta == "TIME_ATAQUE")
			 perso = persoTime1Ataque[randomRange(0, 1)];
			else if (principalIA.exprRetornoTime.metodoExecuta == "TIME_DEFESA")
			 perso = persoTime1Defesa[0]; 

			 
			// personagem ao redor
			listaIniAoRedor = pesqIniAoRedor(perso.casaAtual);
			qntAoRedor = listaIniAoRedor.length;
			
			// qntidade de vida de um personagem aleatorio ao redor
			iniAtacar = listaIniAoRedor[randomRange(0, qntAoRedor)] as Personagem;
			var nr:Number;
			if (iniAtacar != null) {
				nr = iniAtacar.vida;
			} else {
				nr = 0;
			}
			
			// distancia torre inimiga
			pathFind = new Pathfinder();
			caminho = pathFind.pesquisaCaminho(perso.casaAtual, mapa.torre0[2]);
			pathFind.caminhoInv = new Array();
			caminho = pathFind.caminho;
			dist = caminho.length;
			
			principalIA.processarPesonagem(qntAoRedor, dist, mapa.vidaC1, mapa.vidaC0, perso.vida, nr);
			 
			//trace(principalIA.exprRetorno.expressao + ": " + principalIA.exprRetorno.grau);
			trace(principalIA.exprRetorno.metodoExecuta);
			this[principalIA.exprRetorno.metodoExecuta]();
		}
		
		public function MOVE_TORRE_INI():void {
			perso.setLocalPersonagem(caminho[1]);
		}
		
		public function MOVE_ATACA_TORRE_INI():void {
			var torre0:Array = mapa.torre0;
			var casa:Casa;
			var casaValida:Casa;
			
			for (var i:Number = 0; i < torre0.length; i++) {
				casa = caminho[i] as Casa;
				if (perso.isCasaDestinoValida(casa)) {
					casaValida = casa;
				}
			}
			
			if (casaValida != null) {
				perso.setLocalPersonagem(casaValida);
			} else {
				
			}
		
		}
		
		public function ATACA_TORRE():void {
			if (dist <= 2) {
			 mapa.atacaTorre( mapa.torre0[2], perso);
			} else {
				MOVE_TORRE_INI();
			}
		}
		
		public function MOVE_ATACA_INI():void {
			
			if (qntAoRedor > 0) {
				var persoAtk:Personagem = listaIniAoRedor[0];
				persoAtk.sofreAtaque();
				perso.ataca();
			} else {
				MOVE_ATACA_TORRE_INI();
			}
		}
		
		public function MOVE_DEFESA():void {
		
		}
		
		private function mostracc():void {
			for (var i:Number = 0; i < this.mapa.casas.length; i++) {
				for (var j:Number = 0; j < this.mapa.casas[i].length; j++) {
					var ca:Casa = this.mapa.casas[i][j];
					if (ca.ehPassavel == true)
						ca.alpha = 0.7;
				}
			}
		}
		
		public function pesqIniAoRedor(casa:Casa):Array {
			var listaIni:Array = new Array();
			
			if (casa.casaD1 != null && casa.casaD1.personagemAtual != null && casa.casaD1.personagemAtual.time == 0)
				listaIni.push(casa.casaD1.personagemAtual);
			
			if (casa.casaD2 != null && casa.casaD2.personagemAtual != null && casa.casaD2.personagemAtual.time == 0)
				listaIni.push(casa.casaD2.personagemAtual);
			
			if (casa.casaD3 != null && casa.casaD3.personagemAtual != null && casa.casaD3.personagemAtual.time == 0)
				listaIni.push(casa.casaD3.personagemAtual);
			
			if (casa.casaD4 != null && casa.casaD4.personagemAtual != null && casa.casaD4.personagemAtual.time == 0)
				listaIni.push(casa.casaD4.personagemAtual);
			
			if (casa.casaFR != null && casa.casaFR.personagemAtual != null && casa.casaFR.personagemAtual.time == 0)
				listaIni.push(casa.casaFR.personagemAtual);
			
			if (casa.casaTR != null && casa.casaTR.personagemAtual != null && casa.casaTR.personagemAtual.time == 0)
				listaIni.push(casa.casaTR.personagemAtual);
			
			if (casa.casaLD != null && casa.casaLD.personagemAtual != null && casa.casaLD.personagemAtual.time == 0)
				listaIni.push(casa.casaLD.personagemAtual);
			
			if (casa.casaLE != null && casa.casaLE.personagemAtual != null && casa.casaLE.personagemAtual.time == 0)
				listaIni.push(casa.casaLE.personagemAtual);
			
			return listaIni;
		}
		
		private function randomRange(minNum:Number, maxNum:Number):Number {
			return (Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum);
		}
	
	}

}
