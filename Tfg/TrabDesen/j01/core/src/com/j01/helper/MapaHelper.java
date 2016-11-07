package com.j01.helper;

import com.badlogic.gdx.graphics.OrthographicCamera;
import com.badlogic.gdx.math.Vector3;

public class MapaHelper {

	public static Vector3 getPosicaoCasa(int x, int y, OrthographicCamera camera) {

		int cx = -1 * (int) telaParaIso(new Vector3(x, y, 0), 64, 32, camera).x;
		int cy = (int) telaParaIso(new Vector3(x, y, 0), 64, 32, camera).y;

		int xx = (cy - cx) * 64 / 2;
		int yy = (cy + cx) * 32 / 2;

		Vector3 pontoCasa = camera.project(new Vector3(xx, yy, 0));

		return new Vector3(pontoCasa.x, pontoCasa.y, 0);

	}

	private static Vector3 telaParaIso(Vector3 ponto, int tileWidth, int tileHeight, OrthographicCamera camera) {
		camera.unproject(ponto);
		ponto.x /= tileWidth;
		ponto.y = (ponto.y - tileHeight / 2) / tileHeight + ponto.x;
		ponto.x -= ponto.y - ponto.x;
		return ponto;
	}
}
