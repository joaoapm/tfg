package com.jogoTcc.desktop;

import com.badlogic.gdx.backends.lwjgl.LwjglApplication;
import com.badlogic.gdx.backends.lwjgl.LwjglApplicationConfiguration;
import com.jogoTcc.estrutura.Princinpal;

public class DesktopLauncher {
	public static void main (String[] arg) {
		LwjglApplicationConfiguration config = new LwjglApplicationConfiguration();
		new LwjglApplication(new Princinpal(), config);
		
		config.title = "Jogo TCC Unisinos";
		config.height = 450;
		config.width = 850;
	}
}
