package br.com.ammf.utils;

import br.com.ammf.model.Pessoa;

public class HtmlMensagem {
	
	private static final String PATH = "./html_mensagem/";

	public static String getAssuntoCadastroPessoa() {
		return "Site do Miguel - Confirmacao de Cadastro.";
	}

	public static String getMensagemCadastroPessoa(Pessoa pessoa) {
		String mensagem = new LeitorDeArquivo().lerArquivo(PATH + "notificacao_adm_cadastra_pessoa.html"); 
		return mensagem
				.replace("[NOMEDOCLIENTE]", pessoa.getNome()) 
				.replace("[WEBSITE]", Link.WEB_SITE)
				.replace("[LINKREMOVERNOTIFICACAO]", Link.WEB_SITE);
	}

}
