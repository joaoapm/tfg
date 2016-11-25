package com.j01.principal;

import com.badlogic.gdx.Game;
import com.j01.telas.TelaJogo;

public class Principal extends Game {

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
