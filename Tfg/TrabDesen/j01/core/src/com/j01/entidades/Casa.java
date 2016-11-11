package com.j01.entidades;

import com.badlogic.gdx.math.Vector3;

public class Casa extends Entidade {

	private int x, y;
	private Vector3 posicao;

	public Casa(int x, int y, Vector3 posicaoCasa) {
		this.x = x;
		this.y = y;
		this.posicao = posicaoCasa;
	}

	public int getX() {
		return x;
	}

	public void setX(int x) {
		this.x = x;
	}

	public int getY() {
		return y;
	}

	public void setY(int y) {
		this.y = y;
	}

	public Vector3 getPosicao() {
		return posicao;
	}

	public void setPosicao(Vector3 posicao) {
		this.posicao = posicao;
	}

}
