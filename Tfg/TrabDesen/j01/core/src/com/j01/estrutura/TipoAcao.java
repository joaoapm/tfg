package com.j01.estrutura;

public enum TipoAcao {

	ATAQUE(0, "Ataque"), MOVIMENTO(1, "Movimento");

	private final int valor;
	private final String rotulo;

	TipoAcao(int valorOpcao, String rotulo) {
		this.valor = valorOpcao;
		this.rotulo = rotulo;
	}

	public int getValor() {
		return valor;
	}

	public String getRotulo() {
		return rotulo;
	}

	public static TipoAcao getEnum(int valor) {
		for (TipoAcao item : TipoAcao.values()) {
			if (item.valor == valor) {
				return item;
			}
		}

		return null;
	}
}
