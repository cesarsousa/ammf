package br.com.ammf.controller;

import org.apache.log4j.Logger;

import br.com.ammf.model.SessaoCliente;
import br.com.ammf.service.IndexService;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class IndexController {
	
	Logger logger = Logger.getLogger(IndexController.class);
	
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
		try {
			sessaoCliente = indexService.atualizar(sessaoCliente);
			indexService.atualizarNews(result);			
		} catch (Exception e) {
			redirecionarParaPgErro(e);
		}
	}	
	
	@Get("/site")
	public void site(){
		// acesso pelo cliente atraves do link de email
		result.include("msgIndex", "Bem Vindo! Sempre que for efetuada uma altera&ccedil;&atilde;o por aqui voc&ecirc; ser&aacute; notificado por email");
		result.redirectTo(this).index();
	}
	
	@Get("/quiron")
	public void quiron(){
		try {
			sessaoCliente = indexService.atualizar(sessaoCliente);
		} catch (Exception e) {
			redirecionarParaPgErro(e);
		}
	}
	
	@Get("/index/psicologia")
	public void psicologia(){
		try {
			sessaoCliente = indexService.atualizar(sessaoCliente);
		} catch (Exception e) {
			redirecionarParaPgErro(e);
		}
	}
	
	@Get("/index/educacao")
	public void educacao(){
		try {
			sessaoCliente = indexService.atualizar(sessaoCliente);
		} catch (Exception e) {
			redirecionarParaPgErro(e);
		}
	}
	
	@Get("/index/cultura")
	public void cultura(){
		try {
			sessaoCliente = indexService.atualizar(sessaoCliente);
		} catch (Exception e) {
			redirecionarParaPgErro(e);
		}
	}
	
	@Get("/index/artesorientais")
	public void artesOrientais(){
		try {
			sessaoCliente = indexService.atualizar(sessaoCliente);
		} catch (Exception e) {
			redirecionarParaPgErro(e);
		}
	}
	
	@Get("/index/terapeuta")
	public void terapeuta(){
		try {
			sessaoCliente = indexService.atualizar(sessaoCliente);
		} catch (Exception e) {
			redirecionarParaPgErro(e);
		}
	}
	
	@Get("/termosDeContrato")
	public void termosDeContrato(){}
	
	private void redirecionarParaPgErro(Exception e) {		
		result.redirectTo(this).erro();
	}
	
	public void erro(){}
	
	
}
