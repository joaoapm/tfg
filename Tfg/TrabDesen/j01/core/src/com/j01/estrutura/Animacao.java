package com.j01.estrutura;

import java.util.HashMap;
import java.util.Map;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.Animation;
import com.badlogic.gdx.graphics.g2d.TextureAtlas;
import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.j01.entidades.Personagem;
import com.j01.helper.PropriedadeHelper;

public class Animacao {

	private TextureAtlas textureAtlas;
	private Personagem personagem;
	private Animation animacao;
	private Map<TipoAnimacao, TextureRegion[]> tipoAnimacoes = new HashMap<TipoAnimacao, TextureRegion[]>();
	private Texture[] barraVida = new Texture[4];
	private TipoAnimacao tipoAnimacaoAtual;
	private TipoAnimacao tipoAnimacao;
	
	private int  nroExecucoes = 0;

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

	private void inicializaTipoAnimacoes() {

		tipoAnimacoes.put(TipoAnimacao.MOVIMENTOD1, framesMovimentoD1);
		tipoAnimacoes.put(TipoAnimacao.MOVIMENTOD2, framesMovimentoD2);
		tipoAnimacoes.put(TipoAnimacao.MOVIMENTOD3, framesMovimentoD3);
		tipoAnimacoes.put(TipoAnimacao.MOVIMENTOD4, framesMovimentoD4);
		tipoAnimacoes.put(TipoAnimacao.MOVIMENTOFR, framesMovimentoFR);
		tipoAnimacoes.put(TipoAnimacao.MOVIMENTOLE, framesMovimentoLD);
		tipoAnimacoes.put(TipoAnimacao.MOVIMENTOLD, framesMovimentoLE);
		tipoAnimacoes.put(TipoAnimacao.MOVIMENTOTR, framesMovimentoTR);

		tipoAnimacoes.put(TipoAnimacao.ATAQUED1, framesAtaqueD1);
		tipoAnimacoes.put(TipoAnimacao.ATAQUED2, framesAtaqueD2);
		tipoAnimacoes.put(TipoAnimacao.ATAQUED3, framesAtaqueD3);
		tipoAnimacoes.put(TipoAnimacao.ATAQUED4, framesAtaqueD4);
		tipoAnimacoes.put(TipoAnimacao.ATAQUEFR, framesAtaqueFR);
		tipoAnimacoes.put(TipoAnimacao.ATAQUELE, framesAtaqueLD);
		tipoAnimacoes.put(TipoAnimacao.ATAQUELD, framesAtaqueLE);
		tipoAnimacoes.put(TipoAnimacao.ATAQUETR, framesAtaqueTR);

		tipoAnimacoes.put(TipoAnimacao.PARADOD1, framesParadoD1);
		tipoAnimacoes.put(TipoAnimacao.PARADOD2, framesParadoD2);
		tipoAnimacoes.put(TipoAnimacao.PARADOD3, framesParadoD3);
		tipoAnimacoes.put(TipoAnimacao.PARADOD4, framesParadoD4);
		tipoAnimacoes.put(TipoAnimacao.PARADOFR, framesParadoFR);
		tipoAnimacoes.put(TipoAnimacao.PARADOLE, framesParadoLD);
		tipoAnimacoes.put(TipoAnimacao.PARADOLD, framesParadoLE);
		tipoAnimacoes.put(TipoAnimacao.PARADOTR, framesParadoTR);

		tipoAnimacoes.put(TipoAnimacao.MORRENDOD1, framesMorrendoD1);
		tipoAnimacoes.put(TipoAnimacao.MORRENDOD2, framesMorrendoD2);
		tipoAnimacoes.put(TipoAnimacao.MORRENDOD3, framesMorrendoD3);
		tipoAnimacoes.put(TipoAnimacao.MORRENDOD4, framesMorrendoD4);
		tipoAnimacoes.put(TipoAnimacao.MORRENDOFR, framesMorrendoFR);
		tipoAnimacoes.put(TipoAnimacao.MORRENDOLE, framesMorrendoLD);
		tipoAnimacoes.put(TipoAnimacao.MORRENDOLD, framesMorrendoLE);
		tipoAnimacoes.put(TipoAnimacao.MORRENDOTR, framesMorrendoTR);

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
		buscaFrames(13, framesAtaqueLE, "ataqueLE");
		buscaFrames(13, framesAtaqueLD, "ataqueLD");
		if (personagem.getTime() == 0) {
			buscaFrames(13, framesAtaqueFR, "ataqueFR");
			buscaFrames(13, framesAtaqueTR, "ataqueTR");
		} else {
			buscaFrames(13, framesAtaqueFR, "ataqueTR");
			buscaFrames(13, framesAtaqueTR, "ataqueFR");
		}

		buscaFrames(13, framesParadoD1, "paradoD1");
		buscaFrames(13, framesParadoD2, "paradoD2");
		buscaFrames(13, framesParadoD3, "paradoD3");
		buscaFrames(13, framesParadoD4, "paradoD4");
		buscaFrames(13, framesParadoLE, "paradoLE");
		buscaFrames(13, framesParadoLD, "paradoLD");
		if (personagem.getTime() == 0) {
			buscaFrames(13, framesParadoFR, "paradoFR");
			buscaFrames(13, framesParadoTR, "paradoTR");
		} else {
			buscaFrames(13, framesParadoFR, "paradoTR");
			buscaFrames(13, framesParadoTR, "paradoFR");
		}

		buscaFrames(11, framesMorrendoD1, "morrendoD1");
		buscaFrames(11, framesMorrendoD2, "morrendoD2");
		buscaFrames(11, framesMorrendoD3, "morrendoD3");
		buscaFrames(11, framesMorrendoD4, "morrendoD4");
		buscaFrames(11, framesMorrendoLE, "morrendoLE");
		buscaFrames(11, framesMorrendoLD, "morrendoLD");
		if (personagem.getTime() == 0) {
			buscaFrames(11, framesMorrendoFR, "morrendoFR");
			buscaFrames(11, framesMorrendoTR, "morrendoTR");
		} else {
			buscaFrames(11, framesMorrendoFR, "morrendoTR");
			buscaFrames(11, framesMorrendoTR, "morrendoFR");
		}

	}

