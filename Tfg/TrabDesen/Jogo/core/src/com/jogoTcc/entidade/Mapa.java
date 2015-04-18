package com.jogoTcc.entidade;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.GL30;
import com.badlogic.gdx.graphics.OrthographicCamera;
import com.badlogic.gdx.maps.MapLayer;
import com.badlogic.gdx.maps.tiled.TiledMap;
import com.badlogic.gdx.maps.tiled.TiledMapTileLayer;
import com.badlogic.gdx.maps.tiled.TmxMapLoader;
import com.badlogic.gdx.maps.tiled.renderers.IsometricTiledMapRenderer;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.scenes.scene2d.EventListener;
import com.badlogic.gdx.scenes.scene2d.Stage;
import com.jogoTcc.estrutura.Partida;

public class Mapa extends Stage{

	public static  TiledMap mapa;

	public static IsometricTiledMapRenderer renderizador;

	public static OrthographicCamera camera;

	public Mapa(String nomeMapa) {
		TmxMapLoader loader = new TmxMapLoader();
		this.mapa = loader.load(nomeMapa);

		Matrix4 isoTransform = new Matrix4();
		isoTransform.idt();

		  isoTransform.translate(10, 32,10);
		isoTransform.scale((float)(Math.sqrt(2.0) / 2.0), (float)(Math.sqrt(2.0) / 4.0), 1.0f);
		isoTransform.rotate(10.0f, 0.0f, 1.0f, -45);
		
		super.getBatch().setTransformMatrix(isoTransform);
 
		super.getBatch().setProjectionMatrix(isoTransform);
		 for (MapLayer layer : this.mapa.getLayers()) {
	            TiledMapTileLayer tiledLayer = (TiledMapTileLayer)layer;
	            createActorsForLayer(tiledLayer);
	        }
		 
 this.renderizador = new IsometricTiledMapRenderer(mapa);
	  	this.camera = new OrthographicCamera();

	}

	public void renderizarMapa() {
	 	Gdx.gl30.glClearColor(0, 0, 0, 1);
	 	Gdx.gl30.glClear(GL30.GL_COLOR_BUFFER_BIT);
	 	this.renderizador.setView(camera);
	 	this.renderizador.render();

	}

	private void createActorsForLayer(TiledMapTileLayer tiledLayer) {
		//for (int x = 0; x < tiledLayer.getWidth(); x++) {
		//	for (int y = 0; y < tiledLayer.getHeight(); y++) {
				TiledMapTileLayer.Cell cell = tiledLayer.getCell(0, 0);
				TiledMapActor actor = new TiledMapActor(this.mapa, tiledLayer,cell);
				actor.setBounds(220 +  tiledLayer.getTileWidth(),
						-240 +  tiledLayer.getTileHeight(),
						38,38);
				//addActor(actor);
				actor.setTransform(true);
			 
				Partida.gp.setRotation(45);
				Partida.gp.addActor(actor);
			 
				EventListener eventListener = new TiledMapClickListener(actor);
				actor.addListener(eventListener);
		//	}
		//}
	}

 

}
