package com.j01.helper;

import com.badlogic.gdx.graphics.OrthographicCamera;
import com.badlogic.gdx.maps.tiled.TiledMapTileLayer;
import com.badlogic.gdx.maps.tiled.TiledMapTileLayer.Cell;
import com.badlogic.gdx.math.Vector3;
import com.j01.entidades.Casa;
import com.j01.entidades.Mapa;

public class MapaHelper {

	public static Mapa MAPA;

	public static Casa getPosicaoCasa(int x, int y) {

		int cx = -1 * (int) telaParaIso(new Vector3(x, y, 0), 64, 32, MAPA.getCamera()).x;
		int cy = (int) telaParaIso(new Vector3(x, y, 0), 64, 32, MAPA.getCamera()).y;

		int xx = (cy - cx) * 64 / 2;
		int yy = (cy + cx) * 32 / 2;

		Vector3 pontoCasa = MAPA.getCamera().project(new Vector3(xx, yy, 0));

		return new Casa(-1 * cx, cy, new Vector3(pontoCasa.x, pontoCasa.y, 0));

	}

	public static Vector3 getPosicaoTelaCasa(int cx, int cy) {
		cx *= -1;
		int xx = (cy - cx) * 64 / 2;
		int yy = (cy + cx) * 32 / 2;

		Vector3 pontoCasa = MAPA.getCamera().project(new Vector3(xx, yy, 0));

		return new Vector3(pontoCasa.x, pontoCasa.y, 0);

	}

	private static Vector3 telaParaIso(Vector3 ponto, int tileWidth, int tileHeight, OrthographicCamera camera) {
		camera.unproject(ponto);
		ponto.x /= tileWidth;
		ponto.y = (ponto.y - tileHeight / 2) / tileHeight + ponto.x;
		ponto.x -= ponto.y - ponto.x;
		return ponto;
	}

	public static void mostraRange(int cx, int cy) {
		TiledMapTileLayer ll = (TiledMapTileLayer) MAPA.getMap().getLayers().get(3);
		ll.getCell(cx, cy).setTile(MAPA.getTileSel());

	}

	public static void escondeRange() {
		TiledMapTileLayer layer = (TiledMapTileLayer) MAPA.getMap().getLayers().get(3);
		for (int i = 0; i < 50; i++)
			for (int j = 0; j < 50; j++)
				if (layer.getCell(i, j) != null) {
					Cell c = layer.getCell(i, j);
					c.setTile(null);
				}

	}

}
