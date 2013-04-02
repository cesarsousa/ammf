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
	
	// TODO lista de tarefas
	/*
	 * na pagina de cadastro de pessoas esconder o campo de add nova pessoa, 
	 * crie um icone add novo e ao clicar usar jquery para mostrar e ocultar o form de add.
	 * 
	 * add as funcionalidades de excluir e conformar pessoas de acordo com a tabela em exibição.
	 */

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
