package br.com.ammf.utils;

import br.com.ammf.model.Faq;
import br.com.ammf.model.Link;
import br.com.ammf.model.Livro;
import br.com.ammf.model.Local;
import br.com.ammf.model.Mensagem;
import br.com.ammf.model.Notificacao;
import br.com.ammf.model.Pessoa;
import br.com.ammf.model.Resenha;
import br.com.ammf.model.Texto;

public class HtmlMensagem {
	
	private static final String PATH = "./html_mensagem/";	
		
	public static String getAssuntoNotificarClienteRecebimentoCadastro() {
		return "Site Quiron - Recebimento de cadastro";
	}	
	
	public static String getMensagemNotificarClienteRecebimentoCadastro(Pessoa pessoa, String linkedin) {
		String mensagem = new LeitorDeArquivo().lerArquivo(PATH + "cadastro_notificar_cliente_recebimento_cadastroPeloCliente.html");
		
		return mensagem
				.replace("[NOMEDOCLIENTE]", pessoa.getNome()) 
				.replace("[WEBSITE_CONTATO]", LinksDoSite.WEB_SITE_CONTATO)
				.replace("[LINKEDIN]", linkedin);				
	}
	
	
	public static String getAssuntoNotificarAdmRecebimentoCadastro(String nomeDaPessoa) {
		return "Novo cadastro de cliente realizado: nome - " + nomeDaPessoa;
	}
		
	public static String getMensagemNotificarAdmRecebimentoCadastro(Pessoa pessoa) {
		String mensagem = new LeitorDeArquivo().lerArquivo(PATH + "cadastro_notificar_adm_recebimento_cadastroPeloCliente.html");
		
		return mensagem
			.replace("[NOME]", pessoa.getNome()) 
			.replace("[EMAIL]", pessoa.getEmail())
			.replace("[ID]", String.valueOf(pessoa.getId()))
			.replace("[WEBSITE_LOGIN_ADM]", LinksDoSite.WEB_SITE_LOGIN);
	}	
	
	public static String getAssuntoCadastroPessoaPeloAdm() {
		return "Site Quiron - Convite de Cadastramento";
	}
		
	public static String getMensagemCadastroPessoaPeloAdm(Pessoa pessoa, String linkedin) {
		String mensagem = new LeitorDeArquivo().lerArquivo(PATH + "cadastro_notificar_cliente_recebimento_cadastroPeloAdm.html");
		String linkRemoverEmail = LinksDoSite.REMOVER_EMAIL.replace("uuid", pessoa.getUuid());
		String linkTermosDeContrato = LinksDoSite.TERMOS_CONTRATO;
		String linkAtivarEmail = LinksDoSite.ATIVAR_EMAIL.replace("uuid", pessoa.getUuid());
		
		return mensagem
				.replace("[NOMEDOCLIENTE]", pessoa.getNome()) 
				.replace("[WEBSITE_CONTATO]", LinksDoSite.WEB_SITE_CONTATO)
				.replace("[LINKREMOVERNOTIFICACAO]", linkRemoverEmail)
				.replace("[LINKATIVARNOTIFICACAO]", linkAtivarEmail)
				.replace("[LINKTERMOSCONTRATO]", linkTermosDeContrato)				
				.replace("[LINKEDIN]", linkedin)
				.replace("[EMAIL]", pessoa.getEmail());
	}
		
	public static String getAssuntoSolicitacaoParaConfirmacaoCadastro() {
		return "Site Quiron - Confirmacao de Cadastramento";
	}	
	
	public static String getMensagemSolicitacaoParaConfirmacaoCadastro(Pessoa pessoa, String linkedin) {
		String mensagem = new LeitorDeArquivo().lerArquivo(PATH + "cadastro_solicitar_confirmacao_cadastroPeloCliente.html");
		String linkRemoverEmail = LinksDoSite.REMOVER_EMAIL.replace("uuid", pessoa.getUuid());
		String linkAtivarEmail = LinksDoSite.ATIVAR_EMAIL.replace("uuid", pessoa.getUuid());
		String linkTermosDeContrato = LinksDoSite.TERMOS_CONTRATO;
		
		return mensagem
				.replace("[NOMEDOCLIENTE]", pessoa.getNome()) 
				.replace("[WEBSITE_CONTATO]", LinksDoSite.WEB_SITE_CONTATO)
				.replace("[LINKTERMOSCONTRATO]", linkTermosDeContrato)
				.replace("[LINKREMOVERNOTIFICACAO]", linkRemoverEmail)
				.replace("[LINKATIVARNOTIFICACAO]", linkAtivarEmail)
				.replace("[LINKEDIN]", linkedin)
				.replace("[EMAIL]", pessoa.getEmail());
	}	
	
	public static String getAssunto(Notificacao notificacao, Texto texto) {
		String local = Local.BLOG == texto.getLocal() ? "Blog" : "Site";
		if(Notificacao.TEXTO_ATUALIZADO.equals(notificacao))
			return getAssuntoTextoAtualizado(local).replace("?", texto.getTitulo());
		if(Notificacao.TEXTO_NOVO.equals(notificacao))
			return getAssuntoTextoCadastrado(local).replace("?", texto.getTitulo());
		return "Site Quiron";
	}
	
	private static String getAssuntoTextoCadastrado(String local) {
		return local + " Quiron - O texto ' ? ' foi adicionado";
	}	
	private static String getAssuntoTextoAtualizado(String local) {
		return local + " Quiron - O texto ' ? ' foi atualizado";
	}

	public static String getMensagemNotificacaoDeTextoAtualizado(Texto texto, String linkedin, Pessoa pessoa) {
		String mensagem = new LeitorDeArquivo().lerArquivo(PATH + "texto_notificacar_clientes_texto_atualizado.html");
		String linkRemoverEmail = LinksDoSite.REMOVER_EMAIL.replace("uuid", pessoa.getUuid());
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
				.replace("[WEBSITE_CONTATO]", LinksDoSite.WEB_SITE_CONTATO)
				.replace("[LINKREMOVERNOTIFICACAO]", linkRemoverEmail)
				.replace("[LINKEDIN]", linkedin)
				.replace("[EMAIL]", pessoa.getEmail());
	}
	
	public static String getMensagemNotificacaoDeTextoAdicionado(Texto texto, String linkedin, Pessoa pessoa) {
		String mensagem = new LeitorDeArquivo().lerArquivo(PATH + "texto_notificacar_clientes_texto_adicionado.html");
		String linkRemoverEmail = LinksDoSite.REMOVER_EMAIL.replace("uuid", pessoa.getUuid());
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
				.replace("[WEBSITE_CONTATO]", LinksDoSite.WEB_SITE_CONTATO)
				.replace("[LINKREMOVERNOTIFICACAO]", linkRemoverEmail)
				.replace("[LINKEDIN]", linkedin)
				.replace("[EMAIL]", pessoa.getEmail());
	}
	
	private static String getLinkLerTexto(Texto texto) {
		if(Local.INDEX == texto.getLocal()){
			return LinksDoSite.WEB_SITE;
		}else if(Local.QUIRON == texto.getLocal()){
			return LinksDoSite.TEXTO_QUIRON;
		}else if(Local.BLOG == texto.getLocal()){
			return LinksDoSite.TEXTO_BLOG.replace("uuid", texto.getUuid());
		}else{
			return LinksDoSite.TEXTOS_PRINCIPAIS + texto.getLocal().toString().toLowerCase();
		}
	}	
	
	public static String getAssuntoEsclarecimentoCadastro() {
		return "Site Quiron - Esclarecimeno sobre cadastro de email no site";
	}

	public static String getMensagemEsclarecimentoCadastro(Pessoa pessoa, String linkedin) {
		String mensagem = new LeitorDeArquivo().lerArquivo(PATH + "cadastro_notificar_cliente_esclarecimento_sobre_cadastro.html");
		String linkRemoverEmail = LinksDoSite.REMOVER_EMAIL.replace("uuid", pessoa.getUuid());
		String linkTermosDeContrato = LinksDoSite.TERMOS_CONTRATO;
		String linkSiteContato = LinksDoSite.WEB_SITE_CONTATO;
			
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
			.replace("[WEBSITE_CONTATO]", LinksDoSite.WEB_SITE_CONTATO)
			.replace("[LINKEDIN]", linkedin);
	}	
	
	public static String getAssunto(Notificacao notificacao, Resenha resenha) {
		if(Notificacao.RESENHA_NOVA.equals(notificacao))
			return "Site Quiron - Nova resenha ' ? ' foi adicionada".replace("?", resenha.getTitulo());
		if(Notificacao.RESENHA_ATUALIZADA.equals(notificacao))
			return "Site Quiron - A resenha ' ? ' foi atualizada".replace("?", resenha.getTitulo());
		return "Site Quiron";
	}	

	public static String getMensagemNotificacaoDeResenhaAdicionada(Resenha resenha, String linkedin, Pessoa pessoa) {
		String mensagem = new LeitorDeArquivo().lerArquivo(PATH + "resenha_notificar_clientes.html");
		
		return mensagem
				.replace("[INICIORESENHA]", "Adicionei uma")
				.replace("[NOMEDOCLIENTE]", pessoa.getNome())
				.replace("[CATEGORIARESENHA]", resenha.getCategoria().getDescricao())
				.replace("[TITULORESENHA]", resenha.getTitulo())
				.replace("[LINKLERRESENHA]", getLinkLerResenha(resenha.getUuid()))				
				.replace("[WEBSITE_CONTATO]", LinksDoSite.WEB_SITE_CONTATO)
				.replace("[LINKREMOVERNOTIFICACAO]", LinksDoSite.REMOVER_EMAIL.replace("uuid", pessoa.getUuid()))
				.replace("[LINKEDIN]", linkedin)
				.replace("[EMAIL]", pessoa.getEmail());
	}

	

	public static String getMensagemNotificacaoDeResenhaAtualizada(Resenha resenha, String linkedin, Pessoa pessoa) {
		String mensagem = new LeitorDeArquivo().lerArquivo(PATH + "resenha_notificar_clientes.html");
		
		return mensagem
				.replace("[INICIORESENHA]", "Fiz uma atualiza&ccedil;&atilde;o na")
				.replace("[NOMEDOCLIENTE]", pessoa.getNome())
				.replace("[CATEGORIARESENHA]", resenha.getCategoria().getDescricao())
				.replace("[TITULORESENHA]", resenha.getTitulo())
				.replace("[LINKLERRESENHA]", getLinkLerResenha(resenha.getUuid()))				
				.replace("[WEBSITE_CONTATO]", LinksDoSite.WEB_SITE_CONTATO)
				.replace("[LINKREMOVERNOTIFICACAO]", LinksDoSite.REMOVER_EMAIL.replace("uuid", pessoa.getUuid()))
				.replace("[LINKEDIN]", linkedin)
				.replace("[EMAIL]", pessoa.getEmail());
	}
	
	private static String getLinkLerResenha(String uuid) {
		return LinksDoSite.LER_RESENHA_INTEGRA.replace("uuid", uuid);
	}

	public static String getAssunto(Notificacao notificacao, Livro livro) {
		if(Notificacao.LIVRO_NOVO.equals(notificacao))
			return "Site Quiron - Loja Virtual. - '?' , Novo livro adicionado".replace("?", livro.getTitulo());
		if(Notificacao.LIVRO_ATUALIZADO.equals(notificacao))
			return "Site Quiron - Loja Virtual - O livro ' ? ' foi atualizado".replace("?", livro.getTitulo());
		return "Site Quiron - Loja Virtual";
	}

	public static String getMensagemNotificacaoDeLivroAdicionado(Livro livro, String linkedin, Pessoa pessoa) {
		String mensagem = new LeitorDeArquivo().lerArquivo(PATH + "livro_notificar_clientes.html");
		
		return mensagem
				.replace("[INICIOLIVRO]", "Disponibilizei um novo")
				.replace("[NOMEDOCLIENTE]", pessoa.getNome())
				.replace("[AUTORLIVRO]", livro.getAutor())
				.replace("[TITULOLIVRO]", livro.getTitulo())
				.replace("[SUBTITULOLIVRO]", livro.getSubtitulo())				
				.replace("[LINKLERLIVRO]", getLinkLerLivro(livro.getUuid()))				
				.replace("[WEBSITE_CONTATO]", LinksDoSite.WEB_SITE_CONTATO)
				.replace("[LINKREMOVERNOTIFICACAO]", LinksDoSite.REMOVER_EMAIL.replace("uuid", pessoa.getUuid()))
				.replace("[LINKEDIN]", linkedin)
				.replace("[EMAIL]", pessoa.getEmail());
	}

	public static String getMensagemNotificacaoDeLivroAtualizado(Livro livro, String linkedin, Pessoa pessoa) {
		String mensagem = new LeitorDeArquivo().lerArquivo(PATH + "livro_notificar_clientes.html");
		
		return mensagem
				.replace("[INICIOLIVRO]", "Atualizei algumas informa&ccedil;&otilde;es do")
				.replace("[NOMEDOCLIENTE]", pessoa.getNome())
				.replace("[AUTORLIVRO]", livro.getAutor())
				.replace("[TITULOLIVRO]", livro.getTitulo())
				.replace("[SUBTITULOLIVRO]", livro.getSubtitulo())				
				.replace("[LINKLERLIVRO]", getLinkLerLivro(livro.getUuid()))				
				.replace("[WEBSITE_CONTATO]", LinksDoSite.WEB_SITE_CONTATO)
				.replace("[LINKREMOVERNOTIFICACAO]", LinksDoSite.REMOVER_EMAIL.replace("uuid", pessoa.getUuid()))
				.replace("[LINKEDIN]", linkedin)
				.replace("[EMAIL]", pessoa.getEmail());
	}
	
	private static String getLinkLerLivro(String uuid) {
		return LinksDoSite.LER_LIVRO_INTEGRA.replace("uuid", uuid);
	}

	public static String getAssuntoLink() {
		return "Site Quiron - Novo link adicionado";
	}

	public static String getMensagemNotificacaoDeLink(Link link, String linkedin, Pessoa pessoa) {
		String mensagem = new LeitorDeArquivo().lerArquivo(PATH + "link_notificar_clientes.html");
		
		return mensagem
				.replace("[NOMEDOCLIENTE]", pessoa.getNome())
				.replace("[DESCRICAOLINK]", link.getDescricao())
				.replace("[LINKLERLINKS]", LinksDoSite.LER_LINKS_UTEIS)				
				.replace("[WEBSITE_CONTATO]", LinksDoSite.WEB_SITE_CONTATO)
				.replace("[LINKREMOVERNOTIFICACAO]", LinksDoSite.REMOVER_EMAIL.replace("uuid", pessoa.getUuid()))
				.replace("[LINKEDIN]", linkedin)
				.replace("[EMAIL]", pessoa.getEmail());
	}

	public static String getAssuntoNovoFaqParaAdmin(String nomeDoCliente) {
		return "Nova pergunta postada no FAQ do site: nome do cliente - " + nomeDoCliente;
	}

	public static String getMensagemNotificacaoDeFaqParaAdmin(Faq faq, String linkedin) {
		String mensagem = new LeitorDeArquivo().lerArquivo(PATH + "faq_notificar_adm_recebimento_nova_pergunta.html");
		
		String visibilidade;
		if(faq.isPublica()){
			visibilidade = "<span style=\"color: green;\">publica</span>";
		}else{
			visibilidade = "<span style=\"color: red;\">particular</span>";
		}
		
		return mensagem
				.replace("[ID]", String.valueOf(faq.getId()))
				.replace("[NOME]", faq.getNome())
				.replace("[EMAIL]", faq.getEmail())				
				.replace("[POSTAGEM]", faq.getDataFormatada())
				.replace("[PERGUNTA]", faq.getPergunta())
				.replace("[VISIBILIDADEFAQ]", visibilidade)
				.replace("[WEBSITE_LOGIN_ADM]", LinksDoSite.WEB_SITE_LOGIN);		
	}

	public static String getAssuntoRespostaFaqParaCliente() {
		return "Site Quiron FAQ - Sua Pergunta foi respondida";
	}

	public static String getMensagemRespostaFaqParaCliente(Faq faq, String linkedin) {
		String mensagem = new LeitorDeArquivo().lerArquivo(PATH + "faq_notificar_resposta_cliente.html");
		
		String resposta;
		String visibilidade;
		String linkLerFaq;
		if(faq.isPublica()){
			resposta = "Ao cadastrar sua pergunta voc&ecirc; optou deix&aacute;-la como p&uacute;blica. Utilize o link abaixo para acessar o FAQ so site e ler sua resposta.";
			visibilidade = "<span style=\"color: green;\">publica</span>";
			linkLerFaq = LinksDoSite.WEB_SITE_FAQ_CLIENTE_RESPOSTA.replace("uuid", faq.getUuid());			
		}else{
			resposta = faq.getResposta();
			visibilidade = "<span style=\"color: red;\">particular</span>";
			linkLerFaq = LinksDoSite.WEB_SITE_FAQ_CLIENTE;
		}
		
		return mensagem
				.replace("[NOMEDOCLIENTE]", faq.getNome())
				.replace("[DATAFAQ]", faq.getDataFormatada())
				.replace("[PERGUNTAFAQ]", faq.getPergunta())				
				.replace("[RESPOSTAFAQFAQ]", resposta)
				.replace("[VISIBILIDADEFAQ]", visibilidade)
				.replace("[WEBSITE_CONTATO]", LinksDoSite.WEB_SITE_CONTATO)
				.replace("[EMAIL]", faq.getEmail())	
				.replace("[LINKEDIN]", linkedin)				
				.replace("[LINKFAQ]", linkLerFaq);		
	}
}
