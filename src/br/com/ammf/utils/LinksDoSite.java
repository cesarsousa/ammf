package br.com.ammf.utils;

public class LinksDoSite {
	
	//private String DOMINIO = "http://localhost:8080/ammf";
	private String DOMINIO = "http://www.quiron.psc.br";	
		
	public LinksDoSite(String email){
		if(email.endsWith("@gmail.com")){
			DOMINIO = "http://localhost:8080/ammf";
		}else{
			DOMINIO = "http://www.quiron.psc.br";
		}
	}	
	
	public final String WEB_SITE = DOMINIO;

	public final String REMOVER_EMAIL = DOMINIO + "/pessoa/removerAssinaturaEmail/uuid";

	public final String LER_TEXTO_INTEGRA = DOMINIO + "/blog/cliente/lertexto/uuid";
	
	public final String LER_RESENHA_INTEGRA = DOMINIO + "/resenha/cliente/lertexto/uuid";
	
	public final String LER_LIVRO_INTEGRA = DOMINIO + "/loja/cliente/verlivro/uuid";
	
	public final String LER_LINKS_UTEIS = DOMINIO + "/link/cliente";

	public final String WEB_SITE_LOGIN = DOMINIO + "/login";
	
	public final String WEB_SITE_CONTATO = DOMINIO + "/cliente/contato";

	public final String ATIVAR_EMAIL = DOMINIO + "/pessoa/ativar/email/uuid";

	public final String TERMOS_CONTRATO = DOMINIO + "/termosDeContrato";

	public final String TEXTO_QUIRON = DOMINIO + "/quiron";

	public final String TEXTO_BLOG = DOMINIO + "/blog/cliente/lertexto/uuid";	

	public final String TEXTOS_PRINCIPAIS = DOMINIO + "/index/";

	public final String WEB_SITE_FAQ_CLIENTE = DOMINIO + "/cliente/faq";
	
	public final String WEB_SITE_FAQ_CLIENTE_RESPOSTA = DOMINIO + "/cliente/faq/uuid";

}
