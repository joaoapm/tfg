package com.jogoTcc.estrutura;

import java.util.ArrayList;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.Screen;
import com.badlogic.gdx.graphics.GL30;
import com.badlogic.gdx.scenes.scene2d.Group;
import com.jogoTcc.entidade.Entidade;
import com.jogoTcc.entidade.Jogador;
import com.jogoTcc.entidade.Mapa;
import com.sun.prism.image.ViewPort;

public class Partida implements Screen {

	private Mapa mapa;
	private Jogador jogador;
	public static ArrayList<Entidade> entidades = new ArrayList<Entidade>();

	@Override
	public void show() {
		
		// inicializa mapa
		mapa = new Mapa("mapa/mapa.tmx");
		Gdx.input.setInputProcessor(mapa);
		
		 ViewPort vv = new ViewPort(0, 0, 100, 100);
  
	}

	public static Group gp = new Group();
	
	@Override
	public void render(float delta) {

		// limpa cena
		Gdx.gl30.glClearColor(0, 0, 0, 1);
		Gdx.gl30.glClear(GL30.GL_COLOR_BUFFER_BIT);
		//mapa.renderizarMapa();
		Mapa.renderizador.render();
		mapa.addActor(this.gp);
		// atualiza palco
		 mapa.act(Gdx.graphics.getDeltaTime());
		 mapa.draw();
		// desenha mapa
		// this.mapa.renderizarMapa();

	}

	@Override
	public void resize(int width, int height) {
		
		
		
		 mapa.getCamera().viewportHeight = height;
		 mapa.getCamera().viewportWidth = width;
		// mapa.getCamera().zoom = 0.750f;
		//mapa.getCamera().translate(((new Vector3(200, 20, 0))));
	mapa.getCamera().update();
	}

	@Override
	public void pause() {
	}

	@Override
	public void resume() {
	}

	@Override
	public void hide() {
	}

	@Override
	public void dispose() {
	}

}
