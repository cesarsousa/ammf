package br.com.ammf.utils;

import br.com.ammf.model.Local;
import br.com.ammf.model.Mensagem;
import br.com.ammf.model.Notificacao;
import br.com.ammf.model.Pessoa;
import br.com.ammf.model.Resenha;
import br.com.ammf.model.Texto;

public class HtmlMensagem {
	
	// http://br.linkedin.com/pub/alcindo-miguel-martins-filho/2b/28b/364
	
	private static final String PATH = "./html_mensagem/";	
	
	/**
	 * @return o assunto de um email a ser enviado para um cliente quando este realiza a solicitacao de cadastro pelo site.
	 */
	public static String getAssuntoNotificarClienteRecebimentoCadastro() {
		return "Site Quiron - Recebimento de cadastro";
	}
	
	/**
	 * @param pessoa a nova pessoa cadastrada.
	 * @param linkedin linked in do administrador.
	 * @return a mensagem de um email a ser enviado para um cliente quando este realiza a solicitacao de cadastro pelo site.
	 */
	public static String getMensagemNotificarClienteRecebimentoCadastro(Pessoa pessoa, String linkedin) {
		String mensagem = new LeitorDeArquivo().lerArquivo(PATH + "cadastro_notificar_cliente_recebimento_cadastroPeloCliente.html");
		
		return mensagem
				.replace("[NOMEDOCLIENTE]", pessoa.getNome()) 
				.replace("[WEBSITE_CONTATO]", Link.WEB_SITE_CONTATO)
				.replace("[LINKEDIN]", linkedin);				
	}
	
	/**
	 * 
	 * @param nomeDaPessoa cadastrada no site.
	 * @return o assunto de um email a ser enviado para o administrador informando quando uma pessoa realiza a solicitacao de cadastro pelo site.
	 */
	public static String getAssuntoNotificarAdmRecebimentoCadastro(String nomeDaPessoa) {
		return "Novo cadastro de cliente realizado: nome - " + nomeDaPessoa;
	}
	
	/**
	 * 
	 * @param pessoa nova pessoa cadastrada no site
	 * @return a assunto de um email a ser enviado para o administrador informando quando uma pessoa realiza a solicitacao de cadastro pelo site.
	 */
	public static String getMensagemNotificarAdmRecebimentoCadastro(Pessoa pessoa) {
		String mensagem = new LeitorDeArquivo().lerArquivo(PATH + "cadastro_notificar_adm_recebimento_cadastroPeloCliente.html");
		
		return mensagem
			.replace("[NOME]", pessoa.getNome()) 
			.replace("[EMAIL]", pessoa.getEmail())
			.replace("[ID]", String.valueOf(pessoa.getId()))
			.replace("[WEBSITE_LOGIN_ADM]", Link.WEB_SITE_LOGIN);
	}
	
	/**
	 * 
	 * @return o assunto de um email a ser enviado para um cliente quando o administrador realiza o seu cadastro no site.
	 */
	public static String getAssuntoCadastroPessoaPeloAdm() {
		return "Site Quiron - Convite de Cadastramento";
	}
	
	/**
	 * 
	 * @param pessoa nova pessoa cadastrada no site.
	 * @param linkedin linked in do administrador.
	 * @return a mensagem de um email a ser enviado para um cliente quando o administrador realiza o seu cadastro no site.
	 */
	public static String getMensagemCadastroPessoaPeloAdm(Pessoa pessoa, String linkedin) {
		String mensagem = new LeitorDeArquivo().lerArquivo(PATH + "cadastro_notificar_cliente_recebimento_cadastroPeloAdm.html");
		String linkRemoverEmail = Link.REMOVER_EMAIL.replace("uuid", pessoa.getUuid());
		String linkTermosDeContrato = Link.TERMOS_CONTRATO;
		String linkAtivarEmail = Link.ATIVAR_EMAIL.replace("uuid", pessoa.getUuid());
		
		return mensagem
				.replace("[NOMEDOCLIENTE]", pessoa.getNome()) 
				.replace("[WEBSITE_CONTATO]", Link.WEB_SITE_CONTATO)
				.replace("[LINKREMOVERNOTIFICACAO]", linkRemoverEmail)
				.replace("[LINKATIVARNOTIFICACAO]", linkAtivarEmail)
				.replace("[LINKTERMOSCONTRATO]", linkTermosDeContrato)				
				.replace("[LINKEDIN]", linkedin)
				.replace("[EMAIL]", pessoa.getEmail());
	}
	
	/**
	 * @return o assunto de um email a ser enviado para um cliente solicitando a confirmacao do cadastro no site.
	 */
	public static String getAssuntoSolicitacaoParaConfirmacaoCadastro() {
		return "Site Quiron - Confirmacao de Cadastramento";
	}
	
