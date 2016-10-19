var TelaPrincipal = (function () {
    function TelaPrincipal() {
        this.game = new Phaser.Game(800, 600, Phaser.AUTO, 'content', { preload: this.preload, create: this.create });
    }
    TelaPrincipal.prototype.preload = function () {
        this.game.load.image('logo', 'media/img/phaser2.png');
    };
    TelaPrincipal.prototype.create = function () {
        var logo = this.game.add.sprite(this.game.world.centerX, this.game.world.centerY, 'logo');
        logo.anchor.setTo(0.5, 0.5);
        logo.scale.setTo(0.2, 0.2);
        logo.anchor.setTo(0.5, 0.5);
        this.game.add.tween(logo.scale).to({ x: 1, y: 1 }, 2000, Phaser.Easing.Bounce.Out, true);
    };
    return TelaPrincipal;
}());
//# sourceMappingURL=TelaPrincipal.js.map