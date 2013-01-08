package br.com.ammf.utils;

import br.com.ammf.model.Pessoa;

public class HtmlMensagem {
	
	private static final String PATH = "./html_mensagem/";

	public static String getAssuntoCadastroPessoa() {
		return "Site do Miguel - Confirmacao de Cadastro";
	}
	
	public static String getAssuntoTextoCadastrado() {
		return "Blog do Miguel - O texto ' ? ' foi adicionado";
	}
	
	public static String getAssuntoTextoAtualizado() {
		return "Blog do Miguel - O texto ' ? ' foi atualizado";
	}

	public static String getMensagemCadastroPessoa(Pessoa pessoa) {
		String mensagem = new LeitorDeArquivo().lerArquivo(PATH + "notificacao_adm_cadastra_pessoa.html");
		String linkRemoverEmail = Link.REMOVER_EMAIL.replace("uuid", pessoa.getUuid());
		return mensagem
				.replace("[NOMEDOCLIENTE]", pessoa.getNome()) 
				.replace("[WEBSITE]", Link.WEB_SITE)
				.replace("[LINKREMOVERNOTIFICACAO]", linkRemoverEmail)
				.replace("[EMAIL]", pessoa.getEmail());
	}

}
