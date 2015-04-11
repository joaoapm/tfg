package com.jogoTcc.entidade;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.InputProcessor;
import com.badlogic.gdx.graphics.g2d.Animation;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.g2d.Sprite;
import com.badlogic.gdx.graphics.g2d.TextureAtlas;
import com.badlogic.gdx.graphics.g2d.TextureRegion;

public class Jogador extends Sprite implements InputProcessor {

	private TextureAtlas textureAtlas;
	private Animation animation;
	private float elapsedTime = 0;

	private TextureRegion[] framesMovimentoD1 = new TextureRegion[8];
	private TextureRegion[] framesMovimentoD2 = new TextureRegion[8];
	private TextureRegion[] framesMovimentoD3 = new TextureRegion[8];
	private TextureRegion[] framesMovimentoD4 = new TextureRegion[8];
	private TextureRegion[] framesMovimentoFR = new TextureRegion[8];
	private TextureRegion[] framesMovimentoLE = new TextureRegion[8];
	private TextureRegion[] framesMovimentoLD = new TextureRegion[8];
	private TextureRegion[] framesMovimentoTR = new TextureRegion[8];

	public Jogador(String nomeTextura) {
		Gdx.input.setInputProcessor(this);
		textureAtlas = new TextureAtlas(Gdx.files.internal("personagens/monstro/monstro.atlas"));

		inicializaAnimacoes();

		animation = new Animation(1 / 11f, framesMovimentoFR);

	}

	public void draw(Batch spriteBatch) {
		elapsedTime += Gdx.graphics.getDeltaTime();
		spriteBatch.draw(animation.getKeyFrame(elapsedTime, true), 110, 0);
	}

	@Override
	public boolean keyDown(int keycode) {
		return false;
	}

	@Override
	public boolean keyUp(int keycode) {
		return false;
	}

	@Override
	public boolean keyTyped(char character) {
		return false;
	}

	@Override
	public boolean touchDown(int screenX, int screenY, int pointer, int button) {
		return false;
	}

	@Override
	public boolean touchUp(int screenX, int screenY, int pointer, int button) {
		return false;
	}

	@Override
	public boolean touchDragged(int screenX, int screenY, int pointer) {
		return false;
	}

	@Override
	public boolean mouseMoved(int screenX, int screenY) {
		return false;
	}

	@Override
	public boolean scrolled(int amount) {
		return false;
	}

	private void inicializaAnimacoes() {
		
		framesMovimentoD1[0] = (textureAtlas.findRegion("andandoD1 0001"));
		framesMovimentoD1[1] = (textureAtlas.findRegion("andandoD1 0002"));
		framesMovimentoD1[2] = (textureAtlas.findRegion("andandoD1 0003"));
		framesMovimentoD1[3] = (textureAtlas.findRegion("andandoD1 0004"));
		framesMovimentoD1[4] = (textureAtlas.findRegion("andandoD1 0005"));
		framesMovimentoD1[5] = (textureAtlas.findRegion("andandoD1 0006"));
		framesMovimentoD1[6] = (textureAtlas.findRegion("andandoD1 0007"));
		framesMovimentoD1[7] = (textureAtlas.findRegion("andandoD1 0008"));
		
		framesMovimentoD2[0] = (textureAtlas.findRegion("andandoD2 0001"));
		framesMovimentoD2[1] = (textureAtlas.findRegion("andandoD2 0002"));
		framesMovimentoD2[2] = (textureAtlas.findRegion("andandoD2 0003"));
		framesMovimentoD2[3] = (textureAtlas.findRegion("andandoD2 0004"));
		framesMovimentoD2[4] = (textureAtlas.findRegion("andandoD2 0005"));
		framesMovimentoD2[5] = (textureAtlas.findRegion("andandoD2 0006"));
		framesMovimentoD2[6] = (textureAtlas.findRegion("andandoD2 0007"));
		framesMovimentoD2[7] = (textureAtlas.findRegion("andandoD2 0008"));

		framesMovimentoD3[0] = (textureAtlas.findRegion("andandoD3 0001"));
		framesMovimentoD3[1] = (textureAtlas.findRegion("andandoD3 0002"));
		framesMovimentoD3[2] = (textureAtlas.findRegion("andandoD3 0003"));
		framesMovimentoD3[3] = (textureAtlas.findRegion("andandoD3 0004"));
		framesMovimentoD3[4] = (textureAtlas.findRegion("andandoD3 0005"));
		framesMovimentoD3[5] = (textureAtlas.findRegion("andandoD3 0006"));
		framesMovimentoD3[6] = (textureAtlas.findRegion("andandoD3 0007"));	
		framesMovimentoD3[7] = (textureAtlas.findRegion("andandoD3 0008"));

		framesMovimentoD4[0] = (textureAtlas.findRegion("andandoD4 0001"));
		framesMovimentoD4[1] = (textureAtlas.findRegion("andandoD4 0002"));
		framesMovimentoD4[2] = (textureAtlas.findRegion("andandoD4 0003"));
		framesMovimentoD4[3] = (textureAtlas.findRegion("andandoD4 0004"));
		framesMovimentoD4[4] = (textureAtlas.findRegion("andandoD4 0005"));
		framesMovimentoD4[5] = (textureAtlas.findRegion("andandoD4 0006"));
		framesMovimentoD4[6] = (textureAtlas.findRegion("andandoD4 0007"));	
		framesMovimentoD4[7] = (textureAtlas.findRegion("andandoD4 0008"));
		
		framesMovimentoFR[0] = (textureAtlas.findRegion("andandoFR 0001"));
		framesMovimentoFR[1] = (textureAtlas.findRegion("andandoFR 0002"));
		framesMovimentoFR[2] = (textureAtlas.findRegion("andandoFR 0003"));
		framesMovimentoFR[3] = (textureAtlas.findRegion("andandoFR 0004"));
		framesMovimentoFR[4] = (textureAtlas.findRegion("andandoFR 0005"));
		framesMovimentoFR[5] = (textureAtlas.findRegion("andandoFR 0006"));
		framesMovimentoFR[6] = (textureAtlas.findRegion("andandoFR 0007"));	
		framesMovimentoFR[7] = (textureAtlas.findRegion("andandoFR 0008"));
		
		framesMovimentoLE[0] = (textureAtlas.findRegion("andandoLE 0001"));
		framesMovimentoLE[1] = (textureAtlas.findRegion("andandoLE 0002"));
		framesMovimentoLE[2] = (textureAtlas.findRegion("andandoLE 0003"));
		framesMovimentoLE[3] = (textureAtlas.findRegion("andandoLE 0004"));
		framesMovimentoLE[4] = (textureAtlas.findRegion("andandoLE 0005"));
		framesMovimentoLE[5] = (textureAtlas.findRegion("andandoLE 0006"));
		framesMovimentoLE[6] = (textureAtlas.findRegion("andandoLE 0007"));	
		framesMovimentoLE[7] = (textureAtlas.findRegion("andandoLE 0008"));
		
		framesMovimentoLD[0] = (textureAtlas.findRegion("andandoLD 0001"));
		framesMovimentoLD[1] = (textureAtlas.findRegion("andandoLD 0002"));
		framesMovimentoLD[2] = (textureAtlas.findRegion("andandoLD 0003"));
		framesMovimentoLD[3] = (textureAtlas.findRegion("andandoLD 0004"));
		framesMovimentoLD[4] = (textureAtlas.findRegion("andandoLD 0005"));
		framesMovimentoLD[5] = (textureAtlas.findRegion("andandoLD 0006"));
		framesMovimentoLD[6] = (textureAtlas.findRegion("andandoLD 0007"));	
		framesMovimentoLD[7] = (textureAtlas.findRegion("andandoLD 0008"));
		
		framesMovimentoTR[0] = (textureAtlas.findRegion("andandoTR 0001"));
		framesMovimentoTR[1] = (textureAtlas.findRegion("andandoTR 0002"));
		framesMovimentoTR[2] = (textureAtlas.findRegion("andandoTR 0003"));
		framesMovimentoTR[3] = (textureAtlas.findRegion("andandoTR 0004"));
		framesMovimentoTR[4] = (textureAtlas.findRegion("andandoTR 0005"));
		framesMovimentoTR[5] = (textureAtlas.findRegion("andandoTR 0006"));
		framesMovimentoTR[6] = (textureAtlas.findRegion("andandoTR 0007"));	
		framesMovimentoTR[7] = (textureAtlas.findRegion("andandoTR 0008"));
		
	}

}
