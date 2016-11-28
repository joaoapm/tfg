package com.j01.helper;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.g2d.Animation;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;
import com.badlogic.gdx.graphics.g2d.TextureAtlas;
import com.badlogic.gdx.math.Interpolation;
import com.j01.entidades.Casa;
import com.j01.entidades.Personagem;
import com.j01.estrutura.Animacao;
import com.j01.estrutura.TipoAnimacao;
import com.j01.estrutura.TipoPersonagem;

public class PersonagemHelper {

	public PersonagemHelper(TipoPersonagem tipoPersonagem, Personagem personagem) {
	}
 

	public static boolean tocouPersonagem(Personagem personagem, int x, int y) {

		float pointerX = x;
		float pointerY = Gdx.graphics.getHeight() - y;

		int altura = personagem.getAnimacao().getFrameAnimacao(personagem.getTempoDecorrido()).getRegionHeight();
		int comprimento = personagem.getAnimacao().getFrameAnimacao(personagem.getTempoDecorrido()).getRegionWidth();

		if (pointerY >= personagem.getCasaAtual().getPosicaoTela().y
				&& pointerY <= personagem.getCasaAtual().getPosicaoTela().y + (altura)) {
			if (pointerX >= personagem.getCasaAtual().getPosicaoTela().x
					&& pointerX <= personagem.getCasaAtual().getPosicaoTela().x + (comprimento)) {
				return true;
			}
		}

		return false;
	}

	public void movePersonagem(Personagem personagem, Casa casa) {
		personagem.setCasaAtual(casa);
		personagem.setPosicaoFinal(casa.getPosicaoTela());
		personagem.setAnimacao(new Animacao(personagem,TipoAnimacao.MOVIMENTOFR));
		personagem.getAnimacao().iniciaAnimacao();
	}
	
	public void atacaPersonagem(Personagem personagem) {
		 personagem.getPartida().ataquePersonagem();
		 personagem.setAnimacao(new Animacao(personagem,TipoAnimacao.ATAQUEFR));
	}
	
	public void renderizaAnimacaoPersonagem(Personagem personagem, SpriteBatch spriteBatch) {
		
		if (personagem.getAnimacao().getTipoAnimacao().equals(TipoAnimacao.MOVIMENTOFR) ) {
			personagem.setTempoDecorridoAnimacaoMov(personagem.getTempoDecorridoAnimacaoMov() + Gdx.graphics.getDeltaTime());
			if ((int)personagem.getPosicaoAtual().x != (int)personagem.getPosicaoFinal().x  || (int)personagem.getPosicaoAtual().y != (int)personagem.getPosicaoFinal().y  ) {
				personagem.getPosicaoAtual().set(personagem.getPosicaoFinal());
				personagem.getPosicaoAtual().sub(personagem.getPosicaoInicial());
				personagem.getPosicaoAtual().scl(Interpolation.linear.apply(personagem.getTempoDecorridoAnimacaoMov()));
				personagem.getPosicaoAtual().add(personagem.getPosicaoInicial());
			} else {
				personagem.setAnimacao(new Animacao(personagem,TipoAnimacao.PARADOFR));
				personagem.getAnimacao().iniciaAnimacao();
				personagem.setPosicaoInicial(personagem.getPosicaoFinal());
				personagem.getPartida().trocaTurno();
			}
		}
		
		
		 
		if (personagem.getAnimacao().getTipoAnimacao().equals(TipoAnimacao.MOVIMENTOFR)) {
 
				if (personagem.getAnimacao().getAnimacao().isAnimationFinished(personagem.getTempoDecorrido())) {
					personagem.getAnimacao().iniciaAnimacao();
				}
			 
		}
		
		
		/*if (personagem.getPosicaoFinal() != null) {
			personagem.setTempoDecorridoAnimacaoMov(personagem.getTempoDecorridoAnimacaoMov() + Gdx.graphics.getDeltaTime());
			if (personagem.getTempoDecorridoAnimacaoMov() > PropriedadeHelper.TEMPO_MOVIMENTO_PERSO) {
				//personagem.setAnimation(new Animation(PropriedadeHelper.VELOCIDADE_ANIMACAO, this.getFramesParadoFR()));
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
			personagem.setTempoDecorridoAnimacaoMov(personagem.getTempoDecorridoAnimacaoMov() + Gdx.graphics.getDeltaTime());
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
				personagem.remove();
			} else if (personagem.getTempoDecorridoAnimacaoMov() != null) {
				if (personagem.getAnimation().isAnimationFinished(personagem.getTempoDecorrido())) {
					personagem.setTempoDecorrido(0);
					personagem.setAnimation(new Animation(PropriedadeHelper.VELOCIDADE_ANIMACAO, this.getFramesMorrendoFR()));
					personagem.getPosicaoAtual().add(-14, -14, 0);
				}
			}
		}*/
		
		
		personagem.setTempoDecorrido(personagem.getTempoDecorrido() + Gdx.graphics.getDeltaTime());
		spriteBatch.draw(personagem.getAnimacao().getFrameAnimacao(personagem.getTempoDecorrido()), personagem.getPosicaoAtual().x,personagem.getPosicaoAtual().y);
		
	}
	
	public void renderizaBarraVida(Personagem personagem, SpriteBatch spriteBatch) {
		/*int vlrDesl = 0;
		if ((personagem.getTipoPersonagem().equals(TipoPersonagem.MONSTRO) && personagem.getPosicaoFinal() != null) || personagem.isAtacando())
			vlrDesl = 14;
		spriteBatch.draw(barraVida[personagem.getVida()], personagem.getPosicaoAtual().x - 5 + vlrDesl,personagem.getPosicaoAtual().y + 80 + vlrDesl);*/
	}
	
	private Animation getAnimacaoMov(Personagem personagem, Casa casa) {
		/*if (personagem.getCasaAtual().getPosicaoMapa().x < casa.getPosicaoMapa().x	&& personagem.getCasaAtual().getPosicaoMapa().y < casa.getPosicaoMapa().y)
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
			return new Animation(PropriedadeHelper.VELOCIDADE_ANIMACAO, getFramesMovimentoFR());*/
		return null;
	}

}
