var __extends = (this && this.__extends) || function (d, b) {
    for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p];
    function __() { this.constructor = d; }
    d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
};
var TelaJogo = (function (_super) {
    __extends(TelaJogo, _super);
    function TelaJogo() {
        _super.call(this);
    }
    TelaJogo.prototype.preload = function () {
        this.game.load.image('tile', 'media/img/tile.png');
    };
    TelaJogo.prototype.create = function () {
        // adiciona mapa
        this.mapa = new Mapa(this.game);
        this.mapa.create();
    };
    return TelaJogo;
}(Tela));
//# sourceMappingURL=TelaJogo.js.map