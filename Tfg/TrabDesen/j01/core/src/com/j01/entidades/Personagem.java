package com.j01.entidades;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.InputMultiplexer;
import com.badlogic.gdx.InputProcessor;
import com.badlogic.gdx.graphics.g2d.Animation;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;
import com.badlogic.gdx.graphics.g2d.TextureAtlas;
import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.j01.estrutura.TipoPersonagem;
import com.j01.helper.PersonagemHelper;
import com.j01.helper.PropriedadeHelper;

public class Personagem extends Entidade implements InputProcessor {

	private Animation animation;
	private TextureAtlas textureAtlas;
	private TipoPersonagem tipoPersonagem;
	private PersonagemHelper personagemHelper;

	public Personagem(TipoPersonagem tipoPersonagem, int posX, int posY, InputMultiplexer inputMultiplexer) {

		setPosX(posX);
		setPosY(posY);

		personagemHelper = new PersonagemHelper(tipoPersonagem);
		this.tipoPersonagem = tipoPersonagem;

		inputMultiplexer.addProcessor(this);

		animation = new Animation(PropriedadeHelper.VELOCIDADE_ANIMACAO, personagemHelper.getFramesParadoFR());
	}

	public Personagem(TipoPersonagem tipoPersonagem) {
		this(tipoPersonagem, 0, 0, null);
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
	
	public void render(SpriteBatch spriteBatch) {
		setElapsedTime(getElapsedTime() + Gdx.graphics.getDeltaTime());
		spriteBatch.draw(this.getFrame(getElapsedTime()), this.getPosX(), this.getPosY());
	}

	@Override
	public boolean touchDown(int x, int y, int arg2, int arg3) {
		if (PersonagemHelper.tocouPersonagem(this, x, y))
			animation = new Animation(PropriedadeHelper.VELOCIDADE_ANIMACAO, personagemHelper.getFramesMovimentoFR());
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

}
