package br.com.ammf.utils;

/**
 * Ambiente em que a aplicacao esta rodando: dsv (localhost) ou prd (deploy em producao).
 * Definido por -Dammf.ambiente=dsv|prd ou pela variavel AMMF_AMBIENTE.
 */
public final class Ambiente {

	/** System property (-Dammf.ambiente=dsv) que define o ambiente. */
	public static final String PROPRIEDADE_AMBIENTE = "ammf.ambiente";
	/** Variavel de ambiente alternativa a system property. */
	public static final String VARIAVEL_AMBIENTE = "AMMF_AMBIENTE";

	public static final String DSV = "dsv";
	public static final String PRD = "prd";

	/** Sem configuracao explicita assume producao, para o deploy nao depender de ajuste no servidor. */
	public static final String AMBIENTE_PADRAO = PRD;

	private Ambiente() {}

	public static String getAtual() {
		String ambiente = System.getProperty(PROPRIEDADE_AMBIENTE);
		if (ambiente == null || ambiente.trim().isEmpty()) {
			ambiente = System.getenv(VARIAVEL_AMBIENTE);
		}
		if (ambiente == null || ambiente.trim().isEmpty()) {
			ambiente = AMBIENTE_PADRAO;
		}
		return ambiente.trim().toLowerCase();
	}

	public static boolean isDsv() {
		return DSV.equals(getAtual());
	}

}
