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

	private TextureRegion[] framesParadoD1 = new TextureRegion[13];
	private TextureRegion[] framesParadoD2 = new TextureRegion[13];
	private TextureRegion[] framesParadoD3 = new TextureRegion[13];
	private TextureRegion[] framesParadoD4 = new TextureRegion[13];
	private TextureRegion[] framesParadoFR = new TextureRegion[13];
	private TextureRegion[] framesParadoLE = new TextureRegion[13];
	private TextureRegion[] framesParadoLD = new TextureRegion[13];
	private TextureRegion[] framesParadoTR = new TextureRegion[13];

	private TextureRegion[] framesMorrendoD1 = new TextureRegion[11];
	private TextureRegion[] framesMorrendoD2 = new TextureRegion[11];
	private TextureRegion[] framesMorrendoD3 = new TextureRegion[11];
	private TextureRegion[] framesMorrendoD4 = new TextureRegion[11];
	private TextureRegion[] framesMorrendoFR = new TextureRegion[11];
	private TextureRegion[] framesMorrendoLE = new TextureRegion[11];
	private TextureRegion[] framesMorrendoLD = new TextureRegion[11];
	private TextureRegion[] framesMorrendoTR = new TextureRegion[11];

	// define se o estado atual da entidade eh uma animao ou estatico
	private boolean isAnimacao = true;

	// define estado inicial da entidade
	private TextureRegion[] animacaoAtual = framesParadoFR;
	private TextureRegion spriteAtual = null;

	public Entidade(TipoJogador tipoJogador) {

		// seta gerenciador de eventos
		Gdx.input.setInputProcessor(this);

		// seta arquivo atlas contendo as imagens a serem carregadas
		texturaAtlas = new TextureAtlas(Gdx.files.internal("personagens/" + tipoJogador.getArquivoAtlas()));

		// popula as listas com os frames de cada animacao
		inicializaAnimacoes();

		// instancia a animacao com o tipo de frame desejado
		if (isAnimacao)
			animacao = new Animation(0.09f, animacaoAtual);
		else
			spriteAtual = null;

	}

	public void draw() {

		// renderiza animacao
		SpriteBatch batch = new SpriteBatch();
		tempoPercorrido += Gdx.graphics.getDeltaTime();
		batch.begin();

		if (isAnimacao)
			batch.draw(animacao.getKeyFrame(tempoPercorrido, true), 310, 220);
		else
			batch.draw(spriteAtual, 310, 220);

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
		buscaFrames(8, framesMovimentoD1, "andandoD1");
		buscaFrames(8, framesMovimentoD2, "andandoD2");
		buscaFrames(8, framesMovimentoD3, "andandoD3");
		buscaFrames(8, framesMovimentoD4, "andandoD4");
		buscaFrames(8, framesMovimentoFR, "andandoFR");
		buscaFrames(8, framesMovimentoLE, "andandoLE");
		buscaFrames(8, framesMovimentoLD, "andandoLD");
		buscaFrames(8, framesMovimentoTR, "andandoTR");

		buscaFrames(13, framesAtaqueD1, "ataqueD1");
		buscaFrames(13, framesAtaqueD2, "ataqueD2");
		buscaFrames(13, framesAtaqueD3, "ataqueD3");
		buscaFrames(13, framesAtaqueD4, "ataqueD4");
		buscaFrames(13, framesAtaqueFR, "ataqueFR");
		buscaFrames(13, framesAtaqueLE, "ataqueLE");
		buscaFrames(13, framesAtaqueLD, "ataqueLD");
		buscaFrames(13, framesAtaqueTR, "ataqueTR");

		buscaFrames(13, framesParadoD1, "paradoD1");
		buscaFrames(13, framesParadoD2, "paradoD2");
		buscaFrames(13, framesParadoD3, "paradoD3");
		buscaFrames(13, framesParadoD4, "paradoD4");
		buscaFrames(13, framesParadoFR, "paradoFR");
		buscaFrames(13, framesParadoLE, "paradoLE");
		buscaFrames(13, framesParadoLD, "paradoLD");
		buscaFrames(13, framesParadoTR, "paradoTR");

		buscaFrames(11, framesMorrendoD1, "morrendoD1");
		buscaFrames(11, framesMorrendoD2, "morrendoD2");
		buscaFrames(11, framesMorrendoD3, "morrendoD3");
		buscaFrames(11, framesMorrendoD4, "morrendoD4");
		buscaFrames(11, framesMorrendoFR, "morrendoFR");
		buscaFrames(11, framesMorrendoLE, "morrendoLE");
		buscaFrames(11, framesMorrendoLD, "morrendoLD");
		buscaFrames(11, framesMorrendoTR, "morrendoTR");

	}

	private void buscaFrames(int qntFrames, TextureRegion[] lista, String nomeFrame) {
		String colocaZero = "";
		for (int i = 0; i < qntFrames; i++) {
			colocaZero = (i + 1) < 10 ? "0" : "";
			lista[i] = (texturaAtlas.findRegion(nomeFrame + " 00" + colocaZero	+ (i + 1)));
		}
	}
}
