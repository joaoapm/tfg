package com.jogoTcc.desktop;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.Screen;
import com.badlogic.gdx.graphics.GL30;
import com.badlogic.gdx.graphics.OrthographicCamera;
import com.badlogic.gdx.maps.tiled.TiledMap;
import com.badlogic.gdx.maps.tiled.TmxMapLoader;
import com.badlogic.gdx.maps.tiled.renderers.OrthogonalTiledMapRenderer;

public class Mapa implements Screen {
	private TiledMap map;

	private OrthogonalTiledMapRenderer renderer;
	
	private OrthographicCamera camera;

	@Override
	public void show() {
		TmxMapLoader loader = new TmxMapLoader();
		map = loader.load("maps/mapa2.tmx");
		
		renderer = new OrthogonalTiledMapRenderer(map);
		camera = new OrthographicCamera();
		
		
	
	}

	@Override
	public void render(float delta) { 
		// TODO Auto-generated method stub
		Gdx.gl30.glClearColor(0, 0, 0, 1);
		Gdx.gl30.glClear(GL30.GL_COLOR_BUFFER_BIT);
		renderer.setView(camera);
		renderer.render();

	}

	@Override
	public void resize(int width, int height) {
		// TODO Auto-generated method stub
		camera.viewportHeight = height;
		camera.viewportWidth = width;
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

	}

	@Override
	public void dispose() {
		// TODO Auto-generated method stub

	}

}
