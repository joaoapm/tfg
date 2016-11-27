package com.j01.entidades;

import com.j01.estrutura.TipoPersonagem;
import com.j01.helper.MapaHelper;

public class Partida {

	private TipoPersonagem personagemTurno;
	private Mapa mapa;
	private Personagem personagemSelecionado;
	private Personagem personagemAtaque;
	private int timeTurno = 0;

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

	public int getTimeTurno() {
		return timeTurno;
	}

	public void setTimeTurno(int timeTurno) {
		this.timeTurno = timeTurno;
	}

	public void trocaTurno() {
		if (timeTurno == 0)
			timeTurno = 1;
		else
			timeTurno = 0;
	}

	public Personagem getPersonagemAtaque() {
		return personagemAtaque;
	}

	public void setPersonagemAtaque(Personagem personagemAtaque) {
		this.personagemAtaque = personagemAtaque;
	}

	public void ataquePersonagem() {
		getPersonagemAtaque().setVida(getPersonagemAtaque().getVida() - 1);
	}

	public void atualizaPartida() {
		if(personagemAtaque != null && personagemAtaque.getVida() == 0)
			personagemAtaque.setRemovido(true);
	}

}
