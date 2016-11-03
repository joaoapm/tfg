package com.j01;

import com.badlogic.gdx.Game;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;

public class Principal extends Game {
	SpriteBatch batch;
	Texture img;
	
	@Override
	public void create () {
setScreen(new Play());
	}

	@Override
	public void render () {
 super.render();
	}
	
	@Override
	public void dispose () {
	 super.dispose();
	}
}
