package br.com.ammf.utils;

public class LinksDoSite {	
		
	public LinksDoSite(String email){
		if(email.endsWith("@gmail.com")){
			DOMINIO = "http://localhost:8080/ammf";
		}else{
			DOMINIO = "http://www.alcindomiguel.br.com";
		}
		
		WEB_SITE = DOMINIO;

		REMOVER_EMAIL = DOMINIO + "/pessoa/removerAssinaturaEmail/uuid";

		LER_TEXTO_INTEGRA = DOMINIO + "/blog/cliente/lertexto/uuid";
		
		LER_RESENHA_INTEGRA = DOMINIO + "/resenha/cliente/lertexto/uuid";
		
		LER_LIVRO_INTEGRA = DOMINIO + "/loja/cliente/verlivro/uuid";
		
		LER_LINKS_UTEIS = DOMINIO + "/link/cliente";

		WEB_SITE_LOGIN = DOMINIO + "/login";
		
		WEB_SITE_CONTATO = DOMINIO + "/cliente/contato";

		ATIVAR_EMAIL = DOMINIO + "/pessoa/ativar/email/uuid";

		TERMOS_CONTRATO = DOMINIO + "/termosDeContrato";

		TEXTO_QUIRON = DOMINIO + "/quiron";

		TEXTO_BLOG = DOMINIO + "/blog/cliente/lertexto/uuid";	

		TEXTOS_PRINCIPAIS = DOMINIO + "/index/";

		WEB_SITE_FAQ_CLIENTE = DOMINIO + "/cliente/faq";
		
		WEB_SITE_FAQ_CLIENTE_RESPOSTA = DOMINIO + "/cliente/faq/uuid";
	}
	
	public String DOMINIO;
	
	public String WEB_SITE;

	public String REMOVER_EMAIL;

	public String LER_TEXTO_INTEGRA;
	
	public String LER_RESENHA_INTEGRA;
	
	public String LER_LIVRO_INTEGRA;
	
	public String LER_LINKS_UTEIS;

	public String WEB_SITE_LOGIN;
	
	public String WEB_SITE_CONTATO;

	public String ATIVAR_EMAIL;

	public String TERMOS_CONTRATO;

	public String TEXTO_QUIRON;

	public String TEXTO_BLOG;	

	public String TEXTOS_PRINCIPAIS;

	public String WEB_SITE_FAQ_CLIENTE;
	
	public String WEB_SITE_FAQ_CLIENTE_RESPOSTA;

}
