package br.com.ammf.utils;

import br.com.ammf.model.Local;
import br.com.ammf.model.Notificacao;
import br.com.ammf.model.Pessoa;
import br.com.ammf.model.Texto;

public class HtmlMensagem {
	
	// http://br.linkedin.com/pub/alcindo-miguel-martins-filho/2b/28b/364
	
	private static final String PATH = "./html_mensagem/";

	public static String getAssunto(Notificacao notificacao, Texto texto) {
		if(Notificacao.TEXTO_ATUALIZADO.equals(notificacao))
			return getAssuntoTextoAtualizado().replace("?", texto.getTitulo());
		if(Notificacao.TEXTO_NOVO.equals(notificacao))
			return getAssuntoTextoCadastrado().replace("?", texto.getTitulo());
		return "Site do Miguel";
	}
	
	public static String getAssuntoCadastroPessoaPeloCliente() {
		return "Site do Miguel - Recebimento de cadastro";
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
		String linkLerTexto = getLinkLerTexto(texto);
		
		String conteudo = texto.getConteudo();		
		String trechoTexto = conteudo.length() > 100 ? conteudo.substring(0, 100) : conteudo;		
		return mensagem
				.replace("[NOMEDOCLIENTE]", pessoa.getNome())
				.replace("[TITULOTEXTO]", texto.getTitulo())
				.replace("[TRECHOTEXTO]", trechoTexto)
				.replace("[LINKLERTEXTO]", linkLerTexto)				
				.replace("[WEBSITE]", Link.WEB_SITE)
				.replace("[LINKREMOVERNOTIFICACAO]", linkRemoverEmail)
				.replace("[LINKEDIN]", linkedin)
				.replace("[EMAIL]", pessoa.getEmail());
	}

	private static String getLinkLerTexto(Texto texto) {
		if(Local.INDEX == texto.getLocal())
			return Link.WEB_SITE;
		else
			return Link.WEB_SITE + "/index/" + texto.getLocal().toString().toLowerCase();
	}

	public static String getMensagemCadastroPessoaPeloCliente(Pessoa pessoa, String linkedin) {
		String mensagem = new LeitorDeArquivo().lerArquivo(PATH + "notificacao_adm_cadastra_pessoa_pelo_cliente.html");
		return mensagem
				.replace("[NOMEDOCLIENTE]", pessoa.getNome()) 
				.replace("[WEBSITE]", Link.WEB_SITE)
				.replace("[LINKEDIN]", linkedin);				
	}
}
