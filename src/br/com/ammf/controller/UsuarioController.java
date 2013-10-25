package br.com.ammf.controller;

import br.com.ammf.interceptor.Restrito;
import br.com.ammf.model.SessaoUsuario;
import br.com.ammf.model.Terapeuta;
import br.com.ammf.model.Usuario;
import br.com.ammf.repository.TerapeutaRepository;
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
	private TerapeutaRepository terapeutaRepository;
	private ValidacaoService validacaoService;
	
	public UsuarioController(
			Result result, 
			SessaoUsuario sessaoUsuario, 
			UsuarioRepository usuarioRepository,
			TerapeutaRepository terapeutaRepository,
			ValidacaoService validacaoService){
		this.result = result;
		this.sessaoUsuario = sessaoUsuario;
		this.usuarioRepository = usuarioRepository;
		this.terapeutaRepository = terapeutaRepository;
		this.validacaoService = validacaoService;
	}
	
	@Post("/usuario/cadastrar")
	public void cadastrar(Usuario usuario){
		usuarioRepository.salvar(usuario);
		result.include("mensagem", "Usu&aacute;rio adicionado com sucesso.");
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
			redirecionarParaMenuAdm("mensagem", "Dados de conta de administrador atualizados com sucesso");
		}else{
			redirecionarParaMenuAdm("editarUsuario", "true");
		}		
	}
	
	@Restrito
	@Post("/usuario/atualizar/terapeuta")
	public void atualizarDadosTerapeuta(Terapeuta terapeuta){
		terapeuta.setId(1L);
		if(sessaoUsuario.getTerapeuta() == null){
			terapeutaRepository.cadastrar(terapeuta);
		}else{
			terapeutaRepository.atualizar(terapeuta);
		}		
		sessaoUsuario.setTerapeuta(terapeuta);
		redirecionarParaMenuAdm("mensagem", "Dados do terapeuta atualizados com sucesso");
	}
	
	private void redirecionarParaMenuAdm(String nomeMensagem, String mensagem) {
		result.include(nomeMensagem, mensagem);
		result.forwardTo(MenuController.class).menu();
	}

}
