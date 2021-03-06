package br.com.ammf.controller;

import br.com.ammf.model.SessaoUsuario;
import br.com.ammf.model.Usuario;
import br.com.ammf.repository.UsuarioRepository;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class LoginController {
	
	private Result result;
	private SessaoUsuario sessaoUsuario;
	private UsuarioRepository usuarioRepository;
		
	public LoginController(
			Result result,
			SessaoUsuario sessaoUsuario,
			UsuarioRepository usuarioRepository) {
		this.result = result;
		this.sessaoUsuario = sessaoUsuario;
		this.usuarioRepository = usuarioRepository;
	}
	
	@Get("/login")
	public void login(){}
	
	@Post("/login/autenticacao")
	public void autenticacao(String login, String senha){
		
		Usuario usuario = usuarioRepository.autenticar(login, senha);
		if(usuario != null){
			sessaoUsuario.login(usuario);
			result.redirectTo(MenuController.class).menu();
		}else{
			result.include("erroLogin", "Usu&aacute;rio ou senha inv&aacute;lidos");
			result.redirectTo(this).login();
		}
	}
	
	@Path("/logout")
	public void logout(){
		sessaoUsuario.logout();
		result.redirectTo(this).login();
	}
	
	@Path("/logout/site")
	public void logoutToSite(){
		sessaoUsuario.logout();
		result.redirectTo(IndexController.class).index();
	}

}
