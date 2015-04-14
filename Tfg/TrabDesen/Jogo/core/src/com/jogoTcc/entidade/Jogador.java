package com.jogoTcc.entidade;

import java.util.ArrayList;

import com.badlogic.gdx.scenes.scene2d.Stage;
import com.jogoTcc.estrutura.Partida;
import com.jogoTcc.estrutura.TipoJogador;

public class Jogador {

	private TipoJogador tipoJogador;
	private ArrayList<Entidade> entidades = new ArrayList<Entidade>();
	private Integer nroPersonagens;
	private Stage palco;

	public Jogador(TipoJogador tipoJogador, Integer nroPersonagens, Stage palco) {

		// instancia entidades do jogador
		this.tipoJogador = tipoJogador;
		this.nroPersonagens = nroPersonagens;
		this.palco = palco;

		for (int i = 0; i < this.nroPersonagens; i++) {
			this.palco.addActor(new Entidade(this.tipoJogador));
		}

	}

}
