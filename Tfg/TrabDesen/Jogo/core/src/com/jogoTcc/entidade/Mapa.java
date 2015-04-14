package com.jogoTcc.entidade;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.GL30;
import com.badlogic.gdx.graphics.OrthographicCamera;
import com.badlogic.gdx.maps.MapLayer;
import com.badlogic.gdx.maps.tiled.TiledMap;
import com.badlogic.gdx.maps.tiled.TiledMapTileLayer;
import com.badlogic.gdx.maps.tiled.TmxMapLoader;
import com.badlogic.gdx.maps.tiled.renderers.IsometricTiledMapRenderer;
import com.badlogic.gdx.scenes.scene2d.EventListener;
import com.badlogic.gdx.scenes.scene2d.Stage;

public class Mapa extends Stage{

	private TiledMap mapa;

	public static IsometricTiledMapRenderer renderizador;

	private OrthographicCamera camera;

	public Mapa(String nomeMapa) {
		TmxMapLoader loader = new TmxMapLoader();
		this.mapa = loader.load(nomeMapa);

		
		 for (MapLayer layer : this.mapa.getLayers()) {
	            TiledMapTileLayer tiledLayer = (TiledMapTileLayer)layer;
	            createActorsForLayer(tiledLayer);
	        }
		 
 this.renderizador = new IsometricTiledMapRenderer(mapa);
	  	this.camera = new OrthographicCamera();

	}

	public void renderizarMapa() {
	//	Gdx.gl30.glClearColor(0, 0, 0, 1);
	//	Gdx.gl30.glClear(GL30.GL_COLOR_BUFFER_BIT);
	//	this.renderizador.setView(camera);
	//	this.renderizador.render();

	}

	private void createActorsForLayer(TiledMapTileLayer tiledLayer) {
		for (int x = 0; x < tiledLayer.getWidth(); x++) {
			for (int y = 0; y < tiledLayer.getHeight(); y++) {
				TiledMapTileLayer.Cell cell = tiledLayer.getCell(x, y);
				TiledMapActor actor = new TiledMapActor(this.mapa, tiledLayer,cell);
				actor.setBounds(x * tiledLayer.getTileWidth(),
						y * tiledLayer.getTileHeight(),
						tiledLayer.getTileWidth(), tiledLayer.getTileHeight());
				addActor(actor);
				EventListener eventListener = new TiledMapClickListener(actor);
				actor.addListener(eventListener);
			}
		}
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
