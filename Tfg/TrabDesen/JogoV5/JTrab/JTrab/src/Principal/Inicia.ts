module Jtrab {
    export class Game extends Phaser.Game {

        isoPlugin: Phaser.Plugin.Isometric;

        constructor() {
            super(700, 600, Phaser.AUTO, 'gameCanvas', null);
        }

        boot() {
            super.boot();
            this.isoPlugin = <Phaser.Plugin.Isometric>this.add.plugin(new Phaser.Plugin.Isometric(this));

            this.state.add("TelaPrincipal", TelaPrincipal, false);
            this.state.add("TelaJogo", TelaJogo, false);

            this.state.start("TelaJogo", true, true);
        }

    }

}

window.onload = () => {
    var jogo = new Jtrab.Game();
};