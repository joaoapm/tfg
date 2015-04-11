package com.jogoTcc.entidade;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.InputProcessor;
import com.badlogic.gdx.graphics.g2d.Animation;
import com.badlogic.gdx.graphics.g2d.Sprite;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;
import com.badlogic.gdx.graphics.g2d.TextureAtlas;
import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.jogoTcc.estrutura.TipoJogador;

public class Entidade extends Sprite implements InputProcessor {

	// estrutura para acesso das texturas das animacoes a serem carregadas
	private TextureAtlas texturaAtlas;

	// estrutura de controle da animacao
	private Animation animacao;
	private float tempoPercorrido = 0;

	// lista contendo os frames de cada animacao
	private TextureRegion[] framesMovimentoD1 = new TextureRegion[8];
	private TextureRegion[] framesMovimentoD2 = new TextureRegion[8];
	private TextureRegion[] framesMovimentoD3 = new TextureRegion[8];
	private TextureRegion[] framesMovimentoD4 = new TextureRegion[8];
	private TextureRegion[] framesMovimentoFR = new TextureRegion[8];
	private TextureRegion[] framesMovimentoLE = new TextureRegion[8];
	private TextureRegion[] framesMovimentoLD = new TextureRegion[8];
	private TextureRegion[] framesMovimentoTR = new TextureRegion[8];

	private TextureRegion[] framesAtaqueD1 = new TextureRegion[13];
	private TextureRegion[] framesAtaqueD2 = new TextureRegion[13];
	private TextureRegion[] framesAtaqueD3 = new TextureRegion[13];
	private TextureRegion[] framesAtaqueD4 = new TextureRegion[13];
	private TextureRegion[] framesAtaqueFR = new TextureRegion[13];
	private TextureRegion[] framesAtaqueLE = new TextureRegion[13];
	private TextureRegion[] framesAtaqueLD = new TextureRegion[13];
	private TextureRegion[] framesAtaqueTR = new TextureRegion[13];

	private TextureRegion frameParadoD1 = new TextureRegion();
	private TextureRegion frameParadoD2 = new TextureRegion();
	private TextureRegion frameParadoD3 = new TextureRegion();
	private TextureRegion frameParadoD4 = new TextureRegion();
	private TextureRegion frameParadoFR = new TextureRegion();
	private TextureRegion frameParadoLE = new TextureRegion();
	private TextureRegion frameParadoLD = new TextureRegion();
	private TextureRegion frameParadoTR = new TextureRegion();

	public Entidade(TipoJogador tipoJogador) {

		// seta gerenciador de eventos
		Gdx.input.setInputProcessor(this);

		// seta arquivo atlas contendo as imagens a serem carregadas
		texturaAtlas = new TextureAtlas(Gdx.files.internal("personagens/"
				+ tipoJogador.getArquivoAtlas()));

		// popula as listas com os frames de cada animacao
		inicializaAnimacoes();

		// instancia a animacao com o tipo de frame desejado
		animacao = new Animation(0.09f, framesMovimentoFR);
	}

