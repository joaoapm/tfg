package com.j01.entidades;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.InputMultiplexer;
import com.badlogic.gdx.InputProcessor;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.Animation;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;
import com.badlogic.gdx.graphics.g2d.TextureAtlas;
import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.badlogic.gdx.graphics.glutils.ShapeRenderer;
import com.badlogic.gdx.graphics.glutils.ShapeRenderer.ShapeType;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.math.Vector3;
import com.j01.estrutura.TipoPersonagem;
import com.j01.helper.MapaHelper;
import com.j01.helper.PersonagemHelper;
import com.j01.helper.PropriedadeHelper;

public class Personagem extends Entidade implements InputProcessor {

	private Animation animation;
	private TextureAtlas textureAtlas;
	private TipoPersonagem tipoPersonagem;
	private PersonagemHelper personagemHelper;
	private Casa casaAtual;

	public Personagem(TipoPersonagem tipoPersonagem, Casa casaAtual, InputMultiplexer inputMultiplexer, Partida partida,
			boolean debug, int camada) {

		setPartida(partida);
		setModoDebug(debug);
		setCamada(camada);
		setPosicao(MapaHelper.getPosicaoTelaCasa(casaAtual.getX(), casaAtual.getY()));

		personagemHelper = new PersonagemHelper(tipoPersonagem);

		this.tipoPersonagem = tipoPersonagem;
		this.casaAtual = casaAtual;

		inputMultiplexer.addProcessor(this);

		animation = new Animation(PropriedadeHelper.VELOCIDADE_ANIMACAO, personagemHelper.getFramesParadoFR());

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

	public TextureRegion getFrame(float elapsedTime) {
		setElapsedTime(elapsedTime);
		return getAnimation().getKeyFrame(elapsedTime, true);
	}

	@Override
	public void render(SpriteBatch spriteBatch) {
		setElapsedTime(getElapsedTime() + Gdx.graphics.getDeltaTime());
		spriteBatch.draw(this.getFrame(getElapsedTime()), this.getPosicao().x, this.getPosicao().y);
	}

	@Override
	public void renderShape(ShapeRenderer shapeRenderer) {
		if (isModoDebug()) {
			shapeRenderer.set(ShapeType.Line);
			shapeRenderer.setColor(Color.RED);
			shapeRenderer.setTransformMatrix(new Matrix4());
			shapeRenderer.rect(getPosicao().x, getPosicao().y, 96, 96);
		}
	}

	public void movePersonagem(Casa casa) {
		PersonagemHelper.movePersonagem(this, casa);
		MapaHelper.escondeRange();

	}

	@Override
	public boolean touchDown(int x, int y, int arg2, int arg3) {
		// foi clicado, verifica se alguma entidade com camada superior ao mapa
		// foi clicada, senao executa mapa
		if (PersonagemHelper.tocouPersonagem(this, x, y)) {
			getPartida().setPersonagemSelecionado(this);
			MapaHelper.mostraRange(this.casaAtual.getX(), this.casaAtual.getY());
		}

		return false;
	}

	public Casa getCasaAtual() {
		return casaAtual;
	}

	public void setCasaAtual(Casa casaAtual) {
		this.casaAtual = casaAtual;
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

}
