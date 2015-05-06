package jogoTCC.util
{
	
	import flash.utils.Dictionary;
	import flash.geom.Point;
	import jogoTCC.entidades.Casa;
	
	public class Pathfinder
	{
		private var casaFim:Casa;
		private var casasAbertas:Vector.<Casa>;
		private var casasFechadas:Vector.<Casa>;
		public var caminho:Array;
		public var caminhoInv:Array;
		
		public function pesquisaCaminho(casaIni:Casa, casaFim:Casa):Array
		{
			
			// casa de destino
			this.casaFim = casaFim;
			
			// lista com casas fechadas e abertas			
			casasAbertas = new Vector.<Casa>();
			casasFechadas = new Vector.<Casa>();
			
			// caminho encontrado 
			caminho = new Array();
			caminhoInv = new Array();
			
			// adiciona primeira casa do caminho(casa inicial)
			casaIni.f = 0;
			casaIni.g = 0;
			casaIni.h = 0;
			
			casasAbertas.push(casaIni);
			
			// inicia procura
			this.iniciaPesquisaCaminho();
			
			return this.caminho;
		}
		
		private function iniciaPesquisaCaminho():void
		{
			var casaAtual:Casa;
			var menorValorF:Number = 100000;
			var encontrouFinal:Boolean = false;
			
			//determina a casa com menor valor F
			for each (var casa:Casa in casasAbertas)
			{
				var valorFCasaAutal:Number;
				valorFCasaAutal = casa.g + casa.h
				if (menorValorF > valorFCasaAutal)
				{
					menorValorF = valorFCasaAutal;
					
					// seta direcao do movimento
					if (casa.casaPai != null)
					{
						if (casa.casaPai.casaLE == casa)
							casa.direc = "LE";
						if (casa.casaPai.casaLD == casa)
							casa.direc = "LD";
						if (casa.casaPai.casaFR == casa)
							casa.direc = "FR";
						if (casa.casaPai.casaTR == casa)
							casa.direc = "TR";
						if (casa.casaPai.casaD1 == casa)
							casa.direc = "D1";
						if (casa.casaPai.casaD2 == casa)
							casa.direc = "D2";
						if (casa.casaPai.casaD3 == casa)
							casa.direc = "D3";
						if (casa.casaPai.casaD4 == casa)
							casa.direc = "D4";
					}
					casaAtual = casa;
					
				}
			}
			
			// nao encontrou caminho
			if (casaAtual == null)
			{
				return;
			}
			
			//retira casa da lista aberto e coloca na fechada
			casasAbertas.splice(casasAbertas.indexOf(casaAtual), 1);
			casasFechadas.push(casaAtual);
			
			// veririfica se encontrou a casa final
			if ((casaFim.x == casaAtual.x) && (casaFim.y == casaAtual.y))
				encontrouFinal = true;
			
			// processa dados das casas adjacentes
			processaCasa(casaAtual.casaD1, true, casaAtual);
			processaCasa(casaAtual.casaD2, true, casaAtual);
			processaCasa(casaAtual.casaD3, true, casaAtual);
			processaCasa(casaAtual.casaD4, true, casaAtual);
			
			processaCasa(casaAtual.casaTR, false, casaAtual);
			processaCasa(casaAtual.casaLD, false, casaAtual);
			processaCasa(casaAtual.casaLE, false, casaAtual);
			processaCasa(casaAtual.casaFR, false, casaAtual);
			
			// se nao encontrou casa final, continua procura
			if (encontrouFinal == false)
			{
				this.iniciaPesquisaCaminho();
			}
			else
			{
				montaCaminho(casaFim);
				inverteCaminho();
			}
		}
		
		private function processaCasa(casa:Casa, isDiagonal:Boolean, casaAt:Casa):void
		{
			if (casa != null)
			{
				var col:Number = casa.c;
				var lin:Number = casa.l;
				
				if ((casa.ehPassavel) && casasFechadas.indexOf(casa) == -1 && casasAbertas.indexOf(casa) == -1)
				{
					if (isDiagonal)
						casa.g = 14;
					else
						casa.g = 10;
					
					casa.h = Math.abs(casaFim.l - lin) + Math.abs(casaFim.c - col);
					casa.casaPai = casaAt;
					
					casasAbertas.push(casa);
				}
			}
		}
		
		private function montaCaminho(casa:Casa):void
		{
			caminho.push(casa);
			if (casa.g > 0)
			{
				this.montaCaminho(casa.casaPai);
			}
		}
		
		private function inverteCaminho():void
		{
			for (var i:Number = caminho.length - 1; i >= 0; i--)
			{
				caminhoInv.push(caminho[i]);
			}
			
			caminho = caminhoInv;
		}
	}
}
