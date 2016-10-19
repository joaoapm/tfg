class Entidade {
    private _id: Number;
    private _time: Number;
    private _vida: Number;

    constructor() {

    }

    get id(): Number {
        return this._id;
    }

    set id(id: Number) {
        this._id = id;
    }

}