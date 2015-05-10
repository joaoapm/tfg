package jogoTCC.entidades
{
	
	import flash.display.CapsStyle;
	import jogoTCC.entidades.Casa;
	import jogoTCC.modelo.TipoJogador;
	import starling.display.Sprite;
	import flash.display.Bitmap;
	import starling.textures.Texture;
	import starling.display.Image;
	import jogoTCC.entidades.BarraVida;
	
	public class Mapa extends Sprite
	{
		
		// variaveis de controle da criacao das casas
		private var INICIO_X:Number = 45
		private var INICIO_Y:Number = 500;
		private var ALPHA:Number = 0;
		
		// instancia variavel com imagem do mapa
		[Embed(source="../../../assets/mapa/mapa.png")]
		private var MAPA:Class;
		
		// estrutura contendo referencia a todas as casas do mapa  
		public var casas:Array = [];
		public var torre0:Array = new Array();
		public var torre1:Array = new Array();
		
		private var barraVida:BarraVida;
		private var vidaAtualC0:Image;
		private var vidaAtualC1:Image;
		public var vidaC0:Number = 10;
		public var vidaC1:Number = 10;
		
		public function Mapa()
		{
			iniciaImagemMapa();
			iniciaCasas();
			iniciaCasasTorres();
		}
		
		private function iniciaImagemMapa():void
		{
			// adiciona imagem do mapa
			var bitmap:Bitmap = new MAPA();
			var textura:Texture = Texture.fromBitmap(new MAPA());
			var imagem:Image = new Image(textura);
			
			imagem.x = 0;
			imagem.y = -65;
			
			addChild(imagem);
		
		}
		
		private function iniciaCasas():void
		{
			// cria casas
			var casa:Casa;
			var camada:Number = 1;
			
			for (var i:Number = 0; i < 19; i++)
			{
				if (casas[i] == undefined)
					casas[i] = [];
				
				for (var j:Number = 0; j < 24; j++)
				{
					casa = new Casa(i, j, INICIO_X, INICIO_Y, ALPHA, i, j);
					casas[i][j] = casa;
					addChild(casa);
					casa.iniciaTorre();
					casa.camada = camada;
					camada += 1;
				}
			}
			
			for (i = 0; i < 19; i++)
			{
				for (j = 0; j < 24; j++)
				{
					var casaAtual:Casa = casas[i][j] as Casa;
					
					// seta casa a tras
					if ((j - 1) > 0)
						casaAtual.casaTR = casas[i][j - 1];
					
					// seta casa a frente
					if ((j + 1) <= 24)
						casaAtual.casaFR = casas[i][j + 1];
					
					// seta casa a direita
					if ((i - 1) > 0)
						casaAtual.casaLD = casas[i - 1][j];
					
					// seta casa a esquerda
					if ((i + 1) < 19)
						casaAtual.casaLE = casas[i + 1][j];
					
					// seta casa a D1
					if ((i + 1) < 19 && (j + 1) < 24)
						casaAtual.casaD1 = casas[i + 1][j + 1];
					
					// seta casa a D2
					if ((i + 1) < 19 && (j - 1) >= 0)
						casaAtual.casaD2 = casas[i + 1][j - 1];
					
					// seta casa a D3
					if ((i - 1) >= 0 && (j + 1) < 24)
						casaAtual.casaD3 = casas[i - 1][j + 1];
					
					// seta casa a D4
					if ((i - 1) >= 0 && (j - 1) >= 0)
						casaAtual.casaD4 = casas[i - 1][j - 1];
					
				}
			}
		
		}
		
		public function organizaLayers(listaPersonagens:Array):void
		{
			ordenaLayers(listaPersonagens);
			var camada:Number = 11;
			
			for each (var perso:Personagem in listaPersonagens)
			{
				if (this.parent.getChildIndex(perso) != -1)
				{
					this.parent.setChildIndex(perso, camada);
					camada += 1;
				}
			}
		}
		
		public function ordenaLayers(listaPersonagens:Array):void
		{
			var alterado:Boolean = false;
			
			while (!alterado)
			{
				alterado = true;
				
				for (var i:int = 0; i < listaPersonagens.length - 1; i++)
				{
					var per:Personagem = listaPersonagens[i] as Personagem;
					var per2:Personagem = listaPersonagens[i + 1] as Personagem;
					
					if ((per.casaAtual.camada) < (per2.casaAtual.camada))
					{
						var tmp:Personagem = listaPersonagens[i];
						listaPersonagens[i] = listaPersonagens[i + 1];
						listaPersonagens[i + 1] = tmp;
						
						alterado = false;
					}
				}
			}
		
		}
		
		public function atacaTorre(casa:Casa, perso:Personagem):void
		{
			if (perso.animacaoFinalizada && casa.nrTime != perso.time)
			{
				if (casa.nrTime == 0 && isCasaTorreValida(perso, casa, torre0))
				{
					vidaC0 -= 1;
					this.vidaAtualC0 = atualizaVida(this.vidaAtualC0, vidaC0, 470, 180);
					perso.ataca();
				}
				else if (casa.nrTime == 1 && isCasaTorreValida(perso, casa, torre1))
				{
					vidaC1 -= 1;
					this.vidaAtualC1 = atualizaVida(this.vidaAtualC1, vidaC1, 1495, 830);
					perso.ataca();
				}
				
			}
		}
		
		public function isCasaTorreValida(perso:Personagem, casa:Casa, torre:Array):Boolean
		{
			// verifica se a casa eh de uma torre
			var isTorreNaRange:Boolean = false;
			for (var i:Number = 0; i < torre.length; i++)
			{
				var casaTorre:Casa = torre[i] as Casa;
				if (casaTorre == casa)
				{
					isTorreNaRange = true;
				}
			}
			
			// verifica se ha uma casa na range
			if (isTorreNaRange)
			{
				isTorreNaRange = false;
				{
					for (i = 0; i < torre.length; i++)
					{
						casaTorre = torre[i] as Casa;
						if (perso.isCasaDestinoValida(casaTorre))
						{
							isTorreNaRange = true;
						}
					}
				}
			}
			return isTorreNaRange;
		}
		
		private function iniciaCasasTorres():void
		{
			this.vidaAtualC0 = atualizaVida(this.vidaAtualC0, vidaC0, 470, 180);
			this.vidaAtualC1 = atualizaVida(this.vidaAtualC1, vidaC1, 1495, 830);
		}
		
		private function atualizaVida(vida:Image, nrVida:Number, pX:Number, pY:Number):Image
		{
			barraVida = new BarraVida();
			
			if (vida != null)
			{
				vida.dispose();
				vida.removeFromParent();
			}
			if (nrVida == 10)
				vida = barraVida.imgVidac1;
			if (nrVida == 9)
				vida = barraVida.imgVidac2;
			if (nrVida == 8)
				vida = barraVida.imgVidac3;
			if (nrVida == 7)
				vida = barraVida.imgVidac4;
			if (nrVida == 6)
				vida = barraVida.imgVidac5;
			if (nrVida == 5)
				vida = barraVida.imgVidac6;
			if (nrVida == 4)
				vida = barraVida.imgVidac7;
			if (nrVida == 3)
				vida = barraVida.imgVidac8;
			if (nrVida == 2)
				vida = barraVida.imgVidac9;
			if (nrVida == 1)
				vida = barraVida.imgVidac10;
			
			addChild(vida);
			vida.y = pY;
			vida.x = pX;
			
			return vida;
		
		}
	
	}

}
