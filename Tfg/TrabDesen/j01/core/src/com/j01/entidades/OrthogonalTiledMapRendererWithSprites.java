package com.j01.entidades;

import java.util.ArrayList;
import java.util.List;

import com.badlogic.gdx.maps.MapLayer;
import com.badlogic.gdx.maps.MapObject;
import com.badlogic.gdx.maps.tiled.TiledMap;
import com.badlogic.gdx.maps.tiled.TiledMapTileLayer;
import com.badlogic.gdx.maps.tiled.renderers.IsometricTiledMapRenderer;

public class OrthogonalTiledMapRendererWithSprites extends IsometricTiledMapRenderer {

	public List<Entidade> sprites;
	private int drawSpritesAfterLayer = 1;

	public OrthogonalTiledMapRendererWithSprites(TiledMap map) {
		super(map);
		sprites = new ArrayList<Entidade>();
	}

	public void addSprite(Personagem sprite) {
		sprites.add(sprite);
	}

	@Override
	public void render() {
		beginRender();
		int currentLayer = 0;
		for (MapLayer layer : map.getLayers()) {
			if (layer.isVisible()) {
				if (layer instanceof TiledMapTileLayer) {
				 	//renderTileLayer((TiledMapTileLayer) layer);
					currentLayer++;
					//if (currentLayer == drawSpritesAfterLayer) {
						 for (Entidade sprite : sprites)
							 sprite.render(this.getBatch());
					//}
				} else {
					for (MapObject object : layer.getObjects()) {
						renderObject(object);
					}
				}
			}
		}
		endRender();
	}
}