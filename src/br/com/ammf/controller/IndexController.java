package br.com.ammf.controller;

import org.apache.log4j.Logger;

import br.com.ammf.exception.EmailException;
import br.com.ammf.exception.ErroAplicacao;
import br.com.ammf.exception.Excecao;
import br.com.ammf.model.Local;
import br.com.ammf.model.SessaoCliente;
import br.com.ammf.service.EmailService;
import br.com.ammf.service.IndexService;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class IndexController {
	
	Logger logger = Logger.getLogger(IndexController.class);
	
	private IndexService indexService;
	private EmailService emailService;
	private SessaoCliente sessaoCliente;
	private Result result;
		
	public IndexController(
			IndexService indexService,
			EmailService emailService,
			SessaoCliente sessaoCliente,
			Result result) {
		this.indexService = indexService;
		this.emailService = emailService;
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
	
	@Get("/site/comentado")
	public void site(String nomeDoCliente){	
		// acesso pelo cliente apos comentario de blog via ajax
		result.include("msgIndex", "Seu coment&aacute;rio foi recebido com sucesso e aguarde confirma&ccedil;&atilde;o para publica&ccedil;&atilde;o no site");
		result.redirectTo(this).index();
	}
	
	@Get("/ame")
	public void empresaAme(){}
	
	@Get("/ame/sugerir/curso")
	public void empresaAmeSugerirCurso(String nome, String email){
		if(email != null && !email.isEmpty()){
			try {		
				emailService.enviarEmailSugestaoCurso(nome, email);				
			} catch (EmailException e) {
				new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName() + " | " + e.getMensagem()));
				result.include("msgErro", "Erro ao realizar a operação.");
				result.forwardTo(this).empresaAme();
			}	
			result.include("msgSucesso", "O curso foi sugerido para " + email + "! :)");
		}
		
		result.forwardTo(this).empresaAme();
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
	
	public void redirecionarParaPgErro(Local local) {
		result.include(local.toString(), true);
		result.redirectTo(this).erro();		
	}
	
	private void redirecionarParaPgErro(Exception e) {
		result.include("msgErro", e.getMessage());
		result.redirectTo(this).erro();		
	}
	
	public void erro(){}
	
	
}