	private void inicializaBarraVida() {
		barraVida[3] = new Texture(Gdx.files.internal("barraVida/p1.png"));
		barraVida[2] = new Texture(Gdx.files.internal("barraVida/p3.png"));
		barraVida[1] = new Texture(Gdx.files.internal("barraVida/p5.png"));
		barraVida[0] = new Texture(Gdx.files.internal("barraVida/p6.png"));
	}

	private void buscaFrames(int qntFrames, TextureRegion[] lista, String nomeFrame) {
		String colocaZero = "";
		for (int i = 0; i < qntFrames; i++) {
			colocaZero = (i + 1) < 10 ? "0" : "";
			lista[i] = (textureAtlas.findRegion(nomeFrame + " 00" + colocaZero + (i + 1)));
		}
	}
	
	public Animacao(Personagem personagem, TipoAnimacao tipoAnimacao) {
		
		this.textureAtlas = new TextureAtlas(Gdx.files.internal(personagem.getTipoPersonagem().getArquivoAtlas()));
		this.personagem = personagem;
		this.tipoAnimacao = tipoAnimacao;
		personagem.setTempoDecorridoAnimacaoMov(0f);
		
		inicializaTipoAnimacoes();
		inicializaBarraVida();
		inicializaAnimacoes();
		
	}
	
	public TextureRegion getFrameAnimacao(float tempo) {
		if (tipoAnimacaoAtual == null) {
			animacao = new Animation(PropriedadeHelper.VELOCIDADE_ANIMACAO, tipoAnimacoes.get(tipoAnimacao));
			tipoAnimacaoAtual = tipoAnimacao;
			nroExecucoes = 0;
		} else if (tipoAnimacao != tipoAnimacaoAtual &&  personagem.getAnimacao().getAnimacao().isAnimationFinished(personagem.getTempoDecorrido())) {
			personagem.setTempoDecorrido(0);
			animacao = new Animation(PropriedadeHelper.VELOCIDADE_ANIMACAO, tipoAnimacoes.get(tipoAnimacao));
			tipoAnimacaoAtual = tipoAnimacao;
			nroExecucoes = 0;
		}
		
		if (tipoAnimacaoAtual == tipoAnimacao && animacao.getKeyFrame(tempo, true).toString().contains(String.valueOf(animacao.getKeyFrames().length)))
			nroExecucoes += 1;
		
		return animacao.getKeyFrame(tempo, true);
	}

	public Texture getBarraVida(int qtdVida) {
		return barraVida[qtdVida];
	}

	public TipoAnimacao getTipoAnimacao() {
		return tipoAnimacao;
	}

	public void setTipoAnimacao(TipoAnimacao tipoAnimacao) {
		this.tipoAnimacao = tipoAnimacao;
	}

	public boolean isPodeClicar() {
		if (tipoAnimacao == null || tipoAnimacao.equals(TipoAnimacao.MOVIMENTOFR)
				|| tipoAnimacao.equals(TipoAnimacao.MOVIMENTOTR) || tipoAnimacao.equals(TipoAnimacao.MOVIMENTOD1)
				|| tipoAnimacao.equals(TipoAnimacao.MOVIMENTOD2) || tipoAnimacao.equals(TipoAnimacao.MOVIMENTOD3)
				|| tipoAnimacao.equals(TipoAnimacao.MOVIMENTOD4) || tipoAnimacao.equals(TipoAnimacao.MOVIMENTOLD)
				|| tipoAnimacao.equals(TipoAnimacao.MOVIMENTOLE))
			return true;
		
		return false;
	}

	public Animation getAnimacao() {
		return animacao;
	}

	public void setAnimacao(Animation animacao) {
		this.animacao = animacao;
	}

	public int getNroExecucoes() {
		return nroExecucoes;
	}

	public void setNroExecucoes(int nroExecucoes) {
		this.nroExecucoes = nroExecucoes;
	}
	
}