	/**
	 * @return a mensagem de um email a ser enviado para um cliente solicitando a confirmacao do cadastro no site.
	 */
	public static String getMensagemSolicitacaoParaConfirmacaoCadastro(Pessoa pessoa, String linkedin) {
		String mensagem = new LeitorDeArquivo().lerArquivo(PATH + "cadastro_solicitar_confirmacao_cadastroPeloCliente.html");
		String linkRemoverEmail = Link.REMOVER_EMAIL.replace("uuid", pessoa.getUuid());
		String linkAtivarEmail = Link.ATIVAR_EMAIL.replace("uuid", pessoa.getUuid());
		String linkTermosDeContrato = Link.TERMOS_CONTRATO;
		
		return mensagem
				.replace("[NOMEDOCLIENTE]", pessoa.getNome()) 
				.replace("[WEBSITE_CONTATO]", Link.WEB_SITE_CONTATO)
				.replace("[LINKTERMOSCONTRATO]", linkTermosDeContrato)
				.replace("[LINKREMOVERNOTIFICACAO]", linkRemoverEmail)
				.replace("[LINKATIVARNOTIFICACAO]", linkAtivarEmail)
				.replace("[LINKEDIN]", linkedin)
				.replace("[EMAIL]", pessoa.getEmail());
	}
	
	/**
	 * 
	 * @param notificacao uma notificacao de atualizacao ou de criacao de texto.
	 * @param texto o texto atualizado ou criado.
	 * @return o assunto para o email de notificacao para as pessoas cadastradas no site.
	 */
	public static String getAssunto(Notificacao notificacao, Texto texto) {
		if(Notificacao.TEXTO_ATUALIZADO.equals(notificacao))
			return getAssuntoTextoAtualizado().replace("?", texto.getTitulo());
		if(Notificacao.TEXTO_NOVO.equals(notificacao))
			return getAssuntoTextoCadastrado().replace("?", texto.getTitulo());
		return "Site Quiron";
	}
	
	public static String getAssuntoTextoCadastrado() {
		return "Blog Quiron - O texto ' ? ' foi adicionado";
	}	
	public static String getAssuntoTextoAtualizado() {
		return "Blog Quiron - O texto ' ? ' foi atualizado";
	}

	/**
	 * @param texto o texto que foi atualizado
	 * @param linkedin linked in do administrador
	 * @param pessoa a pessoa a ser notificada
	 * @return a mensagem para o email de notificacao para as pessoas cadastradas no site.
	 */
	public static String getMensagemNotificacaoDeTextoAtualizado(Texto texto, String linkedin, Pessoa pessoa) {
		String mensagem = new LeitorDeArquivo().lerArquivo(PATH + "texto_notificacar_clientes_texto_atualizado.html");
		String linkRemoverEmail = Link.REMOVER_EMAIL.replace("uuid", pessoa.getUuid());
		String linkLerTexto = getLinkLerTexto(texto);
		String complemento = Local.BLOG == texto.getLocal() ? " na p&aacute;gina de BLOG do site Quiron" : "";
		String conteudo = texto.getConteudo();		
		String trechoTexto = conteudo.length() > 100 ? conteudo.substring(0, 100) : conteudo;		
		
		return mensagem
				.replace("[NOMEDOCLIENTE]", pessoa.getNome())
				.replace("[TITULOTEXTO]", texto.getTitulo())
				.replace("[COMPLEMENTO]", complemento)
				.replace("[TRECHOTEXTO]", trechoTexto)
				.replace("[LINKLERTEXTO]", linkLerTexto)				
				.replace("[WEBSITE_CONTATO]", Link.WEB_SITE_CONTATO)
				.replace("[LINKREMOVERNOTIFICACAO]", linkRemoverEmail)
				.replace("[LINKEDIN]", linkedin)
				.replace("[EMAIL]", pessoa.getEmail());
	}
	
	/**
	 * @param texto o texto que foi criado
	 * @param linkedin linked in do administrador
	 * @param pessoa a pessoa a ser notificada
	 * @return a mensagem para o email de notificacao para as pessoas cadastradas no site.
	 */
	public static String getMensagemNotificacaoDeTextoAdicionado(Texto texto, String linkedin, Pessoa pessoa) {
		String mensagem = new LeitorDeArquivo().lerArquivo(PATH + "texto_notificacar_clientes_texto_adicionado.html");
		String linkRemoverEmail = Link.REMOVER_EMAIL.replace("uuid", pessoa.getUuid());
		String linkLerTexto = getLinkLerTexto(texto);		
		String conteudo = texto.getConteudo();
		String complemento = Local.BLOG == texto.getLocal() ? " na p&aacute;gina de BLOG do site Quiron" : "";
		String trechoTexto = conteudo.length() > 100 ? conteudo.substring(0, 100) : conteudo;		
		
		return mensagem
				.replace("[NOMEDOCLIENTE]", pessoa.getNome())
				.replace("[TITULOTEXTO]", texto.getTitulo())
				.replace("[COMPLEMENTO]", complemento)
				.replace("[TRECHOTEXTO]", trechoTexto)
				.replace("[LINKLERTEXTO]", linkLerTexto)				
				.replace("[WEBSITE_CONTATO]", Link.WEB_SITE_CONTATO)
				.replace("[LINKREMOVERNOTIFICACAO]", linkRemoverEmail)
				.replace("[LINKEDIN]", linkedin)
				.replace("[EMAIL]", pessoa.getEmail());
	}
	
