package com.j01.entidades;

import com.badlogic.gdx.math.Vector3;

public class Casa extends Entidade {

	private Vector3 posicaoMapa;
	private Vector3 posicaoTela;

	public Casa() {
	}

	public Casa(Vector3 posicaoMaoa, Vector3 posicaoTela) {
		super();
		this.posicaoMapa = posicaoMaoa;
		this.posicaoTela = posicaoTela;
	}

	public Casa(int cx, int cy) {
		super();
		this.posicaoMapa = new Vector3(cx, cy, 0);
	}

	public Vector3 getPosicaoTela() {
		return posicaoTela;
	}

	public void setPosicaoTela(Vector3 posicaoTela) {
		this.posicaoTela = posicaoTela;
	}

	public Vector3 getPosicaoMapa() {
		return posicaoMapa;
	}

	public void setPosicaoMapa(Vector3 posicaoMapa) {
		this.posicaoMapa = posicaoMapa;
	}

}
