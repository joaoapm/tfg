var Entidade = (function () {
    function Entidade(game) {
        this._game = game;
    }
    Object.defineProperty(Entidade.prototype, "id", {
        get: function () {
            return this._id;
        },
        set: function (id) {
            this._id = id;
        },
        enumerable: true,
        configurable: true
    });
    Object.defineProperty(Entidade.prototype, "game", {
        get: function () {
            return this._game;
        },
        set: function (game) {
            this._game = game;
        },
        enumerable: true,
        configurable: true
    });
    return Entidade;
}());
//# sourceMappingURL=Entidade.js.map