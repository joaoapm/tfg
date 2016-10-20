var __extends = (this && this.__extends) || function (d, b) {
    for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p];
    function __() { this.constructor = d; }
    d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
};
var TelaPrincipal = (function (_super) {
    __extends(TelaPrincipal, _super);
    function TelaPrincipal() {
        _super.call(this);
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
}(Tela));
//# sourceMappingURL=TelaPrincipal.js.map