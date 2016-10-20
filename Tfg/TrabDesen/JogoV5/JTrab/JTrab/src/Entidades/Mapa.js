var __extends = (this && this.__extends) || function (d, b) {
    for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p];
    function __() { this.constructor = d; }
    d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
};
var Mapa = (function (_super) {
    __extends(Mapa, _super);
    function Mapa(game) {
        _super.call(this, game);
    }
    Mapa.prototype.create = function () {
        this.isoGroup = this.game.add.group();
        var tile;
        for (var xx = 0; xx < 256; xx += 38) {
            for (var yy = 0; yy < 256; yy += 38) {
                tile = this.game.isoPlugin.addIsoSprite(xx, yy, 0, 'tile', 0, this.isoGroup);
                tile.anchor.set(0.5, 0);
            }
        }
    };
    return Mapa;
}(Entidade));
//# sourceMappingURL=Mapa.js.map