package jogoTCC.entidades
{
	import flash.display.CapsStyle;
	import flash.media.Camera;
	import jogoTCC.estrutura.Partida;
	import jogoTCC.modelo.TipoJogador;
	import jogoTCC.util.CarregaAnimacao;
	import jogoTCC.util.CarregaAssets;
	import jogoTCC.util.Pathfinder;
	import starling.display.Sprite;
	import starling.display.MovieClip;
	import starling.core.Starling;
	import starling.events.TouchPhase;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.Event;
	import starling.animation.Tween;
	
	public class Personagem extends Sprite
	{
		
		// tipo do jogador: controlado por computador ou usuario
		private var tipoJogador:String;
		
		// atributos do personagem
		private var vida:Number;
		private var ataque:Number;
		private var casaAtual:Casa;
		
		// animacao do personagem
		private var carregaAnimacao:CarregaAnimacao = new CarregaAnimacao();
		private var animacaoCarregada:Boolean = false;
		
		private var mvAndandoD1:MovieClip;
		private var mvAndandoD2:MovieClip;
		private var mvAndandoD3:MovieClip;
		private var mvAndandoD4:MovieClip;
		
		private var mvAtacandoD1:MovieClip;
		private var mvAtacandoD2:MovieClip;
		private var mvAtacandoD3:MovieClip;
		private var mvAtacandoD4:MovieClip;
		
		private var mvMorrendoD1:MovieClip;
		private var mvMorrendoD2:MovieClip;
		private var mvMorrendoD3:MovieClip;
		private var mvMorrendoD4:MovieClip;
		
		private var mvParadoD1:MovieClip;
		private var mvParadoD2:MovieClip;
		private var mvParadoD3:MovieClip;
		private var mvParadoD4:MovieClip;
		
		private var mvAndandoFR:MovieClip;
		private var mvAndandoTR:MovieClip;
		private var mvAndandoLD:MovieClip;
		private var mvAndandoLE:MovieClip;
		
		private var mvAtacandoFR:MovieClip;
		private var mvAtacandoTR:MovieClip;
		private var mvAtacandoLD:MovieClip;
		private var mvAtacandoLE:MovieClip;
		
		private var mvMorrendoFR:MovieClip;
		private var mvMorrendoTR:MovieClip;
		private var mvMorrendoLD:MovieClip;
		private var mvMorrendoLE:MovieClip;
		
		private var mvParadoFR:MovieClip;
		private var mvParadoTR:MovieClip;
		private var mvParadoLD:MovieClip;
		private var mvParadoLE:MovieClip;
		
		// animacao atual
		private var mvAtual:MovieClip;
		private var animAtual:String = "";
		
		public function Personagem(tipoJogador:String)
		{
			// controle de eventos
			addEventListener(TouchEvent.TOUCH, controlaEventos);
			
			// inicializa animacoes
			this.tipoJogador = tipoJogador;
			atualizaAnimacao("paradoFR", "parado", 13);
		
		}
		
		public function setLocalInicialPersonagem(casa:Casa):void
		{
			super.x = casa.x - 47;
			super.y = casa.y - 47;
			
			casaAtual = casa;
		
		}
		
		public function setLocalPersonagem(casa:Casa):void
		{
			if (isCasaDestinoValida(casa))
			{
				var pt:Pathfinder = new Pathfinder();
				var caminho:Array = pt.pesquisaCaminho(casaAtual, casa);
				
				mostraRange(false);
				movePersonagem(caminho, 1);
			}
		}
		
		private function movePersonagem(caminho:Array, indice:Number):void
		{
			if (indice < caminho.length)
			{
				var casa:Casa = caminho[indice] as Casa;
				
				if (animAtual != casa.direc)
				{
					animacaoCarregada = false;
					
					if (casa.direc == "LD")
						atualizaAnimacao("andandoLE", "andando", 8);
					
					if (casa.direc == "LE")
						atualizaAnimacao("andandoLD", "andando", 8);
					
					if (casa.direc == "B")
						atualizaAnimacao("andandoFR", "andando", 8);
					
					if (casa.direc == "C")
						atualizaAnimacao("andandoTR", "andando", 8);
					
					if (casa.direc == "D1")
						atualizaAnimacao("andandoD4", "andando", 8);
					
					if (casa.direc == "D2")
						atualizaAnimacao("andandoD1", "andando", 8);
					
					if (casa.direc == "D3")
						atualizaAnimacao("andandoD2", "andando", 8)
					
					if (casa.direc == "D4")
						atualizaAnimacao("andandoD3", "andando", 8)
					
					animAtual = casa.direc;
				}
				
				var posX:Number = casa.x - 47;
				var posY:Number = casa.y - 47;
				
				var tween:Tween = new Tween(this, 0.5);
				tween.animate("x", posX);
				tween.animate("y", posY);
				
				super.parent.setChildIndex(this, casa.l + casa.c);
				
				tween.onComplete = function():void
				{
					indice += 1;
					movePersonagem(caminho, indice);
				};
				
				Starling.juggler.add(tween);
			}
			else
			{
				this.casaAtual = caminho[indice - 1];
				animacaoCarregada = false;
				atualizaAnimacao("paradoFR", "parado", 13);
				animAtual = null;
			}
		}
		
		private function atualizaAnimacao(animacao:String, tpAni:String, nrFr:Number):void
		{
			if (!animacaoCarregada)
			{
				if (mvAtual != null)
				{
					mvAtual.dispose();
					mvAtual.removeFromParent();
				}
				mvAtual = carregaAnimacao.carregaAnimacao(mvAtual, nrFr, animacao, tpAni, tipoJogador);
				
				addChild(mvAtual);
				mvAtual.play();
				Starling.juggler.add(mvAtual);
			}
		}
		
		private function contemCasa(lista:Vector.<Casa>, casa:Casa):Boolean
		{
			const index:Number = lista.indexOf(casa);
			
			if (index == -1)
				return false;
			else
				return true;
		}
		
		private function controlaEventos(e:TouchEvent):void
		{
			
			var touch:Touch = e.getTouch(stage);
			
			if (touch != null)
			{
				var clicked:Personagem = e.currentTarget as Personagem;
				var partida:Partida = parent as Partida;
				
				if (touch.phase == TouchPhase.ENDED)
				{
					partida.atualizaPersonagemMarcado(clicked);
					mostraRange(true);
				}
			}
		}
		
		public function mostraRange(ligaRange:Boolean):void
		{
			alteraAlphaCasas(this.casaAtual, ligaRange);
			alteraAlphaCasas(this.casaAtual.casaD1, ligaRange);
			alteraAlphaCasas(this.casaAtual.casaD2, ligaRange);
			alteraAlphaCasas(this.casaAtual.casaD3, ligaRange);
			alteraAlphaCasas(this.casaAtual.casaD4, ligaRange);
			alteraAlphaCasas(this.casaAtual.casaC, ligaRange);
			alteraAlphaCasas(this.casaAtual.casaB, ligaRange);
			alteraAlphaCasas(this.casaAtual.casaLD, ligaRange);
			alteraAlphaCasas(this.casaAtual.casaLE, ligaRange);
		}
		
		private function alteraAlphaCasas(casa:Casa, ligaRange:Boolean):void
		{
			
			if (casa != null)
			{
				var alpha:Number = 0.3;
				
				if (!ligaRange)
					alpha = 0;
				
				if (casa.casaD1 != null)
					casa.casaD1.alpha = alpha;
				
				if (casa.casaD2 != null)
					casa.casaD2.alpha = alpha;
				
				if (casa.casaD3 != null)
					casa.casaD3.alpha = alpha;
				
				if (casa.casaD4 != null)
					casa.casaD4.alpha = alpha;
				
				if (casa.casaB != null)
					casa.casaB.alpha = alpha;
				
				if (casa.casaC != null)
					casa.casaC.alpha = alpha;
				
				if (casa.casaLD != null)
					casa.casaLD.alpha = alpha;
				
				if (casa.casaLE != null)
					casa.casaLE.alpha = alpha;
			}
		}
		
		private function isCasaDestinoValida(casaDest:Casa):Boolean
		{
			if (validaCasa(casaDest, this.casaAtual) || validaCasa(casaDest, this.casaAtual.casaD1) || 
			validaCasa(casaDest, this.casaAtual.casaD2) || validaCasa(casaDest, this.casaAtual.casaD3) || 
			validaCasa(casaDest, this.casaAtual.casaD4) || validaCasa(casaDest, this.casaAtual.casaB) || 
			validaCasa(casaDest, this.casaAtual.casaC) || validaCasa(casaDest, this.casaAtual.casaLD) || 
			validaCasa(casaDest, this.casaAtual.casaLD))
				return true;
			
			return false;
		}
		
		private function validaCasa(casaDest:Casa, casa:Casa):Boolean
		{
			
			if (casaDest == casa.casaD1 || casaDest == casa.casaD2 || casaDest == casa.casaD3 || 
			casaDest == casa.casaD4 || casaDest == casa.casaB || casaDest == casa.casaC || 
			casaDest == casa.casaLD || casaDest == casa.casaLE)
			{
				return true;
			}
			
			return false;
		
		}
	
	}
}