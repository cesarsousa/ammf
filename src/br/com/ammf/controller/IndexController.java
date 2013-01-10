package br.com.ammf.controller;

import br.com.ammf.model.SessaoCliente;
import br.com.ammf.model.SessaoUsuario;
import br.com.ammf.model.Usuario;
import br.com.ammf.repository.UsuarioRepository;
import br.com.ammf.service.IndexService;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class IndexController {
	
	private Result result;
	private IndexService indexService;
	private SessaoUsuario sessaoUsuario;
	private SessaoCliente sessaoCliente;
	private UsuarioRepository usuarioRepository;
		
	public IndexController(
			Result result,
			IndexService indexService,
			SessaoUsuario sessaoUsuario,
			SessaoCliente sessaoCliente, 
			UsuarioRepository usuarioRepository) {
		this.result = result;
		this.indexService = indexService;
		this.sessaoUsuario = sessaoUsuario;
		this.sessaoCliente = sessaoCliente;
		this.usuarioRepository = usuarioRepository;
	}

	@Path("/")
	public void index(){
		// TODO tratar exceção de banco de dados fora do ar.
		sessaoCliente = indexService.atualizar(sessaoCliente);
	}
	
	@Get("/index/psicologia")
	public void psicologia(){}
	
	@Get("/index/educacao")
	public void educacao(){}
	
	@Get("/index/cultura")
	public void cultura(){}
	
	@Get("/index/artesOrientais")
	public void artesOrientais(){}

}
