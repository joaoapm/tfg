package jogoTCC.entidades
{
	import jogoTCC.estrutura.Partida;
	import jogoTCC.util.CarregaAnimacao;
	import jogoTCC.util.CarregaAssets;
	import jogoTCC.util.Pathfinder;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.display.MovieClip;
	import starling.core.Starling;
	import starling.events.TouchPhase;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.Event;
	import starling.animation.Tween;
	import jogoTCC.entidades.BarraVida;
	
	public class Personagem extends Sprite
	{
		
		// tipo do jogador: controlado por computador ou usuario
		private var tipoJogador:String;
		
		// atributos do personagem
		public var vida:Number = 6;
		public var casaAtual:Casa;
		public var time:Number;
		
		// animacao do personagem
		private var carregaAnimacao:CarregaAnimacao = new CarregaAnimacao();
		
		// animacao atual
		private var mvAtual:MovieClip;
		private var animAtual:String = "";
		private var barraVida:BarraVida;
		private var vidaAtual:Image;
		
		public function Personagem(tipoJogador:String, nrTime:Number)
		{
			
			// colisor
			var quad:Quad = new Quad(20, 35);
			quad.y = 40;
			quad.x = 40;
			quad.alpha = 0;
			
			// instancia barras de vida
			barraVida = new BarraVida();
			
			// controle de eventos
			quad.addEventListener(TouchEvent.TOUCH, controlaEventos);
			addChild(quad);
			
			// inicializa animacoes
			this.tipoJogador = tipoJogador;
			this.time = nrTime;
			resetaAnimacao();
			
			// inicializa barra de vida
			atualizaVida();
		
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
		
		public function ataca():void
		{
			atualizaAnimacao("ataqueFR", "atacando", 13, -18, -18, true);
		}
		
		public function sofreAtaque():void
		{
			this.vida -= 1;
			
			atualizaVida();
		}
		
		private function movePersonagem(caminho:Array, indice:Number):void
		{
			if (indice < caminho.length)
			{
				var casa:Casa = caminho[indice] as Casa;
				 
				if (animAtual != casa.direc)
				{
					
					if (casa.direc == "LE")
						atualizaAnimacao("andandoLE", "andando", 8, null, null, false);
					
					if (casa.direc == "LD")
						atualizaAnimacao("andandoLD", "andando", 8, null, null, false);
					
					if (casa.direc == "FR")
						atualizaAnimacao("andandoFR", "andando", 8, null, null, false);
					
					if (casa.direc == "TR")
						atualizaAnimacao("andandoTR", "andando", 8, null, null, false);
					
					if (casa.direc == "D1")
						atualizaAnimacao("andandoD1", "andando", 8, null, null, false);
					
					if (casa.direc == "D2")
						atualizaAnimacao("andandoD2", "andando", 8, null, null, false);
					
					if (casa.direc == "D3")
						atualizaAnimacao("andandoD3", "andando", 8, null, null, false)
					
					if (casa.direc == "D4")
						atualizaAnimacao("andandoD4", "andando", 8, null, null, false)
					
					animAtual = casa.direc;
				}
				
				var posX:Number = casa.x - 47;
				var posY:Number = casa.y - 47;
				
				var tween:Tween = new Tween(this, 0.5);
				tween.animate("x", posX);
				tween.animate("y", posY);
				
				this.casaAtual = casa;
				
				var partida:Partida = parent as Partida;
				partida.organizaLayers();
				
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
				resetaAnimacao();
			}
		}
		
		private function controlaEventos(e:TouchEvent):void
		{
			
			var touch:Touch = e.getTouch(stage);
			
			if (touch != null)
			{
				var colisor:Quad = e.currentTarget as Quad;
				var clicado:Personagem = colisor.parent as Personagem;
				
				var partida:Partida = parent as Partida;
				
				if (touch.phase == TouchPhase.ENDED)
				{
					if (this.time == 0)
					{
						partida.atualizaPersonagemMarcado(clicado);
						mostraRange(true);
					}
					else
					{
						partida.gerenciaAtaque(clicado);
					}
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
			alteraAlphaCasas(this.casaAtual.casaTR, ligaRange);
			alteraAlphaCasas(this.casaAtual.casaFR, ligaRange);
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
				
				if (casa.casaFR != null)
					casa.casaFR.alpha = alpha;
				
				if (casa.casaTR != null)
					casa.casaTR.alpha = alpha;
				
				if (casa.casaLD != null)
					casa.casaLD.alpha = alpha;
				
				if (casa.casaLE != null)
					casa.casaLE.alpha = alpha;
			}
		}
		
		private function isCasaDestinoValida(casaDest:Casa):Boolean
		{
			if (validaCasa(casaDest, this.casaAtual) || validaCasa(casaDest, this.casaAtual.casaD1) || validaCasa(casaDest, this.casaAtual.casaD2) || validaCasa(casaDest, this.casaAtual.casaD3) || validaCasa(casaDest, this.casaAtual.casaD4) || validaCasa(casaDest, this.casaAtual.casaFR) || validaCasa(casaDest, this.casaAtual.casaTR) || validaCasa(casaDest, this.casaAtual.casaLD) || validaCasa(casaDest, this.casaAtual.casaLD))
				return true;
			
			return false;
		}
		
		private function validaCasa(casaDest:Casa, casa:Casa):Boolean
		{
			
			if (casaDest == casa.casaD1 || casaDest == casa.casaD2 || casaDest == casa.casaD3 || casaDest == casa.casaD4 || casaDest == casa.casaFR || casaDest == casa.casaTR || casaDest == casa.casaLD || casaDest == casa.casaLE)
			{
				return true;
			}
			
			return false;
		
		}
		
		private function resetaAnimacao():void
		{
			if (this.vida == 1)
			{
				this.dispose();
				this.removeFromParent();
			}
			else
			{
				var partida:Partida = parent as Partida;
				
				if (time == 0)
					atualizaAnimacao("paradoFR", "parado", 13, null, null, false);
				else
					atualizaAnimacao("paradoTR", "parado", 13, null, null, false);
				
				if (partida != null)
					partida.atualizaPersonagemMarcado(null);
				
				animAtual = null;
			}
		}
		
		private function atualizaAnimacao(animacao:String, tpAni:String, nrFr:Number, pX:Number, pY:Number, resetaAoFinal:Boolean):void
		{
			if (mvAtual != null)
			{
				mvAtual.dispose();
				mvAtual.removeFromParent();
			}
			mvAtual = carregaAnimacao.carregaAnimacao(mvAtual, nrFr, animacao, tpAni, tipoJogador);
			
			addChild(mvAtual);
			
			if (pX != 0)
				mvAtual.x -= 18;
			
			if (pY != 0)
				mvAtual.y -= 18;
			
			mvAtual.play();
			
			mvAtual.touchable = false;
			
			Starling.juggler.add(mvAtual);
			
			if (resetaAoFinal)
				mvAtual.addEventListener(Event.COMPLETE, resetaAnimacao);
		
		}
		
		private function atualizaVida():void
		{
			if (vidaAtual != null)
			{
				vidaAtual.dispose();
				vidaAtual.removeFromParent();
			}
			if (this.vida == 6)
				vidaAtual = barraVida.imgVida1;
			if (this.vida == 5)
				vidaAtual = barraVida.imgVida2;
			if (this.vida == 4)
				vidaAtual = barraVida.imgVida3;
			if (this.vida == 3)
				vidaAtual = barraVida.imgVida4;
			if (this.vida == 2)
				vidaAtual = barraVida.imgVida5;
			
			if (this.vida == 1)
			{
				atualizaAnimacao("morrendoTR", "morrendo", 8, null, null, true);
			}
			else
			{
				addChild(vidaAtual);
				vidaAtual.y -= 5;
				vidaAtual.x += 10;
			}
		}
	
	}
}
