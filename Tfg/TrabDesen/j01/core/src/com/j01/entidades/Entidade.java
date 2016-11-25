package com.j01.entidades;

import com.badlogic.gdx.graphics.g2d.SpriteBatch;
import com.badlogic.gdx.graphics.glutils.ShapeRenderer;
import com.badlogic.gdx.math.Vector3;

public class Entidade implements Comparable<Entidade> {

	private float tempoDecorrido = 0;
	private Partida partida;
	private boolean isPosAtualizada;
	private boolean isModoDebug;
	private boolean isMovendo;
	private int camada;
	private Casa casaAtual;

	private Vector3 posicaoInicial = new Vector3(), posicaoFinal = new Vector3(), posicaoAtual = new Vector3();

	public Vector3 getPosicaoInicial() {
		return posicaoInicial;
	}

	public void setPosicaoInicial(Vector3 posicaoInicial) {
		this.posicaoInicial = posicaoInicial;
	}

	public Vector3 getPosicaoFinal() {
		return posicaoFinal;
	}

	public void setPosicaoFinal(Vector3 posicaoFinal) {
		this.posicaoFinal = posicaoFinal;
	}

	public Vector3 getPosicaoAtual() {
		return posicaoAtual;
	}

	public void setPosicaoAtual(Vector3 posicaoAtual) {
		this.posicaoAtual = posicaoAtual;
	}

	public Casa getCasaAtual() {
		return casaAtual;
	}

	public void setCasaAtual(Casa casaAtual) {
		this.casaAtual = casaAtual;
	}

	public boolean isMovendo() {
		return isMovendo;
	}

	public void setMovendo(boolean isMovendo) {
		this.isMovendo = isMovendo;
	}

	public int getCamada() {
		return camada;
	}

	public void setCamada(int camada) {
		this.camada = camada;
	}

	public boolean isPosAtualizada() {
		return isPosAtualizada;
	}

	public void setPosAtualizada(boolean isPosAtualizada) {
		this.isPosAtualizada = isPosAtualizada;
	}

	public Partida getPartida() {
		return partida;
	}

	public void setPartida(Partida partida) {
		this.partida = partida;
	}

	public float getTempoDecorrido() {
		return tempoDecorrido;
	}

	public void setTempoDecorrido(float tempoDecorrido) {
		this.tempoDecorrido = tempoDecorrido;
	}

	public boolean isModoDebug() {
		return isModoDebug;
	}

	public void setModoDebug(boolean isModoDebug) {
		this.isModoDebug = isModoDebug;
	}

	public void render(SpriteBatch spriteBatch) {
	}

	public void renderShape() {
	}

	public void renderShape(ShapeRenderer shapeRenderer) {
	}

	@Override
	public int compareTo(Entidade outraEntidade) {
		if (this.getPosicaoAtual().y > outraEntidade.getPosicaoAtual().y) {
			return -1;
		} else if (this.getPosicaoAtual().y < outraEntidade.getPosicaoAtual().y) {
			return 1;
		}
		return 0;
	}

}
