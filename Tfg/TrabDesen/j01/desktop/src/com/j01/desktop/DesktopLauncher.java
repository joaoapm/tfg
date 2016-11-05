package com.j01.desktop;

import com.badlogic.gdx.backends.lwjgl.LwjglApplication;
import com.badlogic.gdx.backends.lwjgl.LwjglApplicationConfiguration;
import com.j01.helper.PropriedadeHelper;
import com.j01.principal.Principal;

public class DesktopLauncher {
	public static void main (String[] arg) {
		LwjglApplicationConfiguration config = new LwjglApplicationConfiguration();
		config.height = PropriedadeHelper.JANELA_HEIGHT;
		config.width= PropriedadeHelper.JANELA_WIDTH;
		config.resizable = false;
		new LwjglApplication(new Principal(), config);
	}
}
