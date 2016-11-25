package com.j01.entidades;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.InputMultiplexer;
import com.badlogic.gdx.InputProcessor;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.Animation;
import com.badlogic.gdx.graphics.g2d.Batch;
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

	private PersonagemHelper personagemHelper;

	private Animation animation;
	private TextureAtlas textureAtlas;

	private TipoPersonagem tipoPersonagem;
	private Casa casaAtual;

	private Float tempoDecorridoAnimacaoMov = 0f;
	private Vector3 posicaoInicial = new Vector3(), posicaoFinal = new Vector3(), posicaoAtual = new Vector3();

	private int time;
	
	public Personagem(TipoPersonagem tipoPersonagem, Casa casaAtual, InputMultiplexer inputMultiplexer, Partida partida, boolean debug, int camada, int time) {

		setPartida(partida);
		setModoDebug(debug);
		setCamada(camada);

		this.casaAtual = MapaHelper.getPosicaoTelaCasa(casaAtual);
		this.posicaoInicial = new Vector3(this.casaAtual.getPosicaoTela());
		this.posicaoAtual = new Vector3(this.casaAtual.getPosicaoTela());
		this.posicaoFinal = null;
		this.time = time;
		
		this.tipoPersonagem = tipoPersonagem;

		personagemHelper = new PersonagemHelper(tipoPersonagem,this);
		inputMultiplexer.addProcessor(this);

		animation = new Animation(PropriedadeHelper.VELOCIDADE_ANIMACAO, personagemHelper.getFramesParadoFR());

	}

	@Override
	public void render(SpriteBatch spriteBatch) {
		personagemHelper.movimentaPersonagem(this);
		
		setTempoDecorrido(getTempoDecorrido() + Gdx.graphics.getDeltaTime());
		spriteBatch.draw(this.getFrame(getTempoDecorrido()), this.posicaoAtual.x,	this.posicaoAtual.y);
	}

	public TextureRegion getFrame(float elapsedTime) {
		setTempoDecorrido(elapsedTime);
		return getAnimation().getKeyFrame(elapsedTime, true);
	}

	@Override
	public void renderShape(ShapeRenderer shapeRenderer) {
//		if (isModoDebug()) {
			shapeRenderer.set(ShapeType.Line);
			shapeRenderer.setColor(Color.RED);
			shapeRenderer.setTransformMatrix(new Matrix4());
			
			Vector3 pontoClick = new Vector3(casaAtual.getPosicaoTela().x,casaAtual.getPosicaoTela().y,0);
			pontoClick = MapaHelper.MAPA.getCamera().project(pontoClick);
			
			shapeRenderer.rect(pontoClick.x, pontoClick.y, 96, 96);
		//}
	}

	public void realizaAcaoCasa(Casa casa) {
		if (MapaHelper.isCasaNaRange(this.getCasaAtual(), casa)) {
			if (casa.getPosicaoMapa().x != this.getCasaAtual().getPosicaoMapa().x || casa.getPosicaoMapa().y != this.getCasaAtual().getPosicaoMapa().y) {
				personagemHelper.movePersonagem(this, casa);
				MapaHelper.escondeRange();
			}
		}
	}


	@Override
	public boolean touchDown(int x, int y, int arg2, int arg3) {
		// foi clicado, verifica se alguma entidade com camada superior ao mapa
		// foi clicada, senao executa mapa
		if (PersonagemHelper.tocouPersonagem(this, x, y) && !isMovendo() && getPartida().getTimeTurno() == this.getTime()) {
			getPartida().setPersonagemSelecionado(this);
			MapaHelper.escondeRange();
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

	public Float getTempoDecorridoAnimacaoMov() {
		return tempoDecorridoAnimacaoMov;
	}

	public void setTempoDecorridoAnimacaoMov(Float tempoDecorridoAnimacaoMov) {
		this.tempoDecorridoAnimacaoMov = tempoDecorridoAnimacaoMov;
	}

	public Vector3 getPosicaoInicial() {
		return posicaoInicial;
	}

	public void setPosicaoInicial(Vector3 posicaoInicial) {
		this.posicaoInicial = posicaoInicial;
	}

	public Vector3 getPosicaoFinal() {
		return posicaoFinal;
	}

	public void setPosicaoFinal(Vector3 posicaoFinal) {
		this.posicaoFinal = posicaoFinal;
	}

	public Vector3 getPosicaoAtual() {
		return posicaoAtual;
	}

	public void setPosicaoAtual(Vector3 posicaoAtual) {
		this.posicaoAtual = posicaoAtual;
	}

	public int getTime() {
		return time;
	}

	public void setTime(int time) {
		this.time = time;
	}

	public void render(Batch batch) {
		
		//setTempoDecorrido(getTempoDecorrido() + Gdx.graphics.getDeltaTime());
		//batch.draw(this.getFrame(getTempoDecorrido()), 1500,	0);
		
		personagemHelper.movimentaPersonagem(this);
		
		setTempoDecorrido(getTempoDecorrido() + Gdx.graphics.getDeltaTime());
		batch.draw(this.getFrame(getTempoDecorrido()), this.posicaoAtual.x,	this.posicaoAtual.y);
		
	}
	
}
