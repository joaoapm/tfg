package jogoTCC.entidades
{
	import jogoTCC.estrutura.Partida;
	import jogoTCC.modelo.TipoJogador;
	import jogoTCC.util.CarregaAnimacao;
	import jogoTCC.util.CarregaAssets;
	import starling.display.Sprite;
	import starling.display.MovieClip;
	import starling.core.Starling;
	import starling.events.TouchPhase;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.Event;
	
	public class Personagem extends Sprite
	{
		
		// tipo do jogador: controlado por computador ou usuario
		private var tipoJogador:String;
		
		// atributos do personagem
		private var vida:Number;
		private var ataque:Number;
		
		// animacao do personagem
		private var carregaAnimacao:CarregaAnimacao = new CarregaAnimacao();
		
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
		
		public function Personagem(tipoJogador:String)
		{
			// controle de eventos
			addEventListener(TouchEvent.TOUCH, controlaEventos);
			
			// inicializa animacoes
			this.tipoJogador = tipoJogador;
			/*
			mvAndandoD1 = carregaAnimacao.carregaAnimacao(mvAndandoD1, 8, "andandoD1", "andando", tipoJogador);
			mvAndandoD2 = carregaAnimacao.carregaAnimacao(mvAndandoD1, 8, "andandoD2", "andando", tipoJogador);
			mvAndandoD3 = carregaAnimacao.carregaAnimacao(mvAndandoD1, 8, "andandoD3", "andando", tipoJogador);
			mvAndandoD4 = carregaAnimacao.carregaAnimacao(mvAndandoD1, 8, "andandoD4", "andando", tipoJogador);
			
			mvAtacandoD1 = carregaAnimacao.carregaAnimacao(mvAtacandoD1, 13, "ataqueD1", "atacando", tipoJogador);
			mvAtacandoD2 = carregaAnimacao.carregaAnimacao(mvAtacandoD2, 13, "ataqueD2", "atacando", tipoJogador);
			mvAtacandoD3 = carregaAnimacao.carregaAnimacao(mvAtacandoD3, 13, "ataqueD3", "atacando", tipoJogador);
			mvAtacandoD4 = carregaAnimacao.carregaAnimacao(mvAtacandoD4, 13, "ataqueD4", "atacando", tipoJogador);
			
			mvMorrendoD1 = carregaAnimacao.carregaAnimacao(mvMorrendoD1, 11, "morrendoD1", "morrendo", tipoJogador);
			mvMorrendoD2 = carregaAnimacao.carregaAnimacao(mvMorrendoD2, 11, "morrendoD2", "morrendo", tipoJogador);
			mvMorrendoD3 = carregaAnimacao.carregaAnimacao(mvMorrendoD3, 11, "morrendoD3", "morrendo", tipoJogador);
			mvMorrendoD4 = carregaAnimacao.carregaAnimacao(mvMorrendoD4, 11, "morrendoD4", "morrendo", tipoJogador);
			
			mvParadoD1 = carregaAnimacao.carregaAnimacao(mvParadoD1, 13, "paradoD1", "parado", tipoJogador);
			mvParadoD2 = carregaAnimacao.carregaAnimacao(mvParadoD2, 13, "paradoD2", "parado", tipoJogador);
			mvParadoD3 = carregaAnimacao.carregaAnimacao(mvParadoD3, 13, "paradoD3", "parado", tipoJogador);
			mvParadoD4 = carregaAnimacao.carregaAnimacao(mvParadoD4, 13, "paradoD4", "parado", tipoJogador);
			
			mvAndandoFR = carregaAnimacao.carregaAnimacao(mvAndandoFR, 8, "andandoFR", "andando", tipoJogador);
			mvAndandoTR = carregaAnimacao.carregaAnimacao(mvAndandoTR, 8, "andandoTR", "andando", tipoJogador);
			mvAndandoLE = carregaAnimacao.carregaAnimacao(mvAndandoLE, 8, "andandoLE", "andando", tipoJogador);
			mvAndandoLD = carregaAnimacao.carregaAnimacao(mvAndandoLD, 8, "andandoLD", "andando", tipoJogador);
			
			mvAtacandoFR = carregaAnimacao.carregaAnimacao(mvAtacandoFR, 13, "ataqueFR", "atacando", tipoJogador);
			mvAtacandoTR = carregaAnimacao.carregaAnimacao(mvAtacandoTR, 13, "ataqueTR", "atacando", tipoJogador);
			mvAtacandoLE = carregaAnimacao.carregaAnimacao(mvAtacandoLE, 13, "ataqueLE", "atacando", tipoJogador);
			mvAtacandoLD = carregaAnimacao.carregaAnimacao(mvAtacandoLD, 13, "ataqueLD", "atacando", tipoJogador);
			
			mvMorrendoFR = carregaAnimacao.carregaAnimacao(mvMorrendoFR, 11, "morrendoFR", "morrendo", tipoJogador);
			mvMorrendoTR = carregaAnimacao.carregaAnimacao(mvMorrendoTR, 11, "morrendoTR", "morrendo", tipoJogador);
			mvMorrendoLE = carregaAnimacao.carregaAnimacao(mvMorrendoLE, 11, "morrendoLE", "morrendo", tipoJogador);
			mvMorrendoLD = carregaAnimacao.carregaAnimacao(mvMorrendoLD, 11, "morrendoLD", "morrendo", tipoJogador);
			

			mvParadoTR = carregaAnimacao.carregaAnimacao(mvParadoTR, 13, "paradoTR", "parado", tipoJogador);
			mvParadoLE = carregaAnimacao.carregaAnimacao(mvParadoLE, 13, "paradoLE", "parado", tipoJogador);
			mvParadoLD = carregaAnimacao.carregaAnimacao(mvParadoLD, 13, "paradoLD", "parado", tipoJogador);
			*/
			
			mvParadoFR = carregaAnimacao.carregaAnimacao(mvParadoFR, 13, "paradoFR", "parado", tipoJogador);
			mvAtual = mvParadoFR;
			
			addChild(mvAtual);
			mvAtual.play();
			Starling.juggler.add(mvAtual);
		
		}
		
		public function setLocalPersonagem(casa:Casa):void
		{
			super.x = casa.x - 47;
			super.y = casa.y - 47;
		
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