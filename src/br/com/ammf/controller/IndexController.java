package br.com.ammf.controller;

import br.com.ammf.model.SessaoCliente;
import br.com.ammf.service.IndexService;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;

@Resource
public class IndexController {
	
	private IndexService indexService;
	private SessaoCliente sessaoCliente;
		
	public IndexController(
			IndexService indexService,
			SessaoCliente sessaoCliente) {
		this.indexService = indexService;
		this.sessaoCliente = sessaoCliente;
	}

	@Path("/")
	public void index(){
		// TODO tratar exceção de banco de dados fora do ar.
		sessaoCliente = indexService.atualizar(sessaoCliente);
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
}
