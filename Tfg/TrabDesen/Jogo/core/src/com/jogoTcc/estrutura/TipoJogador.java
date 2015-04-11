package com.jogoTcc.estrutura;

public enum TipoJogador {

	HUMANO(1), COMPUTADOR(2);

	private final int valor;

	TipoJogador(int valorOpcao) {
		valor = valorOpcao;
	}

	public int getValor() {
		return valor;
	}
}
