package jogoTCC.entidades
{
	
	import jogoTCC.entidades.Casa;
	import starling.display.Sprite;
	import flash.display.Bitmap;
	import starling.textures.Texture;
	import starling.display.Image;
	
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
		
		public function Mapa()
		{
			iniciaImagemMapa();
			iniciaCasas();
		}
		
		private function iniciaImagemMapa():void
		{
			// adiciona imagem do mapa
			var bitmap:Bitmap = new MAPA();
			var textura:Texture = Texture.fromBitmap(new MAPA());
			var imagem:Image = new Image(textura);
			
			imagem.x = 0;
			imagem.y = -65;
			
			imagem.scaleX = 1.5;
			imagem.scaleY = 1.5;
			
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
					casa = new Casa(i, j, INICIO_X, INICIO_Y, ALPHA);
					casa.c = i;
					casa.l = j;
					casas[i][j] = casa;
					addChild(casa);
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
			var camada:Number = 2;
			
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
	
	}

}
