package com.j01.principal;

import com.badlogic.gdx.Game;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;
import com.j01.telas.TelaJogo;

public class Principal extends Game {
	SpriteBatch batch;
	Texture img;

	@Override
	public void create() {
		 setScreen(new TelaJogo());
	}

	@Override
	public void render() {
		super.render();
	}

	@Override
	public void dispose() {
		super.dispose();
	}
}
