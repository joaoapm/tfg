var Entidade = (function () {
    function Entidade() {
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
    return Entidade;
}());
//# sourceMappingURL=Entidade.js.map