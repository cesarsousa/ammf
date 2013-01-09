package br.com.ammf.utils;

import sun.org.mozilla.javascript.regexp.SubString;
import br.com.ammf.model.Notificacao;
import br.com.ammf.model.Pessoa;
import br.com.ammf.model.Texto;

public class HtmlMensagem {
	
	private static final String PATH = "./html_mensagem/";

	public static String getAssunto(Notificacao notificacao, Texto texto) {
		if(Notificacao.TEXTO_ATUALIZADO == notificacao)
			return getAssuntoTextoAtualizado().replace("?", texto.getTitulo());
		if(Notificacao.TEXTO_NOVO == notificacao)
			return getAssuntoTextoCadastrado().replace("?", texto.getTitulo());
		return "Site do Miguel";
	}
	
	public static String getAssuntoCadastroPessoa() {
		return "Site do Miguel - Confirmacao de Cadastro";
	}
	
	public static String getAssuntoTextoCadastrado() {
		return "Blog do Miguel - O texto ' ? ' foi adicionado";
	}
	
	public static String getAssuntoTextoAtualizado() {
		return "Blog do Miguel - O texto ' ? ' foi atualizado";
	}

	public static String getMensagemCadastroPessoa(Pessoa pessoa, String linkedin) {
		String mensagem = new LeitorDeArquivo().lerArquivo(PATH + "notificacao_adm_cadastra_pessoa.html");
		String linkRemoverEmail = Link.REMOVER_EMAIL.replace("uuid", pessoa.getUuid());
		return mensagem
				.replace("[NOMEDOCLIENTE]", pessoa.getNome()) 
				.replace("[WEBSITE]", Link.WEB_SITE)
				.replace("[LINKREMOVERNOTIFICACAO]", linkRemoverEmail)
				.replace("[LINKEDIN]", linkedin)
				.replace("[EMAIL]", pessoa.getEmail());
	}

	public static String getMensagemTextoAtualizado(Texto texto, String linkedin, Pessoa pessoa) {
		String mensagem = new LeitorDeArquivo().lerArquivo(PATH + "notificacao_adm_texto_atualizado.html");
		String linkRemoverEmail = Link.REMOVER_EMAIL.replace("uuid", pessoa.getUuid());
		String conteudo = texto.getConteudo();		
		String trechoTexto = conteudo.length() > 100 ? conteudo.substring(0, 100) : conteudo;
		
		// http://br.linkedin.com/pub/alcindo-miguel-martins-filho/2b/28b/364
		
		return mensagem
				.replace("[NOMEDOCLIENTE]", pessoa.getNome())
				.replace("[TITULOTEXTO]", texto.getTitulo())
				.replace("[TRECHOTEXTO]", trechoTexto)
				.replace("[LINKLERTEXTO]", Link.LER_TEXTO_INTEGRA.replace("uuid", texto.getUuid()))				
				.replace("[WEBSITE]", Link.WEB_SITE)
				.replace("[LINKREMOVERNOTIFICACAO]", linkRemoverEmail)
				.replace("[LINKEDIN]", linkedin)
				.replace("[EMAIL]", pessoa.getEmail());
	}

	

}
