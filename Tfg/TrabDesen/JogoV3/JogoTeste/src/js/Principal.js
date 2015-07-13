// Classe que cuida dos aspectos gerais do jogo

// variaveis globais
var game = new Phaser.Game(800, 600, Phaser.AUTO, 'jogo', { preload: preload, create: create, update: update });
var mapa;

function preload() { 
	mapa = new Mapa();
	mapa.carregaMapa();
}

function create() {
	mapa.criaMapa();
}

function update() {
	mapa.atualizaMapa();
}
