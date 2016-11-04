package com.j01.entidades;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.InputProcessor;
import com.badlogic.gdx.Screen;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.OrthographicCamera;
import com.badlogic.gdx.maps.tiled.TiledMap;
import com.badlogic.gdx.maps.tiled.TmxMapLoader;
import com.badlogic.gdx.maps.tiled.renderers.IsometricTiledMapRenderer;
import com.badlogic.gdx.math.Vector3;

public class Mapa /*implements InputProcessor */{

	/*private TiledMap map;
	private IsometricTiledMapRenderer renderer;
	private OrthographicCamera camera;

	@Override
	public void show() {
		// TODO Auto-generated method stub
		TmxMapLoader loader = new TmxMapLoader();
		map = loader.load("mapa.tmx");
		renderer = new IsometricTiledMapRenderer(map);

		camera = new OrthographicCamera();
		camera.position.set(300, 0, 0);

		Gdx.input.setInputProcessor(this);
	}

	public void render(float delta) {
		// TODO Auto-generated method stub
		Gdx.gl.glClearColor(0, 0, 0, 0);
		Gdx.gl.glClear(GL20.GL_COLOR_BUFFER_BIT);

		renderer.setView(camera);
		renderer.render();

	}

	public void resize(int width, int height) {
		// TODO Auto-generated method stub
		camera.viewportWidth = width;
		camera.viewportHeight = height;
		camera.update();

	}

	@Override
	public void pause() {
		// TODO Auto-generated method stub

	}

	@Override
	public void resume() {
		// TODO Auto-generated method stub

	}

	@Override
	public void hide() {
		// TODO Auto-generated method stub
		map.dispose();

	}

	@Override
	public void dispose() {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean keyDown(int keycode) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean keyUp(int keycode) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean keyTyped(char character) {
		// TODO Auto-generated method stub
		return false;
	}

	private Vector3 worldToIso(Vector3 point, int tileWidth, int tileHeight) {
		camera.unproject(point);
		point.x /= tileWidth;
		point.y = (point.y - tileHeight / 2) / tileHeight + point.x;
		point.x -= point.y - point.x;
		return point;
	}

	@Override
	public boolean touchDown(int screenX, int screenY, int pointer, int button) {
		System.out.println("Screen coordin: " + (int) worldToIso(new Vector3(screenX, screenY, 0), 64, 32).x);
		System.out.println("Screen coordin: " + (int) worldToIso(new Vector3(screenX, screenY, 0), 64, 32).y);

		return false;
	}

	@Override
	public boolean touchUp(int screenX, int screenY, int pointer, int button) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean touchDragged(int screenX, int screenY, int pointer) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean mouseMoved(int screenX, int screenY) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean scrolled(int amount) {
		// TODO Auto-generated method stub
		return false;
	}*/

}
