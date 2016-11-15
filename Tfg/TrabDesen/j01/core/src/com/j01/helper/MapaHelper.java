package com.j01.helper;

import com.badlogic.gdx.graphics.OrthographicCamera;
import com.badlogic.gdx.maps.tiled.TiledMapTileLayer;
import com.badlogic.gdx.maps.tiled.TiledMapTileLayer.Cell;
import com.badlogic.gdx.math.Vector3;
import com.j01.entidades.Casa;
import com.j01.entidades.Mapa;

public class MapaHelper {

	public static Mapa MAPA;

	public static Casa getPosicaoCasa(Casa casa) {

		int cx = -1 * (int) telaParaIso(new Vector3(casa.getPosicaoTela().x, casa.getPosicaoTela().y, 0), 64, 32,
				MAPA.getCamera()).x;
		int cy = (int) telaParaIso(new Vector3(casa.getPosicaoTela().x, casa.getPosicaoTela().y, 0), 64, 32,
				MAPA.getCamera()).y;

		int xx = (cy - cx) * 64 / 2;
		int yy = (cy + cx) * 32 / 2;

		Vector3 pontoCasa = MAPA.getCamera().project(new Vector3(xx, yy, 0));

		return new Casa(new Vector3(-1 * cx, cy, 0), new Vector3(pontoCasa.x, pontoCasa.y, 0));

	}

	public static Casa getPosicaoTelaCasa(Casa casa) {
		casa.getPosicaoMapa().x *= -1;
		int xx = (int) (casa.getPosicaoMapa().y - casa.getPosicaoMapa().x) * 64 / 2;
		int yy = (int) (casa.getPosicaoMapa().y + casa.getPosicaoMapa().x) * 32 / 2;

		Vector3 pontoCasa = MAPA.getCamera().project(new Vector3(xx, yy, 0));

		return new Casa(new Vector3(-1 * casa.getPosicaoMapa().x, casa.getPosicaoMapa().y, 0),
				new Vector3(pontoCasa.x, pontoCasa.y, 0));

	}

	public static void mostraRange(Casa casa) {
		TiledMapTileLayer ll = (TiledMapTileLayer) MAPA.getMap().getLayers().get(3);
		ll.getCell((int) casa.getPosicaoMapa().x, (int) casa.getPosicaoMapa().y).setTile(MAPA.getTileSel());
		ll.getCell((int) casa.getPosicaoMapa().x + 1, (int) casa.getPosicaoMapa().y + 1).setTile(MAPA.getTileSel());

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

	private static Vector3 telaParaIso(Vector3 ponto, int tileWidth, int tileHeight, OrthographicCamera camera) {
		camera.unproject(ponto);
		ponto.x /= tileWidth;
		ponto.y = (ponto.y - tileHeight / 2) / tileHeight + ponto.x;
		ponto.x -= ponto.y - ponto.x;
		return ponto;
	}

}
