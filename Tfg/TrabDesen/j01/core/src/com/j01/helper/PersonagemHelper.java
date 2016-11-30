package com.j01.helper;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;
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
		personagem.getAnimacao().setTipoAnimacao(getTipoAnimacao(personagem, casa));
		personagem.setCasaAtual(casa);
		personagem.setPosicaoFinal(casa.getPosicaoTela());
	}
	
	public void atacaPersonagem(Personagem personagem) {
		 personagem.getPartida().ataquePersonagem();
		 personagem.getAnimacao().setTipoAnimacao(TipoAnimacao.ATAQUEFR);
	}
	
	public void renderizaAnimacaoPersonagem(Personagem personagem, SpriteBatch spriteBatch) {
		personagem.setTempoDecorrido(personagem.getTempoDecorrido() + Gdx.graphics.getDeltaTime());
		if (personagem.getAnimacao().isPodeClicar()) {
			personagem.setTempoDecorridoAnimacaoMov(personagem.getTempoDecorridoAnimacaoMov() + Gdx.graphics.getDeltaTime());
			if (personagem.getTempoDecorridoAnimacaoMov() < PropriedadeHelper.TEMPO_MOVIMENTO_PERSO) {
				personagem.getPosicaoAtual().set(personagem.getPosicaoFinal());
				personagem.getPosicaoAtual().sub(personagem.getPosicaoInicial());
				personagem.getPosicaoAtual().scl(Interpolation.linear.apply(personagem.getTempoDecorridoAnimacaoMov() / PropriedadeHelper.TEMPO_MOVIMENTO_PERSO));
				personagem.getPosicaoAtual().add(personagem.getPosicaoInicial());
			} else {
				personagem.setAnimacao(new Animacao(personagem, TipoAnimacao.PARADOFR));
				personagem.setPosicaoInicial(personagem.getPosicaoFinal());
				personagem.getPartida().trocaTurno();
			}
		}
		
		
		if (personagem.getAnimacao().getTipoAnimacao().equals(TipoAnimacao.ATAQUEFR) && personagem.getAnimacao().getNroExecucoes() >= 1) {
			personagem.setAnimacao(new Animacao(personagem, TipoAnimacao.PARADOFR));
			personagem.getPartida().trocaTurno();
		}
		
		if (personagem.getAnimacao().getTipoAnimacao().equals(TipoAnimacao.MORRENDOFR) && personagem.getAnimacao().getNroExecucoes() >= 1) {
			personagem.remove();
		}
 
		spriteBatch.draw(personagem.getAnimacao().getFrameAnimacao(personagem.getTempoDecorrido()), personagem.getPosicaoAtual().x,personagem.getPosicaoAtual().y);
	}
	
	public void renderizaBarraVida(Personagem personagem, SpriteBatch spriteBatch) {
		int vlrDesl = 0;
		if ((personagem.getTipoPersonagem().equals(TipoPersonagem.MONSTRO) && personagem.getPosicaoFinal() != null)
				|| personagem.isAtacando())
			vlrDesl = 14;
		spriteBatch.draw(personagem.getAnimacao().getBarraVida(personagem.getVida()),personagem.getPosicaoAtual().x - 5 + vlrDesl, personagem.getPosicaoAtual().y + 80 + vlrDesl);
	}
	
	private TipoAnimacao getTipoAnimacao(Personagem personagem, Casa casa) {
		if (personagem.getCasaAtual().getPosicaoMapa().x < casa.getPosicaoMapa().x && personagem.getCasaAtual().getPosicaoMapa().y < casa.getPosicaoMapa().y)
			return TipoAnimacao.MOVIMENTOD1;
		if (personagem.getCasaAtual().getPosicaoMapa().x > casa.getPosicaoMapa().x && personagem.getCasaAtual().getPosicaoMapa().y < casa.getPosicaoMapa().y)
			return TipoAnimacao.MOVIMENTOD2;
		if (personagem.getCasaAtual().getPosicaoMapa().x < casa.getPosicaoMapa().x && personagem.getCasaAtual().getPosicaoMapa().y > casa.getPosicaoMapa().y)
			return TipoAnimacao.MOVIMENTOD3;
		if (personagem.getCasaAtual().getPosicaoMapa().x > casa.getPosicaoMapa().x && personagem.getCasaAtual().getPosicaoMapa().y > casa.getPosicaoMapa().y)
			return TipoAnimacao.MOVIMENTOD4;
		if (personagem.getCasaAtual().getPosicaoMapa().x == casa.getPosicaoMapa().x && personagem.getCasaAtual().getPosicaoMapa().y < casa.getPosicaoMapa().y)
			return TipoAnimacao.MOVIMENTOLD;
		if (personagem.getCasaAtual().getPosicaoMapa().x == casa.getPosicaoMapa().x && personagem.getCasaAtual().getPosicaoMapa().y > casa.getPosicaoMapa().y)
			return TipoAnimacao.MOVIMENTOLE;
		if (personagem.getCasaAtual().getPosicaoMapa().y == casa.getPosicaoMapa().y && personagem.getCasaAtual().getPosicaoMapa().x > casa.getPosicaoMapa().x)
			return TipoAnimacao.MOVIMENTOTR;
		if (personagem.getCasaAtual().getPosicaoMapa().y == casa.getPosicaoMapa().y && personagem.getCasaAtual().getPosicaoMapa().x < casa.getPosicaoMapa().x)
			return TipoAnimacao.MOVIMENTOFR;

		return null;
	}

}
