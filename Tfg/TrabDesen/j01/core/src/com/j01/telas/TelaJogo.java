package com.j01.telas;

import java.util.ArrayList;
import java.util.List;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.InputMultiplexer;
import com.badlogic.gdx.Screen;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.OrthographicCamera;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;
import com.badlogic.gdx.graphics.glutils.ShapeRenderer;
import com.badlogic.gdx.math.Vector3;
import com.j01.entidades.Entidade;
import com.j01.entidades.Mapa;
import com.j01.entidades.Partida;
import com.j01.entidades.Personagem;
import com.j01.estrutura.TipoPersonagem;
import com.j01.helper.PropriedadeHelper;

public class TelaJogo implements Screen {

	private OrthographicCamera camera;
	private SpriteBatch batch;
	private ShapeRenderer shapeRenderer;
	private Mapa mapa;
	private Personagem perso1;
	private List<Entidade> listaEntidades = new ArrayList<Entidade>();

	@Override
	public void show() {

		batch = new SpriteBatch();

		// cria camera
		camera = new OrthographicCamera();
		camera.position.set(PropriedadeHelper.POSICAO_INICIAL_CAM_X, PropriedadeHelper.POSICAO_INICIAL_CAM_Y,
				PropriedadeHelper.POSICAO_INICIAL_CAM_Z);
		camera.zoom -= PropriedadeHelper.ZOOM_INCIAL_CAM;

		// processador de eventos
		Gdx.input.setInputProcessor(new InputMultiplexer());

		// partida
		Partida partida = new Partida();
		partida.setMapa(mapa);

		// cria mapa
		mapa = new Mapa(camera, (InputMultiplexer) Gdx.input.getInputProcessor(), partida, 0);

		// cria personagem
		perso1 = new Personagem(TipoPersonagem.MONSTRO, new Vector3(380, 380, 0),
				(InputMultiplexer) Gdx.input.getInputProcessor(), partida, false, 1);

		mapa.pp = perso1;

		listaEntidades.add(perso1);
		listaEntidades.add(mapa);

		this.shapeRenderer = new ShapeRenderer();

	}

	@Override
	public void render(float delta) {
		Gdx.gl.glClearColor(0, 0, 0, 0);
		Gdx.gl.glClear(GL20.GL_COLOR_BUFFER_BIT);
		mapa.getRenderer().setView(camera);

		// renderiza mapa
		mapa.getRenderer().render();

		// renderiza entidades:
		// shapes
		shapeRenderer.setAutoShapeType(true);
		shapeRenderer.begin();
		for (Entidade ent : listaEntidades)
			ent.renderShape(shapeRenderer);
		shapeRenderer.end();
		
		// imagens
		batch.begin();
		for (Entidade ent : listaEntidades)
			ent.render(batch);
		batch.end();



	}

	@Override
	public void resize(int width, int height) {
		camera.viewportWidth = width;
		camera.viewportHeight = height;
		camera.update();

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
