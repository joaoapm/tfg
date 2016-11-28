package com.j01.entidades;

import com.badlogic.gdx.InputMultiplexer;
import com.badlogic.gdx.InputProcessor;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;
import com.badlogic.gdx.graphics.glutils.ShapeRenderer;
import com.badlogic.gdx.graphics.glutils.ShapeRenderer.ShapeType;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.math.Vector3;
import com.j01.estrutura.Animacao;
import com.j01.estrutura.TipoAcao;
import com.j01.estrutura.TipoAnimacao;
import com.j01.estrutura.TipoPersonagem;
import com.j01.helper.MapaHelper;
import com.j01.helper.PersonagemHelper;

public class Personagem extends Entidade implements InputProcessor {

	private PersonagemHelper personagemHelper;

	private TipoPersonagem tipoPersonagem;
	private Animacao animacao;

	private int time;
	private int vida = 3;

	public Personagem(TipoPersonagem tipoPersonagem, Casa casaAtual, InputMultiplexer inputMultiplexer, Partida partida,
			boolean debug, int camada, int time) {

		setPartida(partida);
		setModoDebug(debug);
		setCamada(camada);
		setCasaAtual(MapaHelper.getPosicaoTelaCasa(casaAtual));
		setPosicaoInicial(new Vector3(getCasaAtual().getPosicaoTela()));
		setPosicaoAtual(new Vector3(getCasaAtual().getPosicaoTela()));
		setPosicaoFinal(null);
		setInputMultiplexer(inputMultiplexer);

		this.time = time;
		this.tipoPersonagem = tipoPersonagem;
		this.personagemHelper = new PersonagemHelper(tipoPersonagem, this);
		this.animacao = new Animacao(this, TipoAnimacao.PARADOFR);
		this.animacao.iniciaAnimacao();
		
		inputMultiplexer.addProcessor(this);

	}

	@Override
	public void render(SpriteBatch spriteBatch) {
		personagemHelper.renderizaAnimacaoPersonagem(this, spriteBatch);
		personagemHelper.renderizaBarraVida(this, spriteBatch);
	}

	@Override
	public void renderShape(ShapeRenderer shapeRenderer) {
		if (isModoDebug()) {
			shapeRenderer.set(ShapeType.Line);
			shapeRenderer.setColor(Color.RED);
			shapeRenderer.setTransformMatrix(new Matrix4());
			shapeRenderer.rect(getCasaAtual().getPosicaoTela().x, getCasaAtual().getPosicaoTela().y, 96, 96);
		}
	}

	public void realizaAcaoCasa(TipoAcao acaoCasa, Casa casa) {
		if (acaoCasa.equals(TipoAcao.MOVIMENTO))
			movimenta(casa);
		else if (acaoCasa.equals(TipoAcao.ATAQUE))
			ataca(casa);
	}

	public void movimenta(Casa casa) {
		if (MapaHelper.isCasaNaRange(this.getCasaAtual(), casa)) {
			if (casa.getPosicaoMapa().x != this.getCasaAtual().getPosicaoMapa().x || casa.getPosicaoMapa().y != this.getCasaAtual().getPosicaoMapa().y) {
				personagemHelper.movePersonagem(this, casa);
				MapaHelper.escondeRange();
			}
		}
	}

	public void ataca(Casa casa) {
		personagemHelper.atacaPersonagem(this);
		MapaHelper.escondeRange();
	}

	@Override
	public boolean touchDown(int x, int y, int arg2, int arg3) {
		if (PersonagemHelper.tocouPersonagem(this, x, y) && !isAtacando() && !getAnimacao().isMovendo()	&& getPartida().getTimeTurno() == this.getTime()) {
			getPartida().setPersonagemSelecionado(this);
			MapaHelper.escondeRange();
			MapaHelper.mostraRange(getCasaAtual());
		}
		return false;
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
	public boolean touchDragged(int arg0, int arg1, int arg2) {
		return false;
	}

	@Override
	public boolean touchUp(int arg0, int arg1, int arg2, int arg3) {
		return false;
	}

	@Override
	public boolean scrolled(int arg0) {
		return false;
	}

	public TipoPersonagem getTipoPersonagem() {
		return tipoPersonagem;
	}

	public void setTipoPersonagem(TipoPersonagem tipoPersonagem) {
		this.tipoPersonagem = tipoPersonagem;
	}

	public int getTime() {
		return time;
	}

	public void setTime(int time) {
		this.time = time;
	}

	public int getVida() {
		return vida;
	}

	public void setVida(int vida) {
		this.vida = vida;
	}

	public Animacao getAnimacao() {
		return animacao;
	}

	public void setAnimacao(Animacao animacao) {
		this.animacao = animacao;
	}

	public void remove() {
		getInputMultiplexer().removeProcessor(this);
		setRemovido(true);
	}
}
