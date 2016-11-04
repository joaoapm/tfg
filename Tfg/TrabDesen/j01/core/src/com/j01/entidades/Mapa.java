package com.j01.entidades;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.InputProcessor;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.OrthographicCamera;
import com.badlogic.gdx.maps.tiled.TiledMap;
import com.badlogic.gdx.maps.tiled.TmxMapLoader;
import com.badlogic.gdx.maps.tiled.renderers.IsometricTiledMapRenderer;
import com.badlogic.gdx.math.Vector3;

public class Mapa implements InputProcessor {

	private TiledMap map;
	private IsometricTiledMapRenderer renderer;
	private OrthographicCamera camera;

	public Mapa(OrthographicCamera camera) {
		TmxMapLoader loader = new TmxMapLoader();
		map = loader.load("mapa/mapa.tmx");
		renderer = new IsometricTiledMapRenderer(map);
		this.camera = camera;
		Gdx.input.setInputProcessor(this);
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
		//System.out.println("X: " + (int) worldToIso(new Vector3(screenX, screenY, 0), 64, 32).x);
		//System.out.println("Y: " + (int) worldToIso(new Vector3(screenX, screenY, 0), 64, 32).y);

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

	private Vector3 worldToIso(Vector3 point, int tileWidth, int tileHeight) {
		camera.unproject(point);
		point.x /= tileWidth;
		point.y = (point.y - tileHeight / 2) / tileHeight + point.x;
		point.x -= point.y - point.x;
		return point;
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

}
