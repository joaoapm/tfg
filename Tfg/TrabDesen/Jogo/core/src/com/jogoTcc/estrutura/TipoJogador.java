package com.jogoTcc.estrutura;

public enum TipoJogador {

	HUMANO(1, "humano/humano.atlas"), COMPUTADOR(2, "monstro/monstro.atlas");

	private final int valor;
	private final String arquivoAtlas;

	TipoJogador(int valorOpcao, String arquivoAtlas) {
		this.valor = valorOpcao;
		this.arquivoAtlas = arquivoAtlas;
	}

	public int getValor() {
		return valor;
	}

	public String getArquivoAtlas(){
		return this.arquivoAtlas;
	}
}
