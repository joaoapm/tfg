package com.j01.entidades;

import com.badlogic.gdx.InputMultiplexer;
import com.badlogic.gdx.InputProcessor;
import com.badlogic.gdx.graphics.OrthographicCamera;
import com.badlogic.gdx.graphics.glutils.ShapeRenderer;
import com.badlogic.gdx.maps.MapLayer;
import com.badlogic.gdx.maps.tiled.TiledMap;
import com.badlogic.gdx.maps.tiled.TiledMapTile;
import com.badlogic.gdx.maps.tiled.TiledMapTileLayer;
import com.badlogic.gdx.maps.tiled.TiledMapTileLayer.Cell;
import com.badlogic.gdx.maps.tiled.TmxMapLoader;
import com.badlogic.gdx.maps.tiled.renderers.IsometricTiledMapRenderer;
import com.badlogic.gdx.math.Matrix4;
import com.j01.helper.MapaHelper;

public class Mapa extends Entidade implements InputProcessor {

	private TiledMap map;
	private IsometricTiledMapRenderer renderer;
	private OrthographicCamera camera;

	public InputMultiplexer processor;
	public Personagem pp;
	private Matrix4 isoTransform;

	private TiledMapTile tileSel = null;

	public Mapa(OrthographicCamera camera, InputMultiplexer inputMultiplexer, Partida partida, int camada) {

		this.camera = camera;
		setPartida(partida);
		setCamada(1);

		// carrega mapa
		TmxMapLoader loader = new TmxMapLoader();
		map = loader.load("mapa/mapa.tmx");
		renderer = new IsometricTiledMapRenderer(map);

		// esconde layer casa selecionada
		TiledMapTileLayer layer = (TiledMapTileLayer) map.getLayers().get(3);
		for (int i = 0; i < 50; i++) {
			for (int j = 0; j < 50; j++) {
				if (layer.getCell(i, j) != null) {
					Cell c = layer.getCell(i, j);
					if (tileSel == null)
						tileSel = c.getTile();
					c.setTile(null);
				}
			}
		}

		inputMultiplexer.addProcessor(this);

		isoTransform = new Matrix4();
		isoTransform.idt();

		isoTransform.translate(10, 120, 0);
		isoTransform.scale((float) (Math.sqrt(2.0) / 2.0), (float) (Math.sqrt(2.0) / 4.0), 1.0f);
		isoTransform.rotate(0.0f, 0.0f, 1.0f, -45);

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
	public boolean touchDown(int screenX, int screenY, int pointer, int button) {
		if (getPartida().getPersonagemSelecionado() != null)
			pp.movePersonagem(MapaHelper.getPosicaoCasa(screenX, screenY));

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

	@Override
	public void renderShape(ShapeRenderer shapeRenderer) {
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

}
