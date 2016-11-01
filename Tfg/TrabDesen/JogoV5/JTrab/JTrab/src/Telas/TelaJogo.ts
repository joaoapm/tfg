class TelaJogo extends Tela {

    mapa: Mapa;
    map;
    constructor() {
        super();
    }

    preload() {
 
        this.game.time.advancedTiming = true;
        this.game.debug.renderShadow = false;
        this.game.stage.disableVisibilityChange = true;


        this.game.load.atlasJSONHash('tileset', 'media/img/tile_mapa.png', 'media/img/atlas_mapa.json');

        this.game.physics.startSystem(Phaser.Plugin.Isometric.ISOARCADE);
 

    }

    create() {


        this.map = this.game.add.tilemap('level1');

        // adiciona mapa
        this.mapa = new Mapa(this.game);
        this.mapa.create();


    }

}