package com.j01.entidades;

import com.badlogic.gdx.graphics.g2d.SpriteBatch;
import com.badlogic.gdx.graphics.glutils.ShapeRenderer;
import com.badlogic.gdx.math.Vector3;

public class Entidade {

	private float tempoDecorrido = 0;
	private Partida partida;
	private boolean isPosAtualizada;
	private boolean isModoDebug;
	private boolean isMovendo;
	private int camada;
	
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

}
