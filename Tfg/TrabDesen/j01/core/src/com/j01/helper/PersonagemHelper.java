package com.j01.helper;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.Animation;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;
import com.badlogic.gdx.graphics.g2d.TextureAtlas;
import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.badlogic.gdx.math.Interpolation;
import com.j01.entidades.Casa;
import com.j01.entidades.Personagem;
import com.j01.estrutura.TipoPersonagem;

public class PersonagemHelper {

	private TextureAtlas textureAtlas;
	private Personagem Personagem;

	public PersonagemHelper(TipoPersonagem tipoPersonagem, Personagem personagem) {
		textureAtlas = new TextureAtlas(Gdx.files.internal(tipoPersonagem.getArquivoAtlas()));
		this.Personagem = personagem;
		inicializaAnimacoes();
		inicializaBarraVida();
	}

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
	
	private Texture[] barraVida = new Texture[4];

	public TextureRegion[] getFramesMovimentoD1() {
		return framesMovimentoD1;
	}

	public TextureRegion[] getFramesMovimentoD2() {
		return framesMovimentoD2;
	}

	public TextureRegion[] getFramesMovimentoD3() {
		return framesMovimentoD3;
	}

	public TextureRegion[] getFramesMovimentoD4() {
		return framesMovimentoD4;
	}

	public TextureRegion[] getFramesMovimentoFR() {
		return framesMovimentoFR;
	}

	public TextureRegion[] getFramesMovimentoLE() {
		return framesMovimentoLE;
	}

	public TextureRegion[] getFramesMovimentoLD() {
		return framesMovimentoLD;
	}

	public TextureRegion[] getFramesMovimentoTR() {
		return framesMovimentoTR;
	}

	public TextureRegion[] getFramesAtaqueD1() {
		return framesAtaqueD1;
	}

	public TextureRegion[] getFramesAtaqueD2() {
		return framesAtaqueD2;
	}

	public TextureRegion[] getFramesAtaqueD3() {
		return framesAtaqueD3;
	}

	public TextureRegion[] getFramesAtaqueD4() {
		return framesAtaqueD4;
	}

	public TextureRegion[] getFramesAtaqueFR() {
		return framesAtaqueFR;
	}

	public TextureRegion[] getFramesAtaqueLE() {
		return framesAtaqueLE;
	}

	public TextureRegion[] getFramesAtaqueLD() {
		return framesAtaqueLD;
	}

	public TextureRegion[] getFramesAtaqueTR() {
		return framesAtaqueTR;
	}

	public TextureRegion[] getFramesParadoD1() {
		return framesParadoD1;
	}

	public TextureRegion[] getFramesParadoD2() {
		return framesParadoD2;
	}

	public TextureRegion[] getFramesParadoD3() {
		return framesParadoD3;
	}

	public TextureRegion[] getFramesParadoD4() {
		return framesParadoD4;
	}

	public TextureRegion[] getFramesParadoFR() {
		return framesParadoFR;
	}

	public TextureRegion[] getFramesParadoLE() {
		return framesParadoLE;
	}

	public TextureRegion[] getFramesParadoLD() {
		return framesParadoLD;
	}

	public TextureRegion[] getFramesParadoTR() {
		return framesParadoTR;
	}

	public TextureRegion[] getFramesMorrendoD1() {
		return framesMorrendoD1;
	}

	public TextureRegion[] getFramesMorrendoD2() {
		return framesMorrendoD2;
	}

	public TextureRegion[] getFramesMorrendoD3() {
		return framesMorrendoD3;
	}

	public TextureRegion[] getFramesMorrendoD4() {
		return framesMorrendoD4;
	}

	public TextureRegion[] getFramesMorrendoFR() {
		return framesMorrendoFR;
	}

	public TextureRegion[] getFramesMorrendoLE() {
		return framesMorrendoLE;
	}

	public TextureRegion[] getFramesMorrendoLD() {
		return framesMorrendoLD;
	}