	public void draw() {

		// renderiza animacao
		SpriteBatch batch = new SpriteBatch();
		tempoPercorrido += Gdx.graphics.getDeltaTime();
		batch.begin();
		batch.draw(animacao.getKeyFrame(tempoPercorrido, true), 110, 0);
		batch.end();

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

		framesMovimentoD1[0] = (texturaAtlas.findRegion("andandoD1 0001"));
		framesMovimentoD1[1] = (texturaAtlas.findRegion("andandoD1 0002"));
		framesMovimentoD1[2] = (texturaAtlas.findRegion("andandoD1 0003"));
		framesMovimentoD1[3] = (texturaAtlas.findRegion("andandoD1 0004"));
		framesMovimentoD1[4] = (texturaAtlas.findRegion("andandoD1 0005"));
		framesMovimentoD1[5] = (texturaAtlas.findRegion("andandoD1 0006"));
		framesMovimentoD1[6] = (texturaAtlas.findRegion("andandoD1 0007"));
		framesMovimentoD1[7] = (texturaAtlas.findRegion("andandoD1 0008"));

		framesMovimentoD2[0] = (texturaAtlas.findRegion("andandoD2 0001"));
		framesMovimentoD2[1] = (texturaAtlas.findRegion("andandoD2 0002"));
		framesMovimentoD2[2] = (texturaAtlas.findRegion("andandoD2 0003"));
		framesMovimentoD2[3] = (texturaAtlas.findRegion("andandoD2 0004"));
		framesMovimentoD2[4] = (texturaAtlas.findRegion("andandoD2 0005"));
		framesMovimentoD2[5] = (texturaAtlas.findRegion("andandoD2 0006"));
		framesMovimentoD2[6] = (texturaAtlas.findRegion("andandoD2 0007"));
		framesMovimentoD2[7] = (texturaAtlas.findRegion("andandoD2 0008"));

		framesMovimentoD3[0] = (texturaAtlas.findRegion("andandoD3 0001"));
		framesMovimentoD3[1] = (texturaAtlas.findRegion("andandoD3 0002"));
		framesMovimentoD3[2] = (texturaAtlas.findRegion("andandoD3 0003"));
		framesMovimentoD3[3] = (texturaAtlas.findRegion("andandoD3 0004"));
		framesMovimentoD3[4] = (texturaAtlas.findRegion("andandoD3 0005"));
		framesMovimentoD3[5] = (texturaAtlas.findRegion("andandoD3 0006"));
		framesMovimentoD3[6] = (texturaAtlas.findRegion("andandoD3 0007"));
		framesMovimentoD3[7] = (texturaAtlas.findRegion("andandoD3 0008"));

		framesMovimentoD4[0] = (texturaAtlas.findRegion("andandoD4 0001"));
		framesMovimentoD4[1] = (texturaAtlas.findRegion("andandoD4 0002"));
		framesMovimentoD4[2] = (texturaAtlas.findRegion("andandoD4 0003"));
		framesMovimentoD4[3] = (texturaAtlas.findRegion("andandoD4 0004"));
		framesMovimentoD4[4] = (texturaAtlas.findRegion("andandoD4 0005"));
		framesMovimentoD4[5] = (texturaAtlas.findRegion("andandoD4 0006"));
		framesMovimentoD4[6] = (texturaAtlas.findRegion("andandoD4 0007"));
		framesMovimentoD4[7] = (texturaAtlas.findRegion("andandoD4 0008"));

		framesMovimentoFR[0] = (texturaAtlas.findRegion("andandoFR 0001"));
		framesMovimentoFR[1] = (texturaAtlas.findRegion("andandoFR 0002"));
		framesMovimentoFR[2] = (texturaAtlas.findRegion("andandoFR 0003"));
		framesMovimentoFR[3] = (texturaAtlas.findRegion("andandoFR 0004"));
		framesMovimentoFR[4] = (texturaAtlas.findRegion("andandoFR 0005"));
		framesMovimentoFR[5] = (texturaAtlas.findRegion("andandoFR 0006"));
		framesMovimentoFR[6] = (texturaAtlas.findRegion("andandoFR 0007"));
		framesMovimentoFR[7] = (texturaAtlas.findRegion("andandoFR 0008"));

		framesMovimentoLE[0] = (texturaAtlas.findRegion("andandoLE 0001"));
		framesMovimentoLE[1] = (texturaAtlas.findRegion("andandoLE 0002"));
		framesMovimentoLE[2] = (texturaAtlas.findRegion("andandoLE 0003"));
		framesMovimentoLE[3] = (texturaAtlas.findRegion("andandoLE 0004"));
		framesMovimentoLE[4] = (texturaAtlas.findRegion("andandoLE 0005"));
		framesMovimentoLE[5] = (texturaAtlas.findRegion("andandoLE 0006"));
		framesMovimentoLE[6] = (texturaAtlas.findRegion("andandoLE 0007"));
		framesMovimentoLE[7] = (texturaAtlas.findRegion("andandoLE 0008"));

		framesMovimentoLD[0] = (texturaAtlas.findRegion("andandoLD 0001"));
		framesMovimentoLD[1] = (texturaAtlas.findRegion("andandoLD 0002"));
		framesMovimentoLD[2] = (texturaAtlas.findRegion("andandoLD 0003"));
		framesMovimentoLD[3] = (texturaAtlas.findRegion("andandoLD 0004"));
		framesMovimentoLD[4] = (texturaAtlas.findRegion("andandoLD 0005"));
		framesMovimentoLD[5] = (texturaAtlas.findRegion("andandoLD 0006"));
		framesMovimentoLD[6] = (texturaAtlas.findRegion("andandoLD 0007"));
		framesMovimentoLD[7] = (texturaAtlas.findRegion("andandoLD 0008"));

		framesMovimentoTR[0] = (texturaAtlas.findRegion("andandoTR 0001"));
		framesMovimentoTR[1] = (texturaAtlas.findRegion("andandoTR 0002"));
		framesMovimentoTR[2] = (texturaAtlas.findRegion("andandoTR 0003"));
		framesMovimentoTR[3] = (texturaAtlas.findRegion("andandoTR 0004"));
		framesMovimentoTR[4] = (texturaAtlas.findRegion("andandoTR 0005"));
		framesMovimentoTR[5] = (texturaAtlas.findRegion("andandoTR 0006"));
		framesMovimentoTR[6] = (texturaAtlas.findRegion("andandoTR 0007"));
		framesMovimentoTR[7] = (texturaAtlas.findRegion("andandoTR 0008"));

		framesAtaqueD1[0] = (texturaAtlas.findRegion("ataqueD1 0001"));
		framesAtaqueD1[1] = (texturaAtlas.findRegion("ataqueD1 0002"));
		framesAtaqueD1[2] = (texturaAtlas.findRegion("ataqueD1 0003"));
		framesAtaqueD1[3] = (texturaAtlas.findRegion("ataqueD1 0004"));
		framesAtaqueD1[4] = (texturaAtlas.findRegion("ataqueD1 0005"));
		framesAtaqueD1[5] = (texturaAtlas.findRegion("ataqueD1 0006"));
		framesAtaqueD1[6] = (texturaAtlas.findRegion("ataqueD1 0007"));
		framesAtaqueD1[7] = (texturaAtlas.findRegion("ataqueD1 0008"));
		framesAtaqueD1[8] = (texturaAtlas.findRegion("ataqueD1 0009"));
		framesAtaqueD1[9] = (texturaAtlas.findRegion("ataqueD1 0010"));
		framesAtaqueD1[10] = (texturaAtlas.findRegion("ataqueD1 0011"));
		framesAtaqueD1[11] = (texturaAtlas.findRegion("ataqueD1 0012"));
		framesAtaqueD1[12] = (texturaAtlas.findRegion("ataqueD1 0013"));

		framesAtaqueD2[0] = (texturaAtlas.findRegion("ataqueD2 0001"));
		framesAtaqueD2[1] = (texturaAtlas.findRegion("ataqueD2 0002"));
		framesAtaqueD2[2] = (texturaAtlas.findRegion("ataqueD2 0003"));
		framesAtaqueD2[3] = (texturaAtlas.findRegion("ataqueD2 0004"));
		framesAtaqueD2[4] = (texturaAtlas.findRegion("ataqueD2 0005"));
		framesAtaqueD2[5] = (texturaAtlas.findRegion("ataqueD2 0006"));
		framesAtaqueD2[6] = (texturaAtlas.findRegion("ataqueD2 0007"));
		framesAtaqueD2[7] = (texturaAtlas.findRegion("ataqueD2 0008"));
		framesAtaqueD2[8] = (texturaAtlas.findRegion("ataqueD2 0009"));
		framesAtaqueD2[9] = (texturaAtlas.findRegion("ataqueD2 0010"));
		framesAtaqueD2[10] = (texturaAtlas.findRegion("ataqueD2 0011"));
		framesAtaqueD2[11] = (texturaAtlas.findRegion("ataqueD2 0012"));
		framesAtaqueD2[12] = (texturaAtlas.findRegion("ataqueD2 0013"));

		framesAtaqueD3[0] = (texturaAtlas.findRegion("ataqueD3 0001"));
		framesAtaqueD3[1] = (texturaAtlas.findRegion("ataqueD3 0002"));
		framesAtaqueD3[2] = (texturaAtlas.findRegion("ataqueD3 0003"));
		framesAtaqueD3[3] = (texturaAtlas.findRegion("ataqueD3 0004"));
		framesAtaqueD3[4] = (texturaAtlas.findRegion("ataqueD3 0005"));
		framesAtaqueD3[5] = (texturaAtlas.findRegion("ataqueD3 0006"));
		framesAtaqueD3[6] = (texturaAtlas.findRegion("ataqueD3 0007"));
		framesAtaqueD3[7] = (texturaAtlas.findRegion("ataqueD3 0008"));
		framesAtaqueD3[8] = (texturaAtlas.findRegion("ataqueD3 0009"));
		framesAtaqueD3[9] = (texturaAtlas.findRegion("ataqueD3 0010"));
		framesAtaqueD3[10] = (texturaAtlas.findRegion("ataqueD3 0011"));
		framesAtaqueD3[11] = (texturaAtlas.findRegion("ataqueD3 0012"));
		framesAtaqueD3[12] = (texturaAtlas.findRegion("ataqueD3 0013"));

		framesAtaqueD4[0] = (texturaAtlas.findRegion("ataqueD4 0001"));
		framesAtaqueD4[1] = (texturaAtlas.findRegion("ataqueD4 0002"));
		framesAtaqueD4[2] = (texturaAtlas.findRegion("ataqueD4 0003"));
		framesAtaqueD4[3] = (texturaAtlas.findRegion("ataqueD4 0004"));
		framesAtaqueD4[4] = (texturaAtlas.findRegion("ataqueD4 0005"));
		framesAtaqueD4[5] = (texturaAtlas.findRegion("ataqueD4 0006"));
		framesAtaqueD4[6] = (texturaAtlas.findRegion("ataqueD4 0007"));
		framesAtaqueD4[7] = (texturaAtlas.findRegion("ataqueD4 0008"));
		framesAtaqueD4[8] = (texturaAtlas.findRegion("ataqueD4 0009"));
		framesAtaqueD4[9] = (texturaAtlas.findRegion("ataqueD4 0010"));
		framesAtaqueD4[10] = (texturaAtlas.findRegion("ataqueD4 0011"));
		framesAtaqueD4[11] = (texturaAtlas.findRegion("ataqueD4 0012"));
		framesAtaqueD4[12] = (texturaAtlas.findRegion("ataqueD4 0013"));

		framesAtaqueFR[0] = (texturaAtlas.findRegion("ataqueFR 0001"));
		framesAtaqueFR[1] = (texturaAtlas.findRegion("ataqueFR 0002"));
		framesAtaqueFR[2] = (texturaAtlas.findRegion("ataqueFR 0003"));
		framesAtaqueFR[3] = (texturaAtlas.findRegion("ataqueFR 0004"));
		framesAtaqueFR[4] = (texturaAtlas.findRegion("ataqueFR 0005"));
		framesAtaqueFR[5] = (texturaAtlas.findRegion("ataqueFR 0006"));
		framesAtaqueFR[6] = (texturaAtlas.findRegion("ataqueFR 0007"));
		framesAtaqueFR[7] = (texturaAtlas.findRegion("ataqueFR 0008"));
		framesAtaqueFR[8] = (texturaAtlas.findRegion("ataqueFR 0009"));
		framesAtaqueFR[9] = (texturaAtlas.findRegion("ataqueFR 0010"));
		framesAtaqueFR[10] = (texturaAtlas.findRegion("ataqueFR 0011"));
		framesAtaqueFR[11] = (texturaAtlas.findRegion("ataqueFR 0012"));
		framesAtaqueFR[12] = (texturaAtlas.findRegion("ataqueFR 0013"));

		framesAtaqueLE[0] = (texturaAtlas.findRegion("ataqueLE 0001"));
		framesAtaqueLE[1] = (texturaAtlas.findRegion("ataqueLE 0002"));
		framesAtaqueLE[2] = (texturaAtlas.findRegion("ataqueLE 0003"));
		framesAtaqueLE[3] = (texturaAtlas.findRegion("ataqueLE 0004"));
		framesAtaqueLE[4] = (texturaAtlas.findRegion("ataqueLE 0005"));
		framesAtaqueLE[5] = (texturaAtlas.findRegion("ataqueLE 0006"));
		framesAtaqueLE[6] = (texturaAtlas.findRegion("ataqueLE 0007"));
		framesAtaqueLE[7] = (texturaAtlas.findRegion("ataqueLE 0008"));
		framesAtaqueLE[8] = (texturaAtlas.findRegion("ataqueLE 0009"));
		framesAtaqueLE[9] = (texturaAtlas.findRegion("ataqueLE 0010"));
		framesAtaqueLE[10] = (texturaAtlas.findRegion("ataqueLE 0011"));
		framesAtaqueLE[11] = (texturaAtlas.findRegion("ataqueLE 0012"));
		framesAtaqueLE[12] = (texturaAtlas.findRegion("ataqueLE 0013"));

		framesAtaqueLD[0] = (texturaAtlas.findRegion("ataqueLD 0001"));
		framesAtaqueLD[1] = (texturaAtlas.findRegion("ataqueLD 0002"));
		framesAtaqueLD[2] = (texturaAtlas.findRegion("ataqueLD 0003"));
		framesAtaqueLD[3] = (texturaAtlas.findRegion("ataqueLD 0004"));
		framesAtaqueLD[4] = (texturaAtlas.findRegion("ataqueLD 0005"));
		framesAtaqueLD[5] = (texturaAtlas.findRegion("ataqueLD 0006"));
		framesAtaqueLD[6] = (texturaAtlas.findRegion("ataqueLD 0007"));
		framesAtaqueLD[7] = (texturaAtlas.findRegion("ataqueLD 0008"));
		framesAtaqueLD[8] = (texturaAtlas.findRegion("ataqueLD 0009"));
		framesAtaqueLD[9] = (texturaAtlas.findRegion("ataqueLD 0010"));
		framesAtaqueLD[10] = (texturaAtlas.findRegion("ataqueLD 0011"));
		framesAtaqueLD[11] = (texturaAtlas.findRegion("ataqueLD 0012"));
		framesAtaqueLD[12] = (texturaAtlas.findRegion("ataqueLD 0013"));

		framesAtaqueTR[0] = (texturaAtlas.findRegion("ataqueTR 0001"));
		framesAtaqueTR[1] = (texturaAtlas.findRegion("ataqueTR 0002"));
		framesAtaqueTR[2] = (texturaAtlas.findRegion("ataqueTR 0003"));
		framesAtaqueTR[3] = (texturaAtlas.findRegion("ataqueTR 0004"));
		framesAtaqueTR[4] = (texturaAtlas.findRegion("ataqueTR 0005"));
		framesAtaqueTR[5] = (texturaAtlas.findRegion("ataqueTR 0006"));
		framesAtaqueTR[6] = (texturaAtlas.findRegion("ataqueTR 0007"));
		framesAtaqueTR[7] = (texturaAtlas.findRegion("ataqueTR 0008"));
		framesAtaqueTR[8] = (texturaAtlas.findRegion("ataqueTR 0009"));
		framesAtaqueTR[9] = (texturaAtlas.findRegion("ataqueTR 0010"));
		framesAtaqueTR[10] = (texturaAtlas.findRegion("ataqueTR 0011"));
		framesAtaqueTR[11] = (texturaAtlas.findRegion("ataqueTR 0012"));
		framesAtaqueTR[12] = (texturaAtlas.findRegion("ataqueTR 0013"));

		frameParadoD1 = (texturaAtlas.findRegion("paradoD1"));
		frameParadoD2 = (texturaAtlas.findRegion("paradoD2"));
		frameParadoD3 = (texturaAtlas.findRegion("paradoD3"));
		frameParadoD4 = (texturaAtlas.findRegion("paradoD4"));
		frameParadoFR = (texturaAtlas.findRegion("paradoFR"));
		frameParadoLE = (texturaAtlas.findRegion("paradoLE"));
		frameParadoLD = (texturaAtlas.findRegion("paradoLD"));
		frameParadoTR = (texturaAtlas.findRegion("paradoTR"));

	}
}
