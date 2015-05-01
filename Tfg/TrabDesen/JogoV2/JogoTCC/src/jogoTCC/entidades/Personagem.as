package jogoTCC.entidades
{
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
			
			var pt:Pathfinder = new Pathfinder();
			var caminho:Array = pt.pesquisaCaminho(casaAtual, casa);
			
			for (var i:Number = 0; i < caminho.length; i++)
			{
				var c:Casa = caminho[i] as Casa;
				//	trace(c.g + " " + c.h);
				c.alpha = 1;
			}
			
			movePersonagem(caminho, 1);
		
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
					partida.personagemMarcado = clicked;
				}
			}
		}
	
	}

}