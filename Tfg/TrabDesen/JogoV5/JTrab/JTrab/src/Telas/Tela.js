var __extends = (this && this.__extends) || function (d, b) {
    for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p];
    function __() { this.constructor = d; }
    d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
};
var Tela = (function (_super) {
    __extends(Tela, _super);
    function Tela() {
        _super.call(this);
    }
    Object.defineProperty(Tela.prototype, "id", {
        get: function () {
            return this._id;
        },
        set: function (id) {
            this._id = id;
        },
        enumerable: true,
        configurable: true
    });
    Object.defineProperty(Tela.prototype, "game", {
        get: function () {
            return this._game;
        },
        set: function (game) {
            this._game = game;
        },
        enumerable: true,
        configurable: true
    });
    return Tela;
}(Phaser.State));
//# sourceMappingURL=Tela.js.map