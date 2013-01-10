package br.com.ammf.controller;

import br.com.ammf.interceptor.Restrito;
import br.com.ammf.model.SessaoUsuario;
import br.com.ammf.model.Usuario;
import br.com.ammf.repository.UsuarioRepository;
import br.com.ammf.service.ValidacaoService;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class UsuarioController {
	
	private Result result;
	private final SessaoUsuario sessaoUsuario;
	private UsuarioRepository usuarioRepository;
	private ValidacaoService validacaoService;
	
	public UsuarioController(
			Result result, 
			SessaoUsuario sessaoUsuario, 
			UsuarioRepository usuarioRepository,
			ValidacaoService validacaoService){
		this.result = result;
		this.sessaoUsuario = sessaoUsuario;
		this.usuarioRepository = usuarioRepository;
		this.validacaoService = validacaoService;
	}
	
	@Post("/usuario/cadastrar")
	public void cadastrar(Usuario usuario){
		usuarioRepository.salvar(usuario);
		result.include("mensagem", "Usuário adicionado com sucesso.");
		result.forwardTo(IndexController.class).index();
	}
	
	@Restrito
	@Post("/usuario/configuracao")
	public void atualizarDadosDeUsuario(Usuario usuario){
		boolean validado = validacaoService.usuario(usuario, result);
		if(validado){
			usuario.setId(sessaoUsuario.getUsuario().getId());
			usuarioRepository.atualizar(usuario);
			sessaoUsuario.login(usuario);
			redirecionarParaMenuAdm("mensagem", "Dados de conta de usuário atualizados com sucesso");
		}else{
			redirecionarParaMenuAdm("editarUsuario", "true");
		}		
	}
	
	private void redirecionarParaMenuAdm(String nomeMensagem, String mensagem) {
		result.include(nomeMensagem, mensagem);
		result.forwardTo(MenuController.class).menu();
	}

}
