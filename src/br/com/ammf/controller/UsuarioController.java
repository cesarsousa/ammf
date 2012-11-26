package br.com.ammf.controller;

import br.com.ammf.model.SessaoUsuario;
import br.com.ammf.model.Usuario;
import br.com.ammf.repository.UsuarioRepository;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class UsuarioController {
	
	private Result result;
	private final SessaoUsuario sessaoUsuario;
	private UsuarioRepository usuarioRepository;
	
	public UsuarioController(
			Result result, 
			SessaoUsuario sessaoUsuario, 
			UsuarioRepository usuarioRepository){
		this.result = result;
		this.sessaoUsuario = sessaoUsuario;
		this.usuarioRepository = usuarioRepository;
	}
	
	@Post("/usuario/cadastrar")
	public void cadastrar(Usuario usuario){
		usuarioRepository.salvar(usuario);
		result.include("mensagem", "Usuário adicionado com sucesso.");
		result.forwardTo(IndexController.class).index();
	}

}
