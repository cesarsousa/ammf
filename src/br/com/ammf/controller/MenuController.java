package br.com.ammf.controller;

import br.com.ammf.exception.DBException;
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
			menuService.enviarEmailNotificacao(textoRepository.getTextoIndex());
			redirecionarParaMenuAdm("mensagem", "Texto da página principal atualizado com sucesso");
		} catch (EmailException e) {
			e.printStackTrace();
			result.include("mensagem", "Texto da página principal atualizado com sucesso");			
			redirecionarParaMenuAdm("mensagemErro", "Não foi possível enviar os emails de notificação para os clientes referente a atualização da frase principal.");
		}				
	}	
	
	@Restrito
	@Post("/menu/psicologia/atualizar")
	public void atualizarTextoPsicologia(Texto texto){				
		try {
			validacaoService.verificarCamposPreenchidos(texto);
			textoRepository.atualizarTextoPsicologia(texto);
			menuService.enviarEmailNotificacao(textoRepository.getTextoPsicologia());
			redirecionarParaMenuAdm("mensagem", "Texto sobre psicologia atualizado com sucesso");
		} catch (EmailException e) {
			e.printStackTrace();
			result.include("mensagem", "Texto sobre psicologia atualizado com sucesso");			
			redirecionarParaMenuAdm("mensagemErro", "Não foi possível enviar os emails de notificação para os clientes referente a atualização do texto sobre Psicologia.");
		}		
	}
	
	@Restrito
	@Post("/menu/educacao/atualizar")
	public void atualizarTextoEducacao(Texto texto){				
		try {
			validacaoService.verificarCamposPreenchidos(texto);
			textoRepository.atualizarTextoEducacao(texto);
			menuService.enviarEmailNotificacao(textoRepository.getTextoEducacao());
			redirecionarParaMenuAdm("mensagem", "Texto sobre Educação atualizado com sucesso");
		} catch (EmailException e) {
			e.printStackTrace();
			result.include("mensagem", "Texto sobre Educação atualizado com sucesso");			
			redirecionarParaMenuAdm("mensagemErro", "Não foi possível enviar os emails de notificação para os clientes referente a atualização do texto sobre Educação.");
		}
	}
	
	@Restrito
	@Post("/menu/cultura/atualizar")
	public void atualizarTextoCultura(Texto texto){		
		try {
			validacaoService.verificarCamposPreenchidos(texto);		
			textoRepository.atualizarTextoCultura(texto);
			menuService.enviarEmailNotificacao(textoRepository.getTextoCultura());
			redirecionarParaMenuAdm("mensagem", "Texto sobre cultura atualizado com sucesso");
		} catch (EmailException e) {
			e.printStackTrace();
			result.include("mensagem", "Texto sobre cultura atualizado com sucesso");			
			redirecionarParaMenuAdm("mensagemErro", "Não foi possível enviar os emails de notificação para os clientes referente a atualização do texto sobre Cultura.");
		}		
	}
	
	@Restrito
	@Post("/menu/artesorientais/atualizar")
	public void atualizarTextoArtesOrientais(Texto texto){		
		try {
			validacaoService.verificarCamposPreenchidos(texto);
			textoRepository.atualizarTextoArtesOrientais(texto);			
			menuService.enviarEmailNotificacao(textoRepository.getTextoArtesOrientais());
			redirecionarParaMenuAdm("mensagem", "Texto sobre artes orientais atualizado com sucesso");
		} catch (EmailException e) {
			e.printStackTrace();
			result.include("mensagem", "Texto sobre artes orientais atualizado com sucesso");			
			redirecionarParaMenuAdm("mensagemErro", "Não foi possível enviar os emails de notificação para os clientes referente a atualização do texto sobre Artes Orientais.");
		}
		
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
	
	private void redirecionarParaCadastro() {
		result.redirectTo(this).cadastro();		
	}

	private void redirecionarParaMenuAdm(String nomeMensagem, String mensagem) {
		result.include(nomeMensagem, mensagem);
		result.forwardTo(this).menu();
	}
	
	
}
