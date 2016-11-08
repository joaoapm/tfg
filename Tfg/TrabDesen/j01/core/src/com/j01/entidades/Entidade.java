package com.j01.entidades;

import com.badlogic.gdx.math.Vector3;

public class Entidade {

	private float elapsedTime = 0;
	private Vector3 posicao;
	private Partida partida;

	public Partida getPartida() {
		return partida;
	}

	public void setPartida(Partida partida) {
		this.partida = partida;
	}

	public float getElapsedTime() {
		return elapsedTime;
	}

	public void setElapsedTime(float elapsedTime) {
		this.elapsedTime = elapsedTime;
	}

	public Vector3 getPosicao() {
		return posicao;
	}

	public void setPosicao(Vector3 posicao) {
		this.posicao = posicao;
	}

}
