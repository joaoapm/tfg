﻿class TelaPrincipal extends Tela {

    constructor() {
        super();
    }

    preload() {
        this.game.load.image('logo', 'media/img/phaser2.png');
    }

    create() {
        var logo = this.game.add.sprite(this.game.world.centerX, this.game.world.centerY, 'logo');
        logo.anchor.setTo(0.5, 0.5);
        logo.scale.setTo(0.2, 0.2);
        logo.anchor.setTo(0.5, 0.5);

        this.game.add.tween(logo.scale).to({ x: 1, y: 1 }, 2000, Phaser.Easing.Bounce.Out, true);
    }

}