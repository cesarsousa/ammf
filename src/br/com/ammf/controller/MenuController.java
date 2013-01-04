package br.com.ammf.controller;

import br.com.ammf.exception.DBException;
import br.com.ammf.exception.EmailException;
import br.com.ammf.interceptor.Restrito;
import br.com.ammf.model.Pessoa;
import br.com.ammf.model.SessaoUsuario;
import br.com.ammf.model.Texto;
import br.com.ammf.model.Usuario;
import br.com.ammf.repository.PessoaRepository;
import br.com.ammf.repository.TextoRepository;
import br.com.ammf.repository.UsuarioRepository;
import br.com.ammf.service.MenuService;
import br.com.ammf.service.ValidacaoService;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class MenuController {
	
	private Result result;
	private MenuService menuService;
	private ValidacaoService validacaoService;
	private SessaoUsuario sessaoUsuario;
	private TextoRepository textoRepository;
	private UsuarioRepository usuarioRepository;
	
	public MenuController(
			Result result,
			MenuService menuService,
			ValidacaoService validacaoService,
			SessaoUsuario sessaoUsuario, 
			TextoRepository textoRepository,
			UsuarioRepository usuarioRepository){
		this.result = result;
		this.menuService = menuService;
		this.validacaoService = validacaoService;
		this.sessaoUsuario = sessaoUsuario;
		this.textoRepository = textoRepository;
		this.usuarioRepository = usuarioRepository;
	}
	
	@Restrito
	public void menu(){
		sessaoUsuario = menuService.atualizar(sessaoUsuario);		
	}
	
	@Post("/menu/adm")
	public void menuAdministrador(){
		result.redirectTo(this).menu();		
	}	
	
	@Post("/menu/index/atualizar")
	public void atualizarFrasePrincipal(Texto texto){
		
		textoRepository.atualizarTextoIndex(texto);
		
		menuService.enviarEmailNotificacao(texto);
		
		redirecionarParaMenuAdm("mensagem", "Texto atualizado com sucesso");		
	}	
	
	@Post("/menu/psicologia/atualizar")
	public void atualizarTextoPsicologia(Texto texto){
		textoRepository.atualizarTextoPsicologia(texto);
		redirecionarParaMenuAdm("mensagem", "Texto sobre psicologia atualizado com sucesso");
	}
	
	@Post("/menu/educacao/atualizar")
	public void atualizarTextoEducacao(Texto texto){
		textoRepository.atualizarTextoEducacao(texto);
		redirecionarParaMenuAdm("mensagem", "Texto sobre educação atualizado com sucesso");
	}
	
	@Post("/menu/cultura/atualizar")
	public void atualizarTextoCultura(Texto texto){
		textoRepository.atualizarTextoCultura(texto);
		redirecionarParaMenuAdm("mensagem", "Texto sobre cultura atualizado com sucesso");
	}
	
	@Post("/menu/artesorientais/atualizar")
	public void atualizarTextoArtesOrientais(Texto texto){
		textoRepository.atualizarTextoArtesOrientais(texto);
		redirecionarParaMenuAdm("mensagem", "Texto sobre artes orientais atualizado com sucesso");
	}
	
	@Get("/menu/cadastro")
	public void cadastro(){}
	
	@Post("/menu/cadastrar")
	public void cadastrar(Pessoa pessoa){
		boolean validado = validacaoService.pessoa(pessoa, result);
		if(validado){			
			try {
				menuService.cadastrar(pessoa);
				redirecionarParaMenuAdm("mensagemMenuSecundario", "O cadastro de " + pessoa.getNome() + " foi realizado com sucesso");
			} catch (EmailException e) {				
				e.printStackTrace();
				redirecionarParaMenuAdm("mensagemErro", "Não foi possível enviar o email de notificação para " + pessoa.getNome() + " referente ao cadastro<br/>Mensagem de Erro: " + e.getMensagem() + ". Verifique em sua <b>Configurações da Conta</b> os seus dados de cadastro.");
			} catch (DBException e) {
				e.printStackTrace();
				redirecionarParaMenuAdm("mensagemErro", "Não foi possível efetuar o cadastro de " + pessoa.getNome() + "<br/>Mensagem de Erro: " + e.getMensagem());
			}			
		}else{
			redirecionarParaCadastro();
		}		
	}
	
	@Post("/menu/index/conta")
	public void atualizarDadosDeUsuario(Usuario usuario){
		boolean validado = validacaoService.usuario(usuario, result);
		if(validado){
			usuarioRepository.atualizar(usuario);
			redirecionarParaMenuAdm("mensagem", "Dados de conta de usuário atualizados com sucesso");
		}else{
			redirecionarParaMenuAdm("editarUsuario", "true");
		}
		
	}
	
	private void redirecionarParaCadastro() {
		result.redirectTo(this).cadastro();		
	}

	private void redirecionarParaMenuAdm(String nomeMensagem, String mensagem) {
		result.include(nomeMensagem, mensagem);
		result.forwardTo(this).menu();
	}
	
	
}
