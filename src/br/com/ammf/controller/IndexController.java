package br.com.ammf.controller;

import br.com.ammf.model.SessaoCliente;
import br.com.ammf.service.IndexService;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class IndexController {
	
	private IndexService indexService;
	private SessaoCliente sessaoCliente;
	private Result result;
		
	public IndexController(
			IndexService indexService,
			SessaoCliente sessaoCliente,
			Result result) {
		this.indexService = indexService;
		this.sessaoCliente = sessaoCliente;
		this.result = result;
	}
	
	@Path("/")
	public void index(){
		// acesso tradicional pelo navegador
		sessaoCliente = indexService.atualizar(sessaoCliente);
	}
	
	@Get("/site")
	public void site(){
		// acesso pelo cliente atraves do link de email
		result.include("msgIndex", "Bem Vindo! Sempre que for efetuada uma altera&ccedil;&atilde;o por aqui voc&ecirc; ser&aacute; notificado por email");
		result.redirectTo(this).index();
	}
	
	@Get("/quiron")
	public void quiron(){
		
	}
	
	@Get("/index/psicologia")
	public void psicologia(){
		sessaoCliente = indexService.atualizar(sessaoCliente);
	}
	
	@Get("/index/educacao")
	public void educacao(){
		sessaoCliente = indexService.atualizar(sessaoCliente);
	}
	
	@Get("/index/cultura")
	public void cultura(){
		sessaoCliente = indexService.atualizar(sessaoCliente);
	}
	
	@Get("/index/artesorientais")
	public void artesOrientais(){
		sessaoCliente = indexService.atualizar(sessaoCliente);
	}
	
	@Get("/termosDeContrato")
	public void termosDeContrato(){}
}
