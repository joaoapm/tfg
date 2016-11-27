package com.j01.entidades;

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
import com.j01.estrutura.TipoAcao;
import com.j01.estrutura.TipoPersonagem;
import com.j01.helper.MapaHelper;
import com.j01.helper.PersonagemHelper;
import com.j01.helper.PropriedadeHelper;

public class Personagem extends Entidade implements InputProcessor {

	private PersonagemHelper personagemHelper;

	private Animation animation;
	private TextureAtlas textureAtlas;

	private TipoPersonagem tipoPersonagem;

	private Float tempoDecorridoAnimacaoMov = 0f;
	private int time;
	
	private int vida = 3;
	
	public Personagem(TipoPersonagem tipoPersonagem, Casa casaAtual, InputMultiplexer inputMultiplexer, Partida partida, boolean debug, int camada, int time) {

		setPartida(partida);
		setModoDebug(debug);
		setCamada(camada);

		setCasaAtual(MapaHelper.getPosicaoTelaCasa(casaAtual));
		setPosicaoInicial(new Vector3(getCasaAtual().getPosicaoTela()));
		setPosicaoAtual(new Vector3(getCasaAtual().getPosicaoTela()));
		setPosicaoFinal(null);
		this.time = time;
		
		this.tipoPersonagem = tipoPersonagem;

		personagemHelper = new PersonagemHelper(tipoPersonagem,this);
		inputMultiplexer.addProcessor(this);

		animation = new Animation(PropriedadeHelper.VELOCIDADE_ANIMACAO, personagemHelper.getFramesParadoFR());
	}

	@Override
	public void render(SpriteBatch spriteBatch) {
		if(!isRemovido()){
		personagemHelper.renderizaAnimacaoPersonagem(this,spriteBatch);
		personagemHelper.renderizaBarraVida(this,spriteBatch);
		}
		
	}

	public TextureRegion getFrame(float elapsedTime) {
		return getAnimation().getKeyFrame(elapsedTime, true);
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
		if(acaoCasa.equals(TipoAcao.MOVIMENTO))
			movimenta(casa);
		else if(acaoCasa.equals(TipoAcao.ATAQUE))
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
		if (PersonagemHelper.tocouPersonagem(this, x, y) && !isMovendo() && !isAtacando() && getPartida().getTimeTurno() == this.getTime()) {
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

}
