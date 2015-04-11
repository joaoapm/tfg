package com.jogoTcc.estrutura;

import java.util.ArrayList;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.Screen;
import com.badlogic.gdx.graphics.GL30;
import com.badlogic.gdx.math.Vector3;
import com.jogoTcc.entidade.Entidade;
import com.jogoTcc.entidade.Jogador;
import com.jogoTcc.entidade.Mapa;

public class Partida implements Screen {

	private Mapa mapa;
	private Jogador jogador;
	public static ArrayList<Entidade> entidades = new ArrayList<Entidade>();

	@Override
	public void show() {

		// inicializa mapa
		mapa = new Mapa("mapa/mapa.tmx");

		// inicializa jogador humano com 5 bonecos
		jogador = new Jogador(TipoJogador.HUMANO, 5);

	}

	@Override
	public void render(float delta) {

		// limpa cena
		Gdx.gl30.glClearColor(0, 0, 0, 1);
		Gdx.gl30.glClear(GL30.GL_COLOR_BUFFER_BIT);

		// desenha mapa
		this.mapa.renderizarMapa();

		// atualiza entidades do jogo
		for (Entidade entidadeRenderiza : this.entidades) {
			entidadeRenderiza.draw();
		}

	}

	@Override
	public void resize(int width, int height) {
		mapa.getCamera().viewportHeight = height;
		mapa.getCamera().viewportWidth = width;
		// mapa.getCamera().zoom = 0.750f;
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