	public TextureRegion[] getFramesMorrendoTR() {
		return framesMorrendoTR;
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
		if (this.Personagem.getTime() == 0) {
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
		if (this.Personagem.getTime() == 0) {
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
		if (this.Personagem.getTime() == 0) {
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

	public static boolean tocouPersonagem(Personagem personagem, int x, int y) {
		if (personagem.isPosAtualizada()) {
			personagem.setPosAtualizada(false);
		} else {

			float pointerX = x;
			float pointerY = Gdx.graphics.getHeight() - y;

			int altura = personagem.getAnimation().getKeyFrame(personagem.getTempoDecorrido(), true).getRegionHeight();
			int comprimento = personagem.getAnimation().getKeyFrame(personagem.getTempoDecorrido(), true).getRegionWidth();

			if (pointerY >= personagem.getCasaAtual().getPosicaoTela().y && pointerY <= personagem.getCasaAtual().getPosicaoTela().y + (altura)) {
				if (pointerX >= personagem.getCasaAtual().getPosicaoTela().x && pointerX <= personagem.getCasaAtual().getPosicaoTela().x + (comprimento)) {
					return true;
				}
			}
		}

		return false;
	}

	public void movePersonagem(Personagem personagem, Casa casa) {
		personagem.setPosAtualizada(true);
		personagem.setMovendo(true);
		personagem.getPartida().setPersonagemSelecionado(null);

		personagem.setAnimation(getAnimacaoMov(personagem,casa));
		
		personagem.setCasaAtual(casa);
		
		personagem.setPosicaoFinal(casa.getPosicaoTela());
		personagem.setTempoDecorridoAnimacaoMov(0f);
		
	}
	
	public void atacaPersonagem(Personagem personagem) {
		personagem.getPartida().ataquePersonagem();
		personagem.setAtacando(true);
		personagem.setTempoDecorridoAnimacaoMov(0f);
		
		if(personagem.getPartida().getPersonagemAtaque().getVida() == 0){
			personagem.getPartida().getPersonagemAtaque().setMorrendo(true);
			personagem.getPartida().getPersonagemAtaque().setTempoDecorridoAnimacaoMov(0f);
		}
		
	}
	
	public void renderizaAnimacaoPersonagem(Personagem personagem, SpriteBatch spriteBatch) {
		if (personagem.getPosicaoFinal() != null) {
			personagem.setTempoDecorridoAnimacaoMov(personagem.getTempoDecorridoAnimacaoMov() + Gdx.graphics.getDeltaTime());
			if (personagem.getTempoDecorridoAnimacaoMov() > PropriedadeHelper.TEMPO_MOVIMENTO_PERSO) {
				personagem.setAnimation(new Animation(PropriedadeHelper.VELOCIDADE_ANIMACAO, this.getFramesParadoFR()));
				personagem.setPosicaoInicial(personagem.getPosicaoFinal());
				personagem.setTempoDecorridoAnimacaoMov(null);
				personagem.setPosicaoFinal(null);
				personagem.setMovendo(false);
				if (personagem.getTipoPersonagem().equals(TipoPersonagem.MONSTRO))
					personagem.getPosicaoAtual().add(14, 14, 0);
				personagem.getPartida().trocaTurno();
			}
			if (personagem.getTempoDecorridoAnimacaoMov() != null) {
				personagem.getPosicaoAtual().set(personagem.getPosicaoFinal());
				personagem.getPosicaoAtual().sub(personagem.getPosicaoInicial());
				personagem.getPosicaoAtual().scl(Interpolation.linear.apply(personagem.getTempoDecorridoAnimacaoMov() / PropriedadeHelper.TEMPO_MOVIMENTO_PERSO));
				personagem.getPosicaoAtual().add(personagem.getPosicaoInicial());
				if (personagem.getTipoPersonagem().equals(TipoPersonagem.MONSTRO))
					personagem.getPosicaoAtual().add(-14, -14, 0);
			}
		} else if (personagem.isAtacando()) {
			personagem.setTempoDecorridoAnimacaoMov(
					personagem.getTempoDecorridoAnimacaoMov() + Gdx.graphics.getDeltaTime());
			if (personagem.getTempoDecorridoAnimacaoMov() > PropriedadeHelper.TEMPO_MOVIMENTO_PERSO) {
				personagem.setAnimation(new Animation(PropriedadeHelper.VELOCIDADE_ANIMACAO, this.getFramesParadoFR()));
				personagem.setTempoDecorridoAnimacaoMov(null);
				personagem.setAtacando(false);
				personagem.getPartida().trocaTurno();
				personagem.getPosicaoAtual().add(14, 14, 0);

			} else if (personagem.getTempoDecorridoAnimacaoMov() != null) {
				if (personagem.getAnimation().isAnimationFinished(personagem.getTempoDecorrido())) {
					personagem.setTempoDecorrido(0);
					personagem.setAnimation(new Animation(PropriedadeHelper.VELOCIDADE_ANIMACAO, this.getFramesAtaqueFR()));
					personagem.getPosicaoAtual().add(-14, -14, 0);
				}
			}
		} else if (personagem.isMorrendo()) {
			personagem.setTempoDecorridoAnimacaoMov(personagem.getTempoDecorridoAnimacaoMov() + Gdx.graphics.getDeltaTime());
			if (personagem.getTempoDecorridoAnimacaoMov() > PropriedadeHelper.TEMPO_MOVIMENTO_PERSO) {
				personagem.setTempoDecorridoAnimacaoMov(null);
				personagem.setMorrendo(false);
				personagem.getPartida().atualizaPartida();
			} else if (personagem.getTempoDecorridoAnimacaoMov() != null) {
				if (personagem.getAnimation().isAnimationFinished(personagem.getTempoDecorrido())) {
					personagem.setTempoDecorrido(0);
					personagem.setAnimation(new Animation(PropriedadeHelper.VELOCIDADE_ANIMACAO, this.getFramesMorrendoFR()));
					personagem.getPosicaoAtual().add(-14, -14, 0);
				}
			}
		}
		personagem.setTempoDecorrido(personagem.getTempoDecorrido() + Gdx.graphics.getDeltaTime());
		spriteBatch.draw(personagem.getFrame(personagem.getTempoDecorrido()), personagem.getPosicaoAtual().x,personagem.getPosicaoAtual().y);
	}
	
	public void renderizaBarraVida(Personagem personagem, SpriteBatch spriteBatch) {
		int vlrDesl = 0;
		if ((personagem.getTipoPersonagem().equals(TipoPersonagem.MONSTRO) && personagem.getPosicaoFinal() != null) || personagem.isAtacando())
			vlrDesl = 14;
		spriteBatch.draw(barraVida[personagem.getVida()], personagem.getPosicaoAtual().x - 5 + vlrDesl,personagem.getPosicaoAtual().y + 80 + vlrDesl);
	}
	
	private Animation getAnimacaoMov(Personagem personagem, Casa casa) {
		if (personagem.getCasaAtual().getPosicaoMapa().x < casa.getPosicaoMapa().x	&& personagem.getCasaAtual().getPosicaoMapa().y < casa.getPosicaoMapa().y)
			return new Animation(PropriedadeHelper.VELOCIDADE_ANIMACAO, getFramesMovimentoD1());
		if (personagem.getCasaAtual().getPosicaoMapa().x > casa.getPosicaoMapa().x	&& personagem.getCasaAtual().getPosicaoMapa().y < casa.getPosicaoMapa().y)
			return new Animation(PropriedadeHelper.VELOCIDADE_ANIMACAO, getFramesMovimentoD2());
		if (personagem.getCasaAtual().getPosicaoMapa().x < casa.getPosicaoMapa().x	&& personagem.getCasaAtual().getPosicaoMapa().y  > casa.getPosicaoMapa().y)
			return new Animation(PropriedadeHelper.VELOCIDADE_ANIMACAO, getFramesMovimentoD3());
		if (personagem.getCasaAtual().getPosicaoMapa().x > casa.getPosicaoMapa().x	&& personagem.getCasaAtual().getPosicaoMapa().y > casa.getPosicaoMapa().y)
			return new Animation(PropriedadeHelper.VELOCIDADE_ANIMACAO, getFramesMovimentoD4());
		if (personagem.getCasaAtual().getPosicaoMapa().x == casa.getPosicaoMapa().x	&& personagem.getCasaAtual().getPosicaoMapa().y < casa.getPosicaoMapa().y)
			return new Animation(PropriedadeHelper.VELOCIDADE_ANIMACAO, getFramesMovimentoLE());
		if (personagem.getCasaAtual().getPosicaoMapa().x == casa.getPosicaoMapa().x	&& personagem.getCasaAtual().getPosicaoMapa().y > casa.getPosicaoMapa().y)
			return new Animation(PropriedadeHelper.VELOCIDADE_ANIMACAO, getFramesMovimentoLD());
		if (personagem.getCasaAtual().getPosicaoMapa().y == casa.getPosicaoMapa().y	&& personagem.getCasaAtual().getPosicaoMapa().x > casa.getPosicaoMapa().x)
			return new Animation(PropriedadeHelper.VELOCIDADE_ANIMACAO, getFramesMovimentoTR());
		if (personagem.getCasaAtual().getPosicaoMapa().y == casa.getPosicaoMapa().y	&& personagem.getCasaAtual().getPosicaoMapa().x < casa.getPosicaoMapa().x)
			return new Animation(PropriedadeHelper.VELOCIDADE_ANIMACAO, getFramesMovimentoFR());
		return null;
	}

}
