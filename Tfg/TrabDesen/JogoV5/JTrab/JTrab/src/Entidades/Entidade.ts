﻿class Entidade {

    private _id: Number;
    private _game: Jtrab.Game;

    constructor(game: Jtrab.Game) {
        this._game = game;
    }

    get id(): Number {
        return this._id;
    }

    set id(id: Number) {
        this._id = id;
    }

    get game(): Jtrab.Game {
        return this._game;
    }

    set game(game: Jtrab.Game) {
        this._game = game;
    }

}