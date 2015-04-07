package com.jogoTcc.estrutura;


import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.Screen;
import com.badlogic.gdx.graphics.GL30;
import com.badlogic.gdx.graphics.OrthographicCamera;
import com.badlogic.gdx.maps.tiled.TiledMap;
import com.badlogic.gdx.maps.tiled.TmxMapLoader;
import com.badlogic.gdx.maps.tiled.renderers.IsometricTiledMapRenderer;
import com.badlogic.gdx.math.Vector3;

public class Partida implements Screen {
	private TiledMap map;

	private IsometricTiledMapRenderer renderer;

	private OrthographicCamera camera;


	@Override
	public void show() {
		TmxMapLoader loader = new TmxMapLoader();
		map = loader.load("mapa/mapa.tmx");
		 
		renderer = new  IsometricTiledMapRenderer(map);
		camera = new OrthographicCamera();
		

	}

	@Override
	public void render(float delta) {
		Gdx.gl30.glClearColor(0, 0, 0, 1);
		Gdx.gl30.glClear(GL30.GL_COLOR_BUFFER_BIT);
		renderer.setView(camera);
		renderer.render();

		renderer.getBatch().begin();
		
		renderer.getBatch().end();
	}

	@Override
	public void resize(int width, int height) {
		camera.viewportHeight = height;
		camera.viewportWidth = width;
		
		camera.translate(((new Vector3(200,0,0))));
		
		camera.update();
	}

	@Override
	public void pause() {
	}

	@Override
	public void resume() {
	}

	@Override
	public void hide() {
	}

	@Override
	public void dispose() {
	}

}
