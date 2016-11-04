package com.j01.entidades;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.InputProcessor;
import com.badlogic.gdx.graphics.g2d.Animation;
import com.badlogic.gdx.graphics.g2d.TextureAtlas;
import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.j01.estrutura.TipoPersonagem;
import com.j01.helper.PersonagemHelper;
import com.j01.helper.PropriedadeHelper;

public class Personagem implements InputProcessor {

	private Animation animation;
	private TextureAtlas textureAtlas;
	private TipoPersonagem tipoPersonagem;
	private PersonagemHelper personagemHelper;

	private float elapsedTime = 0;
	private int posX;
	private int posY;

	public Personagem(TipoPersonagem tipoPersonagem, int posX, int posY) {

		personagemHelper = new PersonagemHelper(tipoPersonagem);

		this.tipoPersonagem = tipoPersonagem;
		this.posX = posX;
		this.posY = posY;

		Gdx.input.setInputProcessor(this);

		animation = new Animation(PropriedadeHelper.VELOCIDADE_ANIMACAO, personagemHelper.getFramesParadoFR());
	}

	public Personagem(TipoPersonagem tipoPersonagem) {
		this(tipoPersonagem, 0, 0);
	}

	public TipoPersonagem getTipoPersonagem() {
		return tipoPersonagem;
	}

	public void setTipoPersonagem(TipoPersonagem tipoPersonagem) {
		this.tipoPersonagem = tipoPersonagem;
	}

	public Animation getAnimation() {
		return animation;
	}

	public void setAnimation(Animation animation) {
		this.animation = animation;
	}

	public TextureAtlas getTextureAtlas() {
		return textureAtlas;
	}

	public void setTextureAtlas(TextureAtlas textureAtlas) {
		this.textureAtlas = textureAtlas;
	}

	@Override
	public boolean keyDown(int arg0) {
		return false;
	}

	@Override
	public boolean keyTyped(char arg0) {
		return false;
	}

	@Override
	public boolean keyUp(int arg0) {
		return false;
	}

	@Override
	public boolean mouseMoved(int arg0, int arg1) {
		return false;
	}

	@Override
	public boolean scrolled(int arg0) {
		return false;
	}

	public TextureRegion getFrame(float elapsedTime) {
		setElapsedTime(elapsedTime);
		return getAnimation().getKeyFrame(elapsedTime, true);
	}

	@Override
	public boolean touchDown(int x, int y, int arg2, int arg3) {
		int altura = getAnimation().getKeyFrame(elapsedTime, true).getRegionHeight();
		int comprimento = getAnimation().getKeyFrame(elapsedTime, true).getRegionWidth();

		return false;
	}

	@Override
	public boolean touchDragged(int arg0, int arg1, int arg2) {
		return false;
	}

	@Override
	public boolean touchUp(int arg0, int arg1, int arg2, int arg3) {
		return false;
	}

	public int getPosX() {
		return posX;
	}

	public void setPosX(int posX) {
		this.posX = posX;
	}

	public int getPosY() {
		return posY;
	}

	public void setPosY(int posY) {
		this.posY = posY;
	}

	public float getElapsedTime() {
		return elapsedTime;
	}

	public void setElapsedTime(float elapsedTime) {
		this.elapsedTime = elapsedTime;
	}

}
