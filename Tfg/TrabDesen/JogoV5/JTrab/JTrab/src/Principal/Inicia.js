var __extends = (this && this.__extends) || function (d, b) {
    for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p];
    function __() { this.constructor = d; }
    d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
};
var Jtrab;
(function (Jtrab) {
    var Game = (function (_super) {
        __extends(Game, _super);
        function Game() {
            _super.call(this, 700, 600, Phaser.AUTO, 'gameCanvas', null);
        }
        Game.prototype.boot = function () {
            _super.prototype.boot.call(this);
            this.isoPlugin = this.add.plugin(new Phaser.Plugin.Isometric(this));
            this.state.add("TelaPrincipal", TelaPrincipal, false);
            this.state.add("TelaJogo", TelaJogo, false);
            this.state.start("TelaJogo", true, true);
        };
        return Game;
    }(Phaser.Game));
    Jtrab.Game = Game;
})(Jtrab || (Jtrab = {}));
window.onload = function () {
    var jogo = new Jtrab.Game();
};
//# sourceMappingURL=Inicia.js.map