package com.jogoTcc.estrutura;

import com.badlogic.gdx.Game;
import com.jogoTcc.entidade.Mapa;

public class Princinpal extends Game {

	@Override
	public void create() {
		setScreen(new Mapa());
	}

}
