class TelaJogo extends Tela {

    mapa: Mapa;

    constructor() {
        super();
    }

    preload() {
        this.game.load.image('tile', 'media/img/tile.png');
    }

    create() {

        // adiciona mapa
        this.mapa = new Mapa(this.game);
        this.mapa.create();


    }

}