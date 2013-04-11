package br.com.ammf.controller;

import java.util.List;

import br.com.ammf.exception.EmailException;
import br.com.ammf.interceptor.Restrito;
import br.com.ammf.model.Pessoa;
import br.com.ammf.model.SessaoUsuario;
import br.com.ammf.model.Texto;
import br.com.ammf.repository.TextoRepository;
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
	
	public MenuController(
			Result result,
			MenuService menuService,
			ValidacaoService validacaoService,
			SessaoUsuario sessaoUsuario, 
			TextoRepository textoRepository){
		this.result = result;
		this.menuService = menuService;
		this.validacaoService = validacaoService;
		this.sessaoUsuario = sessaoUsuario;
		this.textoRepository = textoRepository;
	}
	
	@Restrito
	public void menu(){
		sessaoUsuario = menuService.atualizar(sessaoUsuario);		
		// TODO lista de notificações
	}
	
	@Post("/menu/adm")
	public void menuAdministrador(){
		result.redirectTo(this).menu();		
	}	
	
	@Restrito
	@Post("/menu/index/atualizar")
	public void atualizarFrasePrincipal(Texto texto){
		try {
			validacaoService.verificarCamposPreenchidos(texto);
			textoRepository.atualizarTextoIndex(texto);
			menuService.notificarPessoas(textoRepository.getTextoIndex());
			redirecionarParaMenuAdm("mensagem", "Texto da p&aacute;gina principal atualizado com sucesso");
		} catch (EmailException e) {
			e.printStackTrace();
			result.include("mensagem", "Texto da p&aacute;gina principal atualizado com sucesso");			
			redirecionarParaMenuAdm("mensagemErro", "N&atilde;o foi poss&iacute;vel enviar os emails de notifica&ccedil;&atilde;o para os clientes referente a atualiza&ccedil;&atilde;o da frase principal.");
		}				
	}	
	
	@Restrito
	@Post("/menu/psicologia/atualizar")
	public void atualizarTextoPsicologia(Texto texto){				
		try {
			validacaoService.verificarCamposPreenchidos(texto);
			textoRepository.atualizarTextoPsicologia(texto);
			menuService.notificarPessoas(textoRepository.getTextoPsicologia());
			redirecionarParaMenuAdm("mensagem", "Texto sobre psicologia atualizado com sucesso");
		} catch (EmailException e) {
			e.printStackTrace();
			result.include("mensagem", "Texto sobre psicologia atualizado com sucesso");			
			redirecionarParaMenuAdm("mensagemErro", "N&atilde;o foi poss&iacute;vel enviar os emails de notifica&ccedil;&atilde;o para os clientes referente a atualiza&ccedil;&atilde;o do texto sobre Psicologia.");
		}		
	}
	
	@Restrito
	@Post("/menu/educacao/atualizar")
	public void atualizarTextoEducacao(Texto texto){				
		try {
			validacaoService.verificarCamposPreenchidos(texto);
			textoRepository.atualizarTextoEducacao(texto);
			menuService.notificarPessoas(textoRepository.getTextoEducacao());
			redirecionarParaMenuAdm("mensagem", "Texto sobre Educa&ccedil;&atilde;o atualizado com sucesso");
		} catch (EmailException e) {
			e.printStackTrace();
			result.include("mensagem", "Texto sobre Educa&ccedil;&atilde;o atualizado com sucesso");			
			redirecionarParaMenuAdm("mensagemErro", "N&atilde;o foi poss&iacute;vel enviar os emails de notifica&ccedil;&atilde;o para os clientes referente a atualiza&ccedil;&atilde;o do texto sobre Educa&ccedil;&atilde;o.");
		}
	}
	
	@Restrito
	@Post("/menu/cultura/atualizar")
	public void atualizarTextoCultura(Texto texto){		
		try {
			validacaoService.verificarCamposPreenchidos(texto);		
			textoRepository.atualizarTextoCultura(texto);
			menuService.notificarPessoas(textoRepository.getTextoCultura());
			redirecionarParaMenuAdm("mensagem", "Texto sobre cultura atualizado com sucesso");
		} catch (EmailException e) {
			e.printStackTrace();
			result.include("mensagem", "Texto sobre cultura atualizado com sucesso");			
			redirecionarParaMenuAdm("mensagemErro", "N&atilde;o foi poss&iacute;vel enviar os emails de notifica&ccedil;&atilde;o para os clientes referente a atualiza&ccedil;&atilde;o do texto sobre Cultura.");
		}		
	}
	
	@Restrito
	@Post("/menu/artesorientais/atualizar")
	public void atualizarTextoArtesOrientais(Texto texto){		
		try {
			validacaoService.verificarCamposPreenchidos(texto);
			textoRepository.atualizarTextoArtesOrientais(texto);			
			menuService.notificarPessoas(textoRepository.getTextoArtesOrientais());
			redirecionarParaMenuAdm("mensagem", "Texto sobre artes orientais atualizado com sucesso");
		} catch (EmailException e) {
			e.printStackTrace();
			result.include("mensagem", "Texto sobre artes orientais atualizado com sucesso");			
			redirecionarParaMenuAdm("mensagemErro", "N&atilde;o foi poss&iacute;vel enviar os emails de notifica&ccedil;&atilde;o para os clientes referente a atualiza&ccedil;&atilde;o do texto sobre Artes Orientais.");
		}
		
	}
	
	// TODO mover para pessoa controller, tela de aguarde ao enviar email esta com layout antigo usar width 100%.
	@Get("/menu/cadastro")
	public void cadastro(){}
	
	@Post("/menu/cadastrar")
	public void cadastrar(Pessoa pessoa){
				
		boolean validado = validacaoService.pessoa(pessoa, result);
		if(validado){			
			try {
				menuService.cadastrar(pessoa);
				menuService.enviarEmailNotificacaoCadastro(pessoa);
				redirecionarParaMenuAdm("mensagemMenuSecundario", "O cadastro de " + pessoa.getNome() + " foi realizado com sucesso");
			} catch (EmailException e) {				
				e.printStackTrace();
				redirecionarParaMenuAdm("mensagemErro", "N&atilde;o foi poss&iacute;vel enviar o email de notifica&ccedil;&atilde;o para " + pessoa.getNome() + " referente ao cadastro<br/>Mensagem de Erro: " + e.getMensagem() + ". Verifique em sua <b>Configura&ccedil;&otilde;es da Conta</b> os seus dados de cadastro.");
			} 		
		}else{
			result.include("flagCadastroPessoaVazio", true);
			redirecionarParaCadastro();
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
