package com.j01.entidades;

import java.util.List;

import com.badlogic.gdx.InputMultiplexer;
import com.badlogic.gdx.InputProcessor;
import com.badlogic.gdx.graphics.OrthographicCamera;
import com.badlogic.gdx.graphics.glutils.ShapeRenderer;
import com.badlogic.gdx.maps.tiled.TiledMap;
import com.badlogic.gdx.maps.tiled.TiledMapTile;
import com.badlogic.gdx.maps.tiled.TmxMapLoader;
import com.badlogic.gdx.maps.tiled.renderers.IsometricTiledMapRenderer;
import com.badlogic.gdx.math.Vector3;
import com.j01.helper.MapaHelper;

public class Mapa extends Entidade implements InputProcessor {

	private TiledMap map;
	private IsometricTiledMapRenderer renderer;
	private OrthographicCamera camera;
	private OrthogonalTiledMapRendererWithSprites rend;
public List<Entidade> listaentidades;

	public OrthogonalTiledMapRendererWithSprites getRend() {
		return rend;
	}

	public void setRend(OrthogonalTiledMapRendererWithSprites rend) {
		this.rend = rend;
	}

	public InputMultiplexer processor;

	private TiledMapTile tileSel = null;

	public Mapa(OrthographicCamera camera, InputMultiplexer inputMultiplexer, Partida partida, int camada) {

		this.camera = camera;
		MapaHelper.MAPA = this;
		setPartida(partida);
		setCamada(1);

		// carrega mapa
		TmxMapLoader loader = new TmxMapLoader();
		map = loader.load("mapa/mapa.tmx");
		//renderer = new IsometricTiledMapRenderer(map);
		rend = new OrthogonalTiledMapRendererWithSprites(map);
		
		MapaHelper.escondeRange();
//
		inputMultiplexer.addProcessor(this);

	}

	@Override
	public boolean touchDown(int screenX, int screenY, int pointer, int button) {
		if (getPartida().getPersonagemSelecionado() != null)
			getPartida().getPersonagemSelecionado().realizaAcaoCasa(MapaHelper.getPosicaoCasa(new Casa(null, new Vector3(screenX, screenY, 0))));
//		MapaHelper.mostraRange(MapaHelper.getPosicaoCasa(new Casa(null, new Vector3(screenX, screenY, 0))));
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

	public void renderiza() {
		rend.sprites = listaentidades;
		getRend().render();
		
	}

}
