package com.jogoTcc.estrutura;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.Screen;
import com.badlogic.gdx.graphics.GL30;
import com.badlogic.gdx.math.Vector3;
import com.jogoTcc.entidade.Jogador;
import com.jogoTcc.entidade.Mapa;

public class Partida implements Screen {

	private Mapa mapa;
	private Jogador jogador;

	@Override
	public void show() {

		// inicializa mapa
		mapa = new Mapa("mapa/mapa.tmx");

		// inicializa jogador
		jogador = new Jogador("personagens/char.png");

	}

	@Override
	public void render(float delta) {

		// limpa cena
		Gdx.gl30.glClearColor(0, 0, 0, 1);
		Gdx.gl30.glClear(GL30.GL_COLOR_BUFFER_BIT);
		
		// desenha mapa
		this.mapa.renderizarMapa();

		
		// inclui jogador
		this.mapa.getRenderizador().getBatch().begin();
		jogador.draw(this.mapa.getRenderizador().getBatch());
		this.mapa.getRenderizador().getBatch().end();

	}

	@Override
	public void resize(int width, int height) {
		mapa.getCamera().viewportHeight = height;
		mapa.getCamera().viewportWidth = width;

		mapa.getCamera().translate(((new Vector3(200, 0, 0))));

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
