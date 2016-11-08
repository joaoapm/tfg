package com.j01.entidades;

import com.j01.estrutura.TipoPersonagem;

public class Partida {

	private TipoPersonagem personagemTurno;
	private Mapa mapa;
	private Personagem personagemSelecionado;

	public TipoPersonagem getPersonagemTurno() {
		return personagemTurno;
	}

	public void setPersonagemTurno(TipoPersonagem personagemTurno) {
		this.personagemTurno = personagemTurno;
	}

	public Mapa getMapa() {
		return mapa;
	}

	public void setMapa(Mapa mapa) {
		this.mapa = mapa;
	}

	public Personagem getPersonagemSelecionado() {
		return personagemSelecionado;
	}

	public void setPersonagemSelecionado(Personagem personagemSelecionado) {
		this.personagemSelecionado = personagemSelecionado;
	}

}