	private static String getLinkLerTexto(Texto texto) {
		if(Local.INDEX == texto.getLocal()){
			return Link.WEB_SITE;
		}else if(Local.QUIRON == texto.getLocal()){
			return Link.TEXTO_QUIRON;
		}else if(Local.BLOG == texto.getLocal()){
			return Link.TEXTO_BLOG.replace("uuid", texto.getUuid());
		}else{
			return Link.TEXTOS_PRINCIPAIS + texto.getLocal().toString().toLowerCase();
		}
	}	
	
	public static String getAssuntoEsclarecimentoCadastro() {
		return "Site Quiron - Esclarecimeno sobre cadastro de email no site";
	}

	public static String getMensagemEsclarecimentoCadastro(Pessoa pessoa, String linkedin) {
		String mensagem = new LeitorDeArquivo().lerArquivo(PATH + "cadastro_notificar_cliente_esclarecimento_sobre_cadastro.html");
		String linkRemoverEmail = Link.REMOVER_EMAIL.replace("uuid", pessoa.getUuid());
		String linkTermosDeContrato = Link.TERMOS_CONTRATO;
		String linkSiteContato = Link.WEB_SITE_CONTATO;
			
		return mensagem
				.replace("[NOMEDOCLIENTE]", pessoa.getNome())
				.replace("[NOME]", pessoa.getNome())
				.replace("[EMAIL]", pessoa.getEmail())
				.replace("[DATA]", pessoa.getDataFormatada())
				.replace("[LINKTERMOSCONTRATO]", linkTermosDeContrato)
				.replace("[LINKREMOVERNOTIFICACAO]", linkRemoverEmail)
				.replace("[WEBSITE_CONTATO]", linkSiteContato)
				.replace("[LINKEDIN]", linkedin);
	}

	public static String getAssuntoNotificarAdmNovoContato(String nomeDaPessoa) {
		return "Novo contato de cliente de " + nomeDaPessoa + " recebido";
	}

	public static String getMensagemNotificarAdmNovoContato(Mensagem mensagem) {
		String strMensagem = new LeitorDeArquivo().lerArquivo(PATH + "contato_notificar_adm_recebimento_novo_contato.html");
			
		return strMensagem
				.replace("[NOME]", mensagem.getNome())
				.replace("[EMAIL]", mensagem.getEmail())
				.replace("[MENSAGEM]", mensagem.getConteudo());
	}

	public static String getAssuntoNotificarClienteNovoContato() {
		return "Site Quiron - Contato recebido com sucesso";
	}

	public static String getMensagemNotificarClienteNovoContato(Mensagem mensagem, String linkedin) {
		String strMensagem = new LeitorDeArquivo().lerArquivo(PATH + "contato_notificar_cliente_recebimento_novo_contato.html");		
		
		return strMensagem
			.replace("[NOMEDOCLIENTE]", mensagem.getNome())		
			.replace("[MENSAGEM]", mensagem.getConteudo())
			.replace("[WEBSITE_CONTATO]", Link.WEB_SITE_CONTATO)
			.replace("[LINKEDIN]", linkedin);
	}	
	
	public static String getAssunto(Notificacao notificacao, Resenha resenha) {
		if(Notificacao.RESENHA_NOVA.equals(notificacao))
			return getAssuntoResenhaNova().replace("?", resenha.getTitulo());
		if(Notificacao.RESENHA_ATUALIZADA.equals(notificacao))
			return getAssuntoResenhaAtualizada().replace("?", resenha.getTitulo());
		return "Site Quiron";
	}
	
	public static String getAssuntoResenhaNova() {
		return "Blog Quiron - A resenha ' ? ' foi adicionada";
	}	
	public static String getAssuntoResenhaAtualizada() {
		return "Blog Quiron - A resenha ' ? ' foi atualizada";
	}

	public static String getMensagemNotificacaoDeResenhaAdicionada(Resenha resenha, String linkedin, Pessoa pessoa) {
		// TODO Auto-generated method stub
		return "nova resenha adicionada";
	}

	public static String getMensagemNotificacaoDeResenhaAtualizada(Resenha resenha, String linkedin, Pessoa pessoa) {
		// TODO Auto-generated method stub
		return "resenha atualizada";
	}
}
