package com.j01.telas;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.Screen;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.OrthographicCamera;
import com.j01.entidades.Mapa;

public class TelaJogo implements Screen {

	private OrthographicCamera camera;
	Mapa mapa;

	@Override
	public void show() {
		camera = new OrthographicCamera();
		camera.position.set(300, 0, 0);

		mapa = new Mapa(camera);

	}

	@Override
	public void render(float delta) {
		Gdx.gl.glClearColor(0, 0, 0, 0);
		Gdx.gl.glClear(GL20.GL_COLOR_BUFFER_BIT);

		mapa.getRenderer().setView(camera);

		mapa.getRenderer().render();

	}

	@Override
	public void resize(int width, int height) {
		camera.viewportWidth = width;
		camera.viewportHeight = height;
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
