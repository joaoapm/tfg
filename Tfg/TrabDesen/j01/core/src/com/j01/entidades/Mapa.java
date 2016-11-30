package com.j01.entidades;

import java.util.ArrayList;

import com.badlogic.gdx.InputMultiplexer;
import com.badlogic.gdx.InputProcessor;
import com.badlogic.gdx.graphics.OrthographicCamera;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;
import com.badlogic.gdx.graphics.glutils.ShapeRenderer;
import com.badlogic.gdx.maps.tiled.TiledMap;
import com.badlogic.gdx.maps.tiled.TiledMapTile;
import com.badlogic.gdx.maps.tiled.TmxMapLoader;
import com.badlogic.gdx.maps.tiled.renderers.IsometricTiledMapRenderer;
import com.badlogic.gdx.math.Vector3;
import com.j01.estrutura.TipoAcao;
import com.j01.helper.MapaHelper;

public class Mapa extends Entidade implements InputProcessor {

	private TiledMap map;
	private IsometricTiledMapRenderer renderer;
	private OrthographicCamera camera;

	public InputMultiplexer processor;

	private TiledMapTile tileSel = null;
	
	private ArrayList<Entidade> entidades;

	public Mapa(OrthographicCamera camera, InputMultiplexer inputMultiplexer, Partida partida, int camada, ArrayList<Entidade> entidades) {

		this.camera = camera;
		MapaHelper.MAPA = this;
		setPartida(partida);
		setEntidades(entidades);
		setCamada(1);

		// carrega mapa
		TmxMapLoader loader = new TmxMapLoader();
		map = loader.load("mapa/mapa.tmx");
		renderer = new IsometricTiledMapRenderer(map);

		MapaHelper.escondeRange();
		MapaHelper.iniciaBases();

		inputMultiplexer.addProcessor(this);

	}

	@Override
	public boolean touchDown(int screenX, int screenY, int pointer, int button) {
		TipoAcao acaoCasa = MapaHelper.getAcaoCasa(MapaHelper.getPosicaoCasa(new Casa(null, new Vector3(screenX, screenY, 0))),getPartida().getPersonagemSelecionado());

		if (getPartida().getPersonagemSelecionado() != null	&& (!getPartida().getPersonagemSelecionado().isAtacando()
						&& !getPartida().getPersonagemSelecionado().getAnimacao().isPodeClicar()) 
				            && acaoCasa != null && getPartida().getPersonagemSelecionado().getTime() == getPartida().getTimeTurno())
			getPartida().getPersonagemSelecionado().realizaAcaoCasa(acaoCasa,MapaHelper.getPosicaoCasa(new Casa(null, new Vector3(screenX, screenY, 0))));

		return false;
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

	@Override
	public void renderShape(ShapeRenderer shapeRenderer) {
	}

	@Override
	public void render(SpriteBatch spriteBatch) {
		MapaHelper.renderizaBarraVidaBase(this,spriteBatch);
	}
	
	public IsometricTiledMapRenderer getRenderer() {
		return renderer;
	}

	public void setRenderer(IsometricTiledMapRenderer renderer) {
		this.renderer = renderer;
	}

	public OrthographicCamera getCamera() {
		return camera;
	}

	public void setCamera(OrthographicCamera camera) {
		this.camera = camera;
	}

	public TiledMap getMap() {
		return map;
	}

	public void setMap(TiledMap map) {
		this.map = map;
	}

	public TiledMapTile getTileSel() {
		return tileSel;
	}

	public void setTileSel(TiledMapTile tileSel) {
		this.tileSel = tileSel;
	}

	public ArrayList<Entidade> getEntidades() {
		return entidades;
	}

	public void setEntidades(ArrayList<Entidade> entidades) {
		this.entidades = entidades;
	}
	
}
