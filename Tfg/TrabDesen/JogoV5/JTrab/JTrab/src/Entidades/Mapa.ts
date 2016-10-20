class Mapa extends Entidade {

    isoGroup: Phaser.Group;

    constructor(game: Jtrab.Game) {
        super(game);
    }

    create() {

        this.isoGroup = this.game.add.group();

        var tile;
        for (var xx = 0; xx < 256; xx += 38) {
            for (var yy = 0; yy < 256; yy += 38) {

                tile = this.game.isoPlugin.addIsoSprite(xx, yy, 0, 'tile', 0, this.isoGroup);
                tile.anchor.set(0.5, 0);
            }
        }

    }

}