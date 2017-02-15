package br.com.ammf.utils;

import br.com.ammf.model.Comentario;
import br.com.ammf.model.Constelacao;
import br.com.ammf.model.Depoimento;
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
	
	private LinksDoSite linksDoSite;
	
	public HtmlMensagem(boolean administrativo){
		linksDoSite = new LinksDoSite(administrativo);
	}
	
	private static final String PATH = "./html_mensagem/";	
		
	public String getAssuntoNotificarClienteRecebimentoCadastro() {
		return "Site AlcindoMiguel.com - Recebimento de cadastro";
	}	
	
	public String getMensagemNotificarClienteRecebimentoCadastro(Pessoa pessoa, String linkedin) {
		String mensagem = new LeitorDeArquivo().lerArquivo(PATH + "cadastro_notificar_cliente_recebimento_cadastroPeloCliente.html");
		
		return mensagem
				.replace("[NOMEDOCLIENTE]", pessoa.getNome()) 
				.replace("[WEBSITE_CONTATO]", linksDoSite.WEB_SITE_CONTATO)
				.replace("[LINKEDIN]", linkedin);				
	}
	
	
	public String getAssuntoNotificarAdmRecebimentoCadastro(String nomeDaPessoa) {
		return "Site AlcindoMiguel.com - Cadastro de cliente realizado: nome - " + nomeDaPessoa;
	}
		
	public String getMensagemNotificarAdmRecebimentoCadastro(Pessoa pessoa) {
		String mensagem = new LeitorDeArquivo().lerArquivo(PATH + "cadastro_notificar_adm_recebimento_cadastroPeloCliente.html");
		
		return mensagem
			.replace("[NOME]", pessoa.getNome()) 
			.replace("[EMAIL]", pessoa.getEmail())
			.replace("[ID]", String.valueOf(pessoa.getId()))
			.replace("[WEBSITE_LOGIN_ADM]", linksDoSite.WEB_SITE_LOGIN);
	}	
	
	public String getAssuntoCadastroPessoaPeloAdm() {
		return "Site AlcindoMiguel.com - Convite de Cadastramento";
	}
		
	public String getMensagemCadastroPessoaPeloAdm(Pessoa pessoa, String linkedin) {
		String mensagem = new LeitorDeArquivo().lerArquivo(PATH + "cadastro_notificar_cliente_recebimento_cadastroPeloAdm.html");
		String linkRemoverEmail = linksDoSite.REMOVER_EMAIL.replace("uuid", pessoa.getUuid());
		String linkTermosDeContrato = linksDoSite.TERMOS_CONTRATO;
		String linkAtivarEmail = linksDoSite.ATIVAR_EMAIL.replace("uuid", pessoa.getUuid());
		
		return mensagem
				.replace("[NOMEDOCLIENTE]", pessoa.getNome()) 
				.replace("[WEBSITE_CONTATO]", linksDoSite.WEB_SITE_CONTATO)
				.replace("[LINKREMOVERNOTIFICACAO]", linkRemoverEmail)
				.replace("[LINKATIVARNOTIFICACAO]", linkAtivarEmail)
				.replace("[LINKTERMOSCONTRATO]", linkTermosDeContrato)				
				.replace("[LINKEDIN]", linkedin)
				.replace("[EMAIL]", pessoa.getEmail());
	}
		
	public String getAssuntoSolicitacaoParaConfirmacaoCadastro() {
		return "Site AlcindoMiguel.com - Confirmacao de Cadastramento";
	}	
	
	public String getMensagemSolicitacaoParaConfirmacaoCadastro(Pessoa pessoa, String linkedin) {
		String mensagem = new LeitorDeArquivo().lerArquivo(PATH + "cadastro_solicitar_confirmacao_cadastroPeloCliente.html");
		String linkRemoverEmail = linksDoSite.REMOVER_EMAIL.replace("uuid", pessoa.getUuid());
		String linkAtivarEmail = linksDoSite.ATIVAR_EMAIL.replace("uuid", pessoa.getUuid());
		String linkTermosDeContrato = linksDoSite.TERMOS_CONTRATO;
		
		return mensagem
				.replace("[NOMEDOCLIENTE]", pessoa.getNome()) 
				.replace("[WEBSITE_CONTATO]", linksDoSite.WEB_SITE_CONTATO)
				.replace("[LINKTERMOSCONTRATO]", linkTermosDeContrato)
				.replace("[LINKREMOVERNOTIFICACAO]", linkRemoverEmail)
				.replace("[LINKATIVARNOTIFICACAO]", linkAtivarEmail)
				.replace("[LINKEDIN]", linkedin)
				.replace("[EMAIL]", pessoa.getEmail());
	}	
	
	public String getAssunto(Notificacao notificacao, Texto texto) {
		String local = Local.BLOG == texto.getLocal() ? "Blog" : "Site";
		if(Notificacao.TEXTO_ATUALIZADO.equals(notificacao))
			return getAssuntoTextoAtualizado(local).replace("?", texto.getTitulo() == null ? texto.getLocal().toString() : texto.getTitulo());
		if(Notificacao.TEXTO_NOVO.equals(notificacao))
			return getAssuntoTextoCadastrado(local).replace("?", texto.getTitulo() == null ? texto.getLocal().toString() : texto.getTitulo());
		return "Site AlcindoMiguel.com";
	}
	
	private String getAssuntoTextoCadastrado(String local) {
		return local + " AlcindoMiguel.com - O texto ' ? ' foi adicionado";
	}	
	private String getAssuntoTextoAtualizado(String local) {
		return local + " AlcindoMiguel.com - O texto ' ? ' foi atualizado";
	}

	public String getMensagemNotificacaoDeTextoAtualizado(Texto texto, String linkedin, Pessoa pessoa) {
		String mensagem = new LeitorDeArquivo().lerArquivo(PATH + "texto_notificacar_clientes_texto_atualizado.html");
		String linkRemoverEmail = linksDoSite.REMOVER_EMAIL.replace("uuid", pessoa.getUuid());
		String linkLerTexto = getLinkLerTexto(texto);
		String complemento = Local.BLOG == texto.getLocal() ? " na p&aacute;gina do BLOG do site" : "";
		String conteudo = texto.getConteudo();		
		String trechoTexto = conteudo.length() > 100 ? conteudo.substring(0, 100) : conteudo;		
		
		return mensagem
				.replace("[NOMEDOCLIENTE]", pessoa.getNome())
				.replace("[TITULOTEXTO]", texto.getTitulo() == null ? texto.getLocal().toString() : texto.getTitulo())
				.replace("[COMPLEMENTO]", complemento)
				.replace("[TRECHOTEXTO]", trechoTexto)
				.replace("[LINKLERTEXTO]", linkLerTexto)				
				.replace("[WEBSITE_CONTATO]", linksDoSite.WEB_SITE_CONTATO)
				.replace("[LINKREMOVERNOTIFICACAO]", linkRemoverEmail)
				.replace("[LINKEDIN]", linkedin)
				.replace("[EMAIL]", pessoa.getEmail());
	}
	
	public String getMensagemNotificacaoDeTextoAdicionado(Texto texto, String linkedin, Pessoa pessoa) {
		String mensagem = new LeitorDeArquivo().lerArquivo(PATH + "texto_notificacar_clientes_texto_adicionado.html");
		String linkRemoverEmail = linksDoSite.REMOVER_EMAIL.replace("uuid", pessoa.getUuid());
		String linkLerTexto = getLinkLerTexto(texto);		
		String conteudo = texto.getConteudo();
		String complemento = Local.BLOG == texto.getLocal() ? " na p&aacute;gina de BLOG do site" : "";
		String trechoTexto = conteudo.length() > 100 ? conteudo.substring(0, 100) : conteudo;		
		
		return mensagem
				.replace("[NOMEDOCLIENTE]", pessoa.getNome())
				.replace("[TITULOTEXTO]", texto.getTitulo())
				.replace("[COMPLEMENTO]", complemento)
				.replace("[TRECHOTEXTO]", trechoTexto)
				.replace("[LINKLERTEXTO]", linkLerTexto)				
				.replace("[WEBSITE_CONTATO]", linksDoSite.WEB_SITE_CONTATO)
				.replace("[LINKREMOVERNOTIFICACAO]", linkRemoverEmail)
				.replace("[LINKEDIN]", linkedin)
				.replace("[EMAIL]", pessoa.getEmail());
	}
	
	private String getLinkLerTexto(Texto texto) {
		if(Local.INDEX == texto.getLocal()){
			return linksDoSite.WEB_SITE;
		}else if(Local.QUIRON == texto.getLocal()){
			return linksDoSite.TEXTO_QUIRON;
		}else if(Local.BLOG == texto.getLocal()){
			return linksDoSite.TEXTO_BLOG.replace("uuid", texto.getUuid());
		}else{
			return linksDoSite.TEXTOS_PRINCIPAIS + texto.getLocal().toString().toLowerCase();
		}
	}	
	
	public String getAssuntoEsclarecimentoCadastro() {
		return "Site AlcindoMiguel.com - Esclarecimeno sobre cadastro de email no site";
	}

	public String getMensagemEsclarecimentoCadastro(Pessoa pessoa, String linkedin) {
		String mensagem = new LeitorDeArquivo().lerArquivo(PATH + "cadastro_notificar_cliente_esclarecimento_sobre_cadastro.html");
		String linkRemoverEmail = linksDoSite.REMOVER_EMAIL.replace("uuid", pessoa.getUuid());
		String linkTermosDeContrato = linksDoSite.TERMOS_CONTRATO;
		String linkSiteContato = linksDoSite.WEB_SITE_CONTATO;
			
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

	public String getAssuntoNotificarAdmNovoContato(String nomeDaPessoa) {
		return "Site AlcindoMiguel.com - Novo contato de cliente de " + nomeDaPessoa + " recebido";
	}

	public String getMensagemNotificarAdmNovoContato(Mensagem mensagem) {
		String strMensagem = new LeitorDeArquivo().lerArquivo(PATH + "contato_notificar_adm_recebimento_novo_contato.html");
			
		return strMensagem
				.replace("[NOME]", mensagem.getNome())
				.replace("[EMAIL]", mensagem.getEmail())
				.replace("[MENSAGEM]", mensagem.getConteudo());
	}

	public String getAssuntoNotificarClienteNovoContato() {
		return "Site AlcindoMiguel.com - Contato recebido com sucesso";
	}

	public String getMensagemNotificarClienteNovoContato(Mensagem mensagem, String linkedin) {
		String strMensagem = new LeitorDeArquivo().lerArquivo(PATH + "contato_notificar_cliente_recebimento_novo_contato.html");		
		
		return strMensagem
			.replace("[NOMEDOCLIENTE]", mensagem.getNome())		
			.replace("[MENSAGEM]", mensagem.getConteudo())
			.replace("[WEBSITE_CONTATO]", linksDoSite.WEB_SITE_CONTATO)
			.replace("[LINKEDIN]", linkedin);
	}	
	
	public String getAssunto(Notificacao notificacao, Resenha resenha) {
		if(Notificacao.RESENHA_NOVA.equals(notificacao))
			return "Site AlcindoMiguel.com - Nova resenha ' ? ' foi adicionada".replace("?", resenha.getTitulo());
		if(Notificacao.RESENHA_ATUALIZADA.equals(notificacao))
			return "Site AlcindoMiguel.com - A resenha ' ? ' foi atualizada".replace("?", resenha.getTitulo());
		return "Site AlcindoMiguel.com";
	}	

	public String getMensagemNotificacaoDeResenhaAdicionada(Resenha resenha, String linkedin, Pessoa pessoa) {
		String mensagem = new LeitorDeArquivo().lerArquivo(PATH + "resenha_notificar_clientes.html");
		
		return mensagem
				.replace("[INICIORESENHA]", "Adicionei uma")
				.replace("[NOMEDOCLIENTE]", pessoa.getNome())
				.replace("[CATEGORIARESENHA]", resenha.getCategoria().getDescricao())
				.replace("[TITULORESENHA]", resenha.getTitulo())
				.replace("[LINKLERRESENHA]", getLinkLerResenha(resenha.getUuid()))				
				.replace("[WEBSITE_CONTATO]", linksDoSite.WEB_SITE_CONTATO)
				.replace("[LINKREMOVERNOTIFICACAO]", linksDoSite.REMOVER_EMAIL.replace("uuid", pessoa.getUuid()))
				.replace("[LINKEDIN]", linkedin)
				.replace("[EMAIL]", pessoa.getEmail());
	}

	

	public String getMensagemNotificacaoDeResenhaAtualizada(Resenha resenha, String linkedin, Pessoa pessoa) {
		String mensagem = new LeitorDeArquivo().lerArquivo(PATH + "resenha_notificar_clientes.html");
		
		return mensagem
				.replace("[INICIORESENHA]", "Fiz uma atualiza&ccedil;&atilde;o na")
				.replace("[NOMEDOCLIENTE]", pessoa.getNome())
				.replace("[CATEGORIARESENHA]", resenha.getCategoria().getDescricao())
				.replace("[TITULORESENHA]", resenha.getTitulo())
				.replace("[LINKLERRESENHA]", getLinkLerResenha(resenha.getUuid()))				
				.replace("[WEBSITE_CONTATO]", linksDoSite.WEB_SITE_CONTATO)
				.replace("[LINKREMOVERNOTIFICACAO]", linksDoSite.REMOVER_EMAIL.replace("uuid", pessoa.getUuid()))
				.replace("[LINKEDIN]", linkedin)
				.replace("[EMAIL]", pessoa.getEmail());
	}
	
	private String getLinkLerResenha(String uuid) {
		return linksDoSite.LER_RESENHA_INTEGRA.replace("uuid", uuid);
	}

	public String getAssunto(Notificacao notificacao, Livro livro) {
		if(Notificacao.LIVRO_NOVO.equals(notificacao))
			return "Site AlcindoMiguel.com - Loja Virtual. - '?' , Novo livro adicionado".replace("?", livro.getTitulo());
		if(Notificacao.LIVRO_ATUALIZADO.equals(notificacao))
			return "Site AlcindoMiguel.com - Loja Virtual - O livro ' ? ' foi atualizado".replace("?", livro.getTitulo());
		return "Site AlcindoMiguel.com - Loja Virtual";
	}

	public String getMensagemNotificacaoDeLivroAdicionado(Livro livro, String linkedin, Pessoa pessoa) {
		String mensagem = new LeitorDeArquivo().lerArquivo(PATH + "livro_notificar_clientes.html");
		
		return mensagem
				.replace("[INICIOLIVRO]", "Disponibilizei um novo")
				.replace("[NOMEDOCLIENTE]", pessoa.getNome())
				.replace("[AUTORLIVRO]", livro.getAutor())
				.replace("[TITULOLIVRO]", livro.getTitulo())
				.replace("[SUBTITULOLIVRO]", livro.getSubtitulo())				
				.replace("[LINKLERLIVRO]", getLinkLerLivro(livro.getUuid()))				
				.replace("[WEBSITE_CONTATO]", linksDoSite.WEB_SITE_CONTATO)
				.replace("[LINKREMOVERNOTIFICACAO]", linksDoSite.REMOVER_EMAIL.replace("uuid", pessoa.getUuid()))
				.replace("[LINKEDIN]", linkedin)
				.replace("[EMAIL]", pessoa.getEmail());
	}

	public String getMensagemNotificacaoDeLivroAtualizado(Livro livro, String linkedin, Pessoa pessoa) {
		String mensagem = new LeitorDeArquivo().lerArquivo(PATH + "livro_notificar_clientes.html");
		
		return mensagem
				.replace("[INICIOLIVRO]", "Atualizei algumas informa&ccedil;&otilde;es do")
				.replace("[NOMEDOCLIENTE]", pessoa.getNome())
				.replace("[AUTORLIVRO]", livro.getAutor())
				.replace("[TITULOLIVRO]", livro.getTitulo())
				.replace("[SUBTITULOLIVRO]", livro.getSubtitulo())				
				.replace("[LINKLERLIVRO]", getLinkLerLivro(livro.getUuid()))				
				.replace("[WEBSITE_CONTATO]", linksDoSite.WEB_SITE_CONTATO)
				.replace("[LINKREMOVERNOTIFICACAO]", linksDoSite.REMOVER_EMAIL.replace("uuid", pessoa.getUuid()))
				.replace("[LINKEDIN]", linkedin)
				.replace("[EMAIL]", pessoa.getEmail());
	}
	
	private String getLinkLerLivro(String uuid) {
		return linksDoSite.LER_LIVRO_INTEGRA.replace("uuid", uuid);
	}

	public String getAssuntoLink() {
		return "Site AlcindoMiguel.com - Novo link adicionado";
	}

	public String getMensagemNotificacaoDeLink(Link link, String linkedin, Pessoa pessoa) {
		String mensagem = new LeitorDeArquivo().lerArquivo(PATH + "link_notificar_clientes.html");
		
		return mensagem
				.replace("[NOMEDOCLIENTE]", pessoa.getNome())
				.replace("[DESCRICAOLINK]", link.getDescricao())
				.replace("[LINKLERLINKS]", linksDoSite.LER_LINKS_UTEIS)				
				.replace("[WEBSITE_CONTATO]", linksDoSite.WEB_SITE_CONTATO)
				.replace("[LINKREMOVERNOTIFICACAO]", linksDoSite.REMOVER_EMAIL.replace("uuid", pessoa.getUuid()))
				.replace("[LINKEDIN]", linkedin)
				.replace("[EMAIL]", pessoa.getEmail());
	}

	public String getAssuntoNovoFaqParaAdmin(String nomeDoCliente) {
		return "Site AlcindoMiguel.com - Nova pergunta postada no FAQ do site: nome do cliente - " + nomeDoCliente;
	}

	public String getMensagemNotificacaoDeFaqParaAdmin(Faq faq, String linkedin) {
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
				.replace("[WEBSITE_LOGIN_ADM]", linksDoSite.WEB_SITE_LOGIN);		
	}

	public String getAssuntoRespostaFaqParaCliente() {
		return "Site AlcindoMiguel.com - Sua Pergunta foi respondida";
	}

	public String getMensagemRespostaFaqParaCliente(Faq faq, String linkedin) {
		String mensagem = new LeitorDeArquivo().lerArquivo(PATH + "faq_notificar_resposta_cliente.html");
		
		String resposta;
		String visibilidade;
		String linkLerFaq;
		if(faq.isPublica()){
			resposta = "Ao cadastrar sua pergunta voc&ecirc; optou deix&aacute;-la como p&uacute;blica. Utilize o link abaixo para acessar o FAQ so site e ler sua resposta.";
			visibilidade = "<span style=\"color: green;\">publica</span>";
			linkLerFaq = linksDoSite.WEB_SITE_FAQ_CLIENTE_RESPOSTA.replace("uuid", faq.getUuid());			
		}else{
			resposta = faq.getResposta();
			visibilidade = "<span style=\"color: red;\">particular</span>";
			linkLerFaq = linksDoSite.WEB_SITE_FAQ_CLIENTE;
		}
		
		return mensagem
				.replace("[NOMEDOCLIENTE]", faq.getNome())
				.replace("[DATAFAQ]", faq.getDataFormatada())
				.replace("[PERGUNTAFAQ]", faq.getPergunta())				
				.replace("[RESPOSTAFAQFAQ]", resposta)
				.replace("[VISIBILIDADEFAQ]", visibilidade)
				.replace("[WEBSITE_CONTATO]", linksDoSite.WEB_SITE_CONTATO)
				.replace("[EMAIL]", faq.getEmail())	
				.replace("[LINKEDIN]", linkedin)				
				.replace("[LINKFAQ]", linkLerFaq);		
	}

	public String getAssuntoNotificarComentarioAdmin(String tituloTexto, Local local) {
		String strLocal = "";
		if(Local.BLOG == local) strLocal = "Blog";
		if(Local.RESENHA == local) strLocal = "Resenha";
		return "Site AlcindoMiguel.com " +  strLocal + " - Novo comentário sobre texto cadastrado";
	}

	public String getMensagemNotificarComentarioAdmin(String tituloTexto, Comentario comentario, Local local) {
		String mensagem = new LeitorDeArquivo().lerArquivo(PATH + "comentario_notificar_adm_recebimento_novo_comentario.html");
		String strLocal = "";
		String strLocal2 = "";
		if(Local.BLOG == local){
			strLocal = "no blog";
			strLocal2 = "ao texto";
		}
		if(Local.RESENHA == local){
			strLocal = "nas resenhas";
			strLocal2 = "&agrave; resenha";
		}
		
		
		return mensagem
				.replace("[LOCAL1]", strLocal)
				.replace("[LOCAL2]", strLocal2)
				.replace("[NOME]", comentario.getNome())
				.replace("[EMAIL]", comentario.getEmail())				
				.replace("[POSTAGEM]", comentario.getDataHora())
				.replace("[COMENTARIO]", comentario.getConteudo())
				.replace("[TITULOTEXTO]", tituloTexto)
				.replace("[WEBSITE_LOGIN_ADM]", linksDoSite.WEB_SITE_LOGIN);
	}
	
	public String getAssuntoNotificarDepoimentoAdmin() {
		return "Site AlcindoMiguel.com - Novo depoimento cadastrado";
	}

	public String getMensagemNotificarDepoimentoAdmin(Depoimento depoimento) {
		String mensagem = new LeitorDeArquivo().lerArquivo(PATH + "depoimento_notificar_adm_recebimento_novo_depoimento.html");
				
		return mensagem
				.replace("[NOME]", depoimento.getAutor())
				.replace("[EMAIL]", depoimento.getEmail())				
				.replace("[POSTAGEM]", depoimento.getDataFormatada())
				.replace("[DEPOIMENTO]", depoimento.getConteudo())
				.replace("[WEBSITE_LOGIN_ADM]", linksDoSite.WEB_SITE_LOGIN);
	}

	public String getAssuntoConstelacao(Constelacao constelacao) {
		return "Site AlcindoMiguel.com - Psicoterapia e Constelações - " + constelacao.getData().replace("<h2>", "").replace("</h2>", "");
	}

	public String getMensagemNotificacaoDe(Constelacao constelacao, String linkedin, Pessoa pessoa) {
		String mensagem = new LeitorDeArquivo().lerArquivo(PATH + "constelacao_notificar_pessoas.html");
		
		return mensagem
				.replace("[TEXTOINICIAL]", constelacao.getTextoInicial())
				.replace("[PAGAMENTO]", constelacao.getFormaPagamento())				
				.replace("[TEXTOFINAL]", constelacao.getTextoFinal())
				.replace("[DATA]", constelacao.getData())
				.replace("[LOCALIZACAO]", constelacao.getLocalizacao())
				.replace("[LINKMAPS]", constelacao.getLinkMapa())
				.replace("[INFORMACAO]", constelacao.getInformacao())
				.replace("[DADOSTERAPEUTA]", constelacao.getDadosPessoais())				
				.replace("[WEBSITE]", linksDoSite.WEB_SITE)
				.replace("[LINKREMOVERNOTIFICACAO]", linksDoSite.REMOVER_EMAIL.replace("uuid", pessoa.getUuid()))				
				.replace("[LINKEDIN]", linkedin);
	}
	
	public String getMensagemNotificacaoDe(Constelacao constelacao, String linkedin) {
		String mensagem = new LeitorDeArquivo().lerArquivo(PATH + "constelacao_notificar_pessoas.html");
		
		return mensagem
				.replace("[TEXTOINICIAL]", constelacao.getTextoInicial())
				.replace("[PAGAMENTO]", constelacao.getFormaPagamento())				
				.replace("[TEXTOFINAL]", constelacao.getTextoFinal())
				.replace("[DATA]", constelacao.getData())
				.replace("[LOCALIZACAO]", constelacao.getLocalizacao())
				.replace("[LINKMAPS]", constelacao.getLinkMapa())
				.replace("[INFORMACAO]", constelacao.getInformacao())
				.replace("[DADOSTERAPEUTA]", constelacao.getDadosPessoais())				
				.replace("[WEBSITE]", linksDoSite.WEB_SITE)
				.replace("[LINKREMOVERNOTIFICACAO]", "")				
				.replace("[LINKEDIN]", linkedin);
	}
}
