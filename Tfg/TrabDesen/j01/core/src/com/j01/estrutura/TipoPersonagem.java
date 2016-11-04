package com.j01.estrutura;

public enum TipoPersonagem {

	HUMANO(0, "Humano", "personagens/humano/humano.atlas"), MONSTRO(1, "Monstro", "personagens/monstro/monstro.atlas");

	private final int valor;
	private final String rotulo;
	private final String arquivoAtlas;

	TipoPersonagem(int valorOpcao, String rotulo, String arquivoAtlas) {
		this.valor = valorOpcao;
		this.rotulo = rotulo;
		this.arquivoAtlas = arquivoAtlas;
	}

	public int getValor() {
		return valor;
	}

	public String getArquivoAtlas() {
		return this.arquivoAtlas;
	}

	public String getRotulo() {
		return rotulo;
	}

	public static TipoPersonagem getEnum(int valor) {
		for (TipoPersonagem item : TipoPersonagem.values()) {
			if (item.valor == valor) {
				return item;
			}
		}

		return null;
	}
}
