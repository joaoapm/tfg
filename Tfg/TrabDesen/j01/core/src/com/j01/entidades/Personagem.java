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
import com.badlogic.gdx.math.Interpolation;
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
	private Vector3 ultimaPos;
	
	
	
	public Vector3 getUltimaPos() {
		return ultimaPos;
	}

	public void setUltimaPos(Vector3 ultimaPos) {
		this.ultimaPos = ultimaPos;
	}
	private Interpolation easAlpha  = Interpolation.fade;

	public Personagem(TipoPersonagem tipoPersonagem, Casa casaAtual, InputMultiplexer inputMultiplexer, Partida partida,
			boolean debug, int camada) {

		setPartida(partida);
		setModoDebug(debug);
		setCamada(camada);

		this.casaAtual = MapaHelper.getPosicaoTelaCasa(casaAtual);
		this.ultimaPos = this.casaAtual.getPosicaoTela();
		this.tipoPersonagem = tipoPersonagem;

		personagemHelper = new PersonagemHelper(tipoPersonagem);
		inputMultiplexer.addProcessor(this);

		animation = new Animation(PropriedadeHelper.VELOCIDADE_ANIMACAO, personagemHelper.getFramesParadoFR());

	}
	Vector3 position = new Vector3();
	@Override
	public void render(SpriteBatch spriteBatch) {
/*
		if(ultimaPos.x != this.casaAtual.getPosicaoTela().x &&  ultimaPos.y != this.casaAtual.getPosicaoTela().y){
		position.x = this.casaAtual.getPosicaoTela().x + (this.casaAtual.getPosicaoTela().x) * .01f;
		position.y = this.casaAtual.getPosicaoTela().y + (this.casaAtual.getPosicaoTela().y) * .01f;
		this.casaAtual.setPosicaoTela(position);
		}*/

		setElapsedTime(getElapsedTime() + Gdx.graphics.getDeltaTime());
		spriteBatch.draw(this.getFrame(getElapsedTime()), this.casaAtual.getPosicaoTela().x,this.casaAtual.getPosicaoTela().y);

	}

	public TextureRegion getFrame(float elapsedTime) {
		setElapsedTime(elapsedTime);
		return getAnimation().getKeyFrame(elapsedTime, true);
	}
	
	@Override
	public void renderShape(ShapeRenderer shapeRenderer) {
		if (isModoDebug()) {
			shapeRenderer.set(ShapeType.Line);
			shapeRenderer.setColor(Color.RED);
			shapeRenderer.setTransformMatrix(new Matrix4());
			shapeRenderer.rect(casaAtual.getPosicaoTela().x, casaAtual.getPosicaoTela().y, 96, 96);
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
			MapaHelper.mostraRange(this.casaAtual);
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

}
