class Jogo {

    jogo: Phaser.Game;

    constructor() {

        this.jogo = new Phaser.Game(800, 600, Phaser.AUTO, 'conteudo');
        this.jogo.state.add("TelaPrincipal", TelaPrincipal, false);        
        this.jogo.state.start("TelaPrincipal", true, true);

    }

}