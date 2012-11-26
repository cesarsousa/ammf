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
	
	
	@Get("/login")
	public void login(){}
	
	@Post("/index/login/autenticacao")
	public void autenticacao(String login, String senha){		
		
		login = "alcindomiguel";
		senha = "270879cm";
		
		Usuario usuario = usuarioRepository.autenticar(login, senha);
		if(usuario != null){
			sessaoUsuario.login(usuario);
			result.redirectTo(MenuController.class).menu();
		}else{
			result.include("erroLogin", "Usuário ou senha inválidos");
			result.redirectTo(this).login();
		}
	}
	
	@Path("/index/logout")
	public void logout(){
		sessaoUsuario.logout();
		result.redirectTo(IndexController.class).login();
	}
	
	@Path("/index/logout/site")
	public void logoutToSite(){
		sessaoUsuario.logout();
		result.redirectTo(IndexController.class).index();
	}

}
