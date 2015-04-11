package com.jogoTcc.entidade;

import java.util.ArrayList;

import com.jogoTcc.estrutura.Partida;
import com.jogoTcc.estrutura.TipoJogador;

public class Jogador {

	private TipoJogador tipoJogador;
	private ArrayList<Entidade> entidades = new ArrayList<Entidade>();
	private Integer nroPersonagens;

	public Jogador(TipoJogador tipoJogador, Integer nroPersonagens) {

		// instancia entidades do jogador
		this.tipoJogador = tipoJogador;
		this.nroPersonagens = nroPersonagens;

		for (int i = 0; i < this.nroPersonagens; i++) {
			entidades.add(new Entidade(this.tipoJogador));
		}

		// adiciona entidades para lista de renderizacao
		Partida.entidades.addAll(entidades);

	}

}
