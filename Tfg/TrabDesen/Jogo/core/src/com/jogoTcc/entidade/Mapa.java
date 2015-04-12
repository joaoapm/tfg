package com.jogoTcc.entidade;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.GL30;
import com.badlogic.gdx.graphics.OrthographicCamera;
import com.badlogic.gdx.maps.tiled.TiledMap;
import com.badlogic.gdx.maps.tiled.TmxMapLoader;
import com.badlogic.gdx.maps.tiled.renderers.IsometricTiledMapRenderer;

public class Mapa {

	private TiledMap mapa;

	public static IsometricTiledMapRenderer renderizador;

	private OrthographicCamera camera;

	public Mapa(String nomeMapa) {
		TmxMapLoader loader = new TmxMapLoader();
		this.mapa = loader.load(nomeMapa);

		this.renderizador = new IsometricTiledMapRenderer(mapa);
		this.camera = new OrthographicCamera();

	}

	public void renderizarMapa() {
		Gdx.gl30.glClearColor(0, 0, 0, 1);
		Gdx.gl30.glClear(GL30.GL_COLOR_BUFFER_BIT);
		this.renderizador.setView(camera);
		this.renderizador.render();
	}

	public IsometricTiledMapRenderer getRenderizador() {
		return renderizador;
	}

	public void setRenderizador(IsometricTiledMapRenderer renderizador) {
		this.renderizador = renderizador;
	}

	public OrthographicCamera getCamera() {
		return camera;
	}

	public void setCamera(OrthographicCamera camera) {
		this.camera = camera;
	}

}
