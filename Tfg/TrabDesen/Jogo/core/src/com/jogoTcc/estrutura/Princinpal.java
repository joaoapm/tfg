package com.jogoTcc.estrutura;

import com.badlogic.gdx.ApplicationAdapter;
import com.badlogic.gdx.Game;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;
import com.jogoTcc.entidade.Mapa;

public class Princinpal extends Game {

	@Override
	public void create() {
		setScreen(new Mapa());
		// TODO Auto-generated method stub
		
	}
 
}
