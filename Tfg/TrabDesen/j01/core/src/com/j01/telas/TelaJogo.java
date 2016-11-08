package com.j01.telas;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.InputMultiplexer;
import com.badlogic.gdx.Screen;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.OrthographicCamera;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;
import com.badlogic.gdx.graphics.glutils.ShapeRenderer;
import com.badlogic.gdx.graphics.glutils.ShapeRenderer.ShapeType;
import com.badlogic.gdx.math.Vector3;
import com.j01.entidades.Mapa;
import com.j01.entidades.Partida;
import com.j01.entidades.Personagem;
import com.j01.estrutura.TipoPersonagem;
import com.j01.helper.PropriedadeHelper;

public class TelaJogo implements Screen {

	private OrthographicCamera camera;
	private SpriteBatch batch;

	private Mapa mapa;
	private Personagem perso1;
	private ShapeRenderer shapeRenderer;

	@Override
	public void show() {

		batch = new SpriteBatch();
		shapeRenderer = new ShapeRenderer();

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
		mapa = new Mapa(camera, (InputMultiplexer) Gdx.input.getInputProcessor(), partida);

		// cria personagem
		perso1 = new Personagem(TipoPersonagem.MONSTRO, new Vector3(300, 300, 0),
				(InputMultiplexer) Gdx.input.getInputProcessor(), partida,false);
		mapa.pp = perso1;

	}

	@Override
	public void render(float delta) {
		Gdx.gl.glClearColor(0, 0, 0, 0);
		Gdx.gl.glClear(GL20.GL_COLOR_BUFFER_BIT);
		mapa.getRenderer().setView(camera);

		// renderiza mapa
		mapa.getRenderer().render();

		// renderiza personganes:
		// imagens
		batch.begin();
		perso1.render(batch);
		batch.end();

		// shapes
		shapeRenderer.setAutoShapeType(true);
		shapeRenderer.begin();
		perso1.renderShape(shapeRenderer);
		shapeRenderer.end();

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
