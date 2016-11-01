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
        this.game.time.advancedTiming = true;
        this.game.debug.renderShadow = false;
        this.game.stage.disableVisibilityChange = true;
        this.game.load.atlasJSONHash('tileset', 'media/img/tile_mapa.png', 'media/img/atlas_mapa.json');
        this.game.physics.startSystem(Phaser.Plugin.Isometric.ISOARCADE);
    };
    TelaJogo.prototype.create = function () {
        this.map = this.game.add.tilemap('level1');
        // adiciona mapa
        this.mapa = new Mapa(this.game);
        this.mapa.create();
    };
    return TelaJogo;
}(Tela));
//# sourceMappingURL=TelaJogo.js.map