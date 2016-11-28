package com.j01.helper;

import com.badlogic.gdx.math.Vector2;

public class PropriedadeHelper {

	public static int JANELA_WIDTH = 350;
	public static int JANELA_HEIGHT = 350;

	public static float VELOCIDADE_ANIMACAO = 1 / 10f;

	public static int POSICAO_INICIAL_CAM_X = 1690;
	public static int POSICAO_INICIAL_CAM_Y = 50;
	public static int POSICAO_INICIAL_CAM_Z = 0;

	public static float ZOOM_INCIAL_CAM = 0.27f;

	public static Vector2 MATRIZ_CASA_SEL[] = { new Vector2(-1, -1), new Vector2(-1, 0), new Vector2(-1, 1),
			                                    new Vector2(0, -1),  new Vector2(0, 0),  new Vector2(0, 1), 
			                                    new Vector2(1, -1),  new Vector2(1, 0),	 new Vector2(1, 1) };
	
	public static float TEMPO_MOVIMENTO_PERSO = 1.0f;

}
