package br.com.ammf.controller;

import java.util.List;

import br.com.ammf.exception.EmailException;
import br.com.ammf.interceptor.Restrito;
import br.com.ammf.model.Link;
import br.com.ammf.model.Notificacao;
import br.com.ammf.repository.LinkRepository;
import br.com.ammf.service.EmailService;
import br.com.ammf.service.ValidacaoService;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class LinkController {
	
	private Result result;
	private LinkRepository linkRepository;
	private ValidacaoService validacaoService;
	private EmailService emailService;
	
	public LinkController(
			Result result,
			LinkRepository linkRepository,
			ValidacaoService validacaoService,
			EmailService emailService){
		this.result = result;
		this.linkRepository = linkRepository;
		this.validacaoService = validacaoService;
		this.emailService = emailService;
	}
	
	@Restrito
	@Get("/menu/link")
	public void linkAdmin(){
		List<Link> links = linkRepository.listar();
		result.include("links", links);		
	}
	
	@Restrito
	@Post("/link/novo")
	public void adicionarNovoLink(Link link){
		try {
			boolean validado = validacaoService.cadastrarLink(link, result);		
			
			if(validado){
				linkRepository.cadastrar(link);			
				emailService.notificarLinkParaPessoas(Notificacao.LINK_NOVO, link);
				result.include("linkMensagemSucesso", "O link cadastrado com sucesso");
			}
			
			result.forwardTo(this).linkAdmin();
		}  catch (EmailException emailException){
			emailException.printStackTrace();
			result.include("linkMensagemErro", "N&atilde;o foi poss&iacute;vel notificar clientes por email referente ao cadastramento do link.<br/>Mensagem de Erro: " + emailException.getMensagem() + ".");
			result.forwardTo(this).linkAdmin();
		}
	}
	
	@Restrito
	@Get("/link/remover/{uuid}")
	public void removerLink(String uuid){			
		linkRepository.remover(uuid);			
		result.include("linkMensagemSucesso", "O link foi removido com sucesso");
		result.include("flagListagemLink", true);
		result.redirectTo(this).linkAdmin();
		
	}
	
	@Get("/link/cliente")
	public void linkCliente(){
		List<Link> links = linkRepository.listar();
		result.include("links", links);
	}

}
