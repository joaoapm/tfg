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
		private var pathFind2:Pathfinder;
		private var listaIniAoRedor:Array;
		private var caminho:Array;
		private var caminho2:Array;
		private var qntAoRedor:Number;
		private var dist:Number;
		
		public function ExecutaAcaoIA(mapa:Mapa, listaPerso:Array):void {
			this.mapa = mapa;
			this.listaPersonagens = listaPerso;
			
			atualizaTimes();
		
		}
		
		private function atualizaTimes():void {
			this.persoTime1 = new Array();
			this.persoTime0 = new Array();
			
			for each (var p:Personagem in this.listaPersonagens) {
					if (p.vida > 1) {
							if (p.time == 0)
								persoTime0.push(p)
							else
								persoTime1.push(p)
						}
				}
			
			if (persoTime1[0] != null)
				persoTime1Ataque.push(persoTime1[0]);
			
			if (persoTime1[1] != null)
				persoTime1Ataque.push(persoTime1[1]);
			
			if (persoTime1[2] != null)
				persoTime1Defesa.push(persoTime1[2]);
		}
		
		public function processaJogadaSimples():void {
			
			atualizaTimes();
			
			if (persoTime0.length > 0) {
				
				// personagem a ser processado
					var persoSort:Personagem = persoTime0[randomRange(0, persoTime0.length - 1)];
					
					// personagem ao redor
					var listaIniAoRedorSort:Array = pesqIniAoRedor(persoSort.casaAtual, 1);
					var qntAoRedorIniSort:Number = 0;
					if (listaIniAoRedor != null)
						qntAoRedorIniSort = listaIniAoRedorSort.length;
					
					 
					// distancia torre inimiga
					var pathFindSort:Pathfinder = new Pathfinder();
					var caminhoSort:Array = pathFindSort.pesquisaCaminho(persoSort.casaAtual, mapa.torre1[2]);
					pathFindSort.caminhoInv = new Array();
					caminhoSort = pathFindSort.caminho;
					var distTSort:Number = caminhoSort.length;
					
					var sort:Number = randomRange(0, 100);
					
					// move
					if (sort > 0 && sort <= 50) {
							if (distTSort < 4) {
									persoSort.personagemAtacando = null;
									mapa.atacaTorre(mapa.torre1[2], persoSort);
								} else {
									persoSort.setLocalPersonagem(caminhoSort[1]);
								}
						} else {
							// ataca
							
							if (qntAoRedorIniSort == 0) {
									if (distTSort < 4) {
											persoSort.personagemAtacando = null;
											mapa.atacaTorre(mapa.torre1[2], persoSort);
										} else {
											persoSort.setLocalPersonagem(caminhoSort[1]);
										}
									
								} else {
									var sortArk:Number = randomRange(0, 100);
									if (sortArk > 0 && sortArk < 70) {
											var persoAtkSort:Personagem = listaIniAoRedorSort[randomRange(0, listaIniAoRedorSort.length - 1)];
											persoAtkSort.sofreAtaque();
											persoSort.ataca();
										} else {
											if (distTSort < 4) {
													persoSort.personagemAtacando = null;
													mapa.atacaTorre(mapa.torre1[2], persoSort);
												} else {
													persoSort.setLocalPersonagem(caminhoSort[1]);
												}
											
										}
									
								}
							
						}
				}
		}
		
		public function processaJogada():void {
			
			atualizaTimes();
			
			if (persoTime1.length > 0) {
				
				// se perso mt perto base
					var possuipers:Boolean = false;
					for each (var persoPer:Personagem in this.persoTime1) {
						
							if ((persoPer.time == 1 && persoPer.vida > 1 && persoPer.personagemAtacando != null)) {
									possuipers = true;
								}
						}
					
					if (!possuipers) {
							var pathFind3:Pathfinder = new Pathfinder();
							for each (var persoPerto:Personagem in this.listaPersonagens) {
								
									if ((persoPerto.time == 0 && persoPerto.vida > 1)) {
										
											persoPerto.casaAtual.casaPersegue = true;
											var caminhoPerto:Array = pathFind3.pesquisaCaminho(persoPerto.casaAtual, mapa.torre1[2]);
											persoPerto.casaAtual.casaPersegue = false;
											
											if (caminhoPerto.length < 4) {
												
													var maisProximo:Number = 9999999;
													var caminhoPertoT:Array;
													
													for each (var persoAtacar:Personagem in this.listaPersonagens) {
															if (persoAtacar.time == 1 && persoAtacar.personagemAtacando == null && persoAtacar.vida > 1) {
																	persoPerto.casaAtual.casaPersegue = true;
																	persoPerto.casaAtual.casaPersegue = true;
																	caminhoPerto = pathFind3.pesquisaCaminho(persoAtacar.casaAtual, persoPerto.casaAtual);
																	persoPerto.casaAtual.casaPersegue = false;
																	persoPerto.casaAtual.casaPersegue = false;
																	if (caminhoPerto.length < maisProximo) {
																			maisProximo = caminhoPerto.length;
																			persoAtacar.personagemAtacando = persoPerto;
																		}
																}
															
														}
													break;
													
												}
											
										}
								}
						}
					
					// se possui algum personagem atacando, ataca ate matar/morrer
					var persoAtacando:Personagem;
					
					for each (var persoAtkando:Personagem in this.persoTime1) {
							if ((persoAtkando.time == 1 && persoAtkando.personagemAtacando != null && persoAtkando.personagemAtacando.vida > 1) || persoAtkando.isAtqTorre) {
									persoAtacando = persoAtkando;
								}
							
						}
					
					if ((persoAtacando != null && persoAtacando.personagemAtacando != null && !persoAtacando.isCasaDestinoValida(persoAtacando.personagemAtacando.casaAtual)) && (persoAtacando.personagemAtacando.vida > 0)
					
					) {
						
							pathFind2 = new Pathfinder();
							persoAtacando.personagemAtacando.casaAtual.casaPersegue = true;
							caminho2 = pathFind2.pesquisaCaminho(persoAtacando.casaAtual, persoAtacando.personagemAtacando.casaAtual);
							persoAtacando.personagemAtacando.casaAtual.casaPersegue = !true;
							
							if (caminho2.length == 1)
								persoAtacando.setLocalPersonagem(caminho2[1]);
							else if (caminho2.length > 1)
								persoAtacando.setLocalPersonagem(caminho2[2]);
							
						} else if (persoAtacando != null && persoAtacando.personagemAtacando != null && persoAtacando.personagemAtacando.vida > 1 && persoAtacando.personagemAtacando != null && persoAtacando.isCasaDestinoValida(persoAtacando.personagemAtacando.casaAtual)) {
							
							persoAtacando.personagemAtacando.sofreAtaque();
							persoAtacando.ataca();
							if (persoAtacando.personagemAtacando != null && persoAtacando.personagemAtacando.vida <= 1)
								perso.personagemAtacando = null;
						} else if (persoAtacando != null && persoAtacando.isAtqTorre) {
							ATACA_TORRE();
						} else {
							
							// personagem a ser processado
							perso = persoTime1[randomRange(0, persoTime1.length - 1)];
							
							// personagem ao redor
							listaIniAoRedor = pesqIniAoRedor(perso.casaAtual, 0);
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
							
							this[principalIA.exprRetorno.metodoExecuta]();
						}
				}
		}
		
		public function MOVE_ATACA_TORRE_INI():void {
			
			MOVE_TORRE_INI();
		}
		
		public function MOVE_ATACA_INI():void {
			
			if (qntAoRedor > 0) {
					var persoAtk:Personagem = listaIniAoRedor[0];
					if (persoAtk.vida > 1) {
							principalIA.processarLuta(perso.vida, persoAtk.vida);
							this[principalIA.exprRetornoLuta.metodoExecuta]();
						} else {
							MOVE_TORRE_INI();
						}
				} else {
					MOVE_TORRE_INI();
				}
		}
		
		public function MOVE_TORRE_INI():void {
			perso.personagemAtacando = null;
			if (dist < 4)
				ATACA_TORRE();
			else
				perso.setLocalPersonagem(caminho[1]);
		}
		
		public function ATACA_TORRE():void {
			perso.personagemAtacando = null;
			perso.isAtqTorre = true;
			mapa.atacaTorre(mapa.torre0[2], perso);
		}
		
		public function ATACA_INI():void {
			var persoAtk:Personagem = listaIniAoRedor[0];
			if (persoAtk != null) {
					perso.personagemAtacando = persoAtk;
					persoAtk.sofreAtaque();
					perso.ataca();
				}
		
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
		
		public function pesqIniAoRedor(casa:Casa, time:Number):Array {
			var listaIni:Array = new Array();
			
			if (casa.casaD1 != null && casa.casaD1.personagemAtual != null && casa.casaD1.personagemAtual.time == time){
				
				listaIni.push(casa.casaD1.personagemAtual);
			}
			
			if (casa.casaD2 != null && casa.casaD2.personagemAtual != null && casa.casaD2.personagemAtual.time == time){
				
				listaIni.push(casa.casaD2.personagemAtual);
			}
			
			if (casa.casaD3 != null && casa.casaD3.personagemAtual != null && casa.casaD3.personagemAtual.time == time){
				
				listaIni.push(casa.casaD3.personagemAtual);
			}
			
			if (casa.casaD4 != null && casa.casaD4.personagemAtual != null && casa.casaD4.personagemAtual.time == time){
				
				listaIni.push(casa.casaD4.personagemAtual);
			}
			
			if (casa.casaFR != null && casa.casaFR.personagemAtual != null && casa.casaFR.personagemAtual.time == time){
				
				listaIni.push(casa.casaFR.personagemAtual);
			}
			
			if (casa.casaTR != null && casa.casaTR.personagemAtual != null && casa.casaTR.personagemAtual.time == time){
				
				listaIni.push(casa.casaTR.personagemAtual);
			}
			
			if (casa.casaLD != null && casa.casaLD.personagemAtual != null && casa.casaLD.personagemAtual.time == time){
				
				listaIni.push(casa.casaLD.personagemAtual);
			}
			
			if (casa.casaLE != null && casa.casaLE.personagemAtual != null && casa.casaLE.personagemAtual.time == time){
				
				listaIni.push(casa.casaLE.personagemAtual);
			}
			
			pesqIniAoRedorAux(casa.casaD1, listaIni, time);
			pesqIniAoRedorAux(casa.casaD2, listaIni, time);
			pesqIniAoRedorAux(casa.casaD3, listaIni, time);
			pesqIniAoRedorAux(casa.casaD4, listaIni, time);
			pesqIniAoRedorAux(casa.casaFR, listaIni, time);
			pesqIniAoRedorAux(casa.casaTR, listaIni, time);
			pesqIniAoRedorAux(casa.casaLD, listaIni, time);
			pesqIniAoRedorAux(casa.casaLE, listaIni, time);
			
			return listaIni;
		}
		
		public function pesqIniAoRedorAux(casa:Casa, listaIni:Array, time:Number):void {
			
			if (casa.casaD1 != null && casa.casaD1.personagemAtual != null && casa.casaD1.personagemAtual.time == time) {
					if (listaIni.indexOf(casa.casaD1.personagemAtual) == -1)
						listaIni.push(casa.casaD1.personagemAtual);
				}
			
			if (casa.casaD2 != null && casa.casaD2.personagemAtual != null && casa.casaD2.personagemAtual.time == time) {
					if (listaIni.indexOf(casa.casaD2.personagemAtual) == -1)
						listaIni.push(casa.casaD2.personagemAtual);
				}
			
			if (casa.casaD3 != null && casa.casaD3.personagemAtual != null && casa.casaD3.personagemAtual.time == time) {
					if (listaIni.indexOf(casa.casaD3.personagemAtual) == -1)
						listaIni.push(casa.casaD3.personagemAtual);
				}
			
			if (casa.casaD4 != null && casa.casaD4.personagemAtual != null && casa.casaD4.personagemAtual.time == time) {
					if (listaIni.indexOf(casa.casaD4.personagemAtual) == -1)
						listaIni.push(casa.casaD4.personagemAtual);
				}
			
			if (casa.casaFR != null && casa.casaFR.personagemAtual != null && casa.casaFR.personagemAtual.time == time) {
					if (listaIni.indexOf(casa.casaFR.personagemAtual) == -1)
						listaIni.push(casa.casaFR.personagemAtual);
				}
			
			if (casa.casaTR != null && casa.casaTR.personagemAtual != null && casa.casaTR.personagemAtual.time == time) {
					if (listaIni.indexOf(casa.casaTR.personagemAtual) == -1)
						listaIni.push(casa.casaTR.personagemAtual);
				}
			
			if (casa.casaLD != null && casa.casaLD.personagemAtual != null && casa.casaLD.personagemAtual.time == time) {
					if (listaIni.indexOf(casa.casaLD.personagemAtual) == -1)
						listaIni.push(casa.casaLD.personagemAtual);
				}
			
			if (casa.casaLE != null && casa.casaLE.personagemAtual != null && casa.casaLE.personagemAtual.time == time) {
					if (listaIni.indexOf(casa.casaLE.personagemAtual) == -1)
						listaIni.push(casa.casaLE.personagemAtual);
				}
		
		}
		
		private function randomRange(minNum:Number, maxNum:Number):Number {
			return (Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum);
		}
	
	}

}
