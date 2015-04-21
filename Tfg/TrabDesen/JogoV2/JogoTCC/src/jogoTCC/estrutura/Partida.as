package jogoTCC.estrutura
{
	import starling.display.Sprite;
	import jogoTCC.entidades.Mapa;
	import jogoTCC.entidades.Personagem;
	
	public class Partida extends Sprite
	{
		
		public var personagemMarcado:Object;
		
		public function Partida()
		{
			// rotina para iniciar a estrutura do jogo
			iniciaPartida();
		}
		
		public function iniciaPartida():void
		{
			// adiciona mapa ao jogo
			var mapa:Mapa = new Mapa();
			addChild(mapa);
			
			// adiciona jogadores
			var p1:Personagem = new Personagem("monstro");
			addChild(p1);
		}
	
	}

}