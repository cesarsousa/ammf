package br.com.ammf.utils;

public class Link {
	
	private static String DOMINIO = "http://localhost:8080/ammf";
	
	public static final String WEB_SITE = DOMINIO;

	public static final String REMOVER_EMAIL = DOMINIO + "/pessoa/remover/email/uuid";

	public static final String LER_TEXTO_INTEGRA = DOMINIO + "/blog/cliente/lertexto/uuid";

	public static final String WEB_SITE_LOGIN = DOMINIO + "/login";

	public static final String ATIVAR_EMAIL = DOMINIO + "/pessoa/ativar/email/uuid";

	public static final String TERMOS_CONTRATO = DOMINIO + "/termosDeContrato";;

}
