package com.jogoTcc.entidade;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.maps.tiled.TiledMap;
import com.badlogic.gdx.maps.tiled.TiledMapTileLayer;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.scenes.scene2d.Group;
import com.sun.prism.image.ViewPort;

public class TiledMapActor extends Group {
	public TiledMap tiledMap;

	public TiledMapTileLayer tiledLayer;

	public TiledMapTileLayer.Cell cell;
	Texture texture;
	public TiledMapActor(TiledMap tiledMap, TiledMapTileLayer tiledLayer,
			TiledMapTileLayer.Cell cell) {
		super.setDebug(true);
		this.tiledMap = tiledMap;
		this.tiledLayer = tiledLayer;
		this.cell = cell;
		 texture = new Texture(Gdx.files.internal("img.png"));
		 
		
	}
		
	@Override
	public void draw(Batch batch, float parentAlpha) {
		// TODO Auto-generated method stub
		super.draw(batch, parentAlpha);
		Matrix4 isoTransform = new Matrix4();
		isoTransform.idt();

 
		 
		 batch.draw(texture, 120, 20); 
		 drawChildren(batch, parentAlpha);
		  
		super.draw(batch, parentAlpha);
	}
}
