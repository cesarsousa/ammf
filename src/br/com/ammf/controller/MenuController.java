package br.com.ammf.controller;

import br.com.ammf.exception.EmailException;
import br.com.ammf.interceptor.Restrito;
import br.com.ammf.model.Local;
import br.com.ammf.model.Notificacao;
import br.com.ammf.model.SessaoUsuario;
import br.com.ammf.model.Texto;
import br.com.ammf.repository.TextoRepository;
import br.com.ammf.service.EmailService;
import br.com.ammf.service.MenuService;
import br.com.ammf.service.ValidacaoService;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class MenuController {
	
	private Result result;
	private MenuService menuService;
	private ValidacaoService validacaoService;
	private EmailService emailService;
	private SessaoUsuario sessaoUsuario;	
	private TextoRepository textoRepository;
	
	public MenuController(
			Result result,
			MenuService menuService,
			ValidacaoService validacaoService,
			SessaoUsuario sessaoUsuario,
			EmailService emailService,
			TextoRepository textoRepository){
		this.result = result;
		this.menuService = menuService;
		this.validacaoService = validacaoService;
		this.emailService = emailService;
		this.sessaoUsuario = sessaoUsuario;
		this.textoRepository = textoRepository;
	}
	
	@Restrito
	public void menu(){
		sessaoUsuario = menuService.atualizar(sessaoUsuario);		
	}
	
	@Path("/menu/adm")
	public void menuAdministrador(){
		result.redirectTo(this).menu();		
	}	
	
	@Restrito
	@Post("/menu/index/atualizar")
	public void atualizarFrasePrincipal(Texto texto){
		try {
			validacaoService.verificarCamposPreenchidos(texto, Local.INDEX, result);
			textoRepository.atualizarTextoIndex(texto);
			emailService.notificarTextoParaPessoas(Notificacao.TEXTO_ATUALIZADO, textoRepository.getTextoIndex());
			redirecionarParaMenuAdm("mensagem", "Texto da p&aacute;gina principal atualizado com sucesso");
		} catch (EmailException e) {
			e.printStackTrace();
			result.include("mensagem", "Texto da p&aacute;gina principal atualizado com sucesso");			
			redirecionarParaMenuAdm("mensagemErro", "N&atilde;o foi poss&iacute;vel enviar os emails de notifica&ccedil;&atilde;o para os clientes referente a atualiza&ccedil;&atilde;o da frase principal.<br/>Mensagem de Erro: " + e.getMensagem() + ".");
		}				
	}
	
	@Restrito
	@Post("/menu/quiron/atualizar")
	public void atualizarTextoQuiron(Texto texto){
		try {
			validacaoService.verificarCamposPreenchidos(texto, Local.QUIRON, result);
			textoRepository.atualizarTextoQuiron(texto);
			emailService.notificarTextoParaPessoas(Notificacao.TEXTO_ATUALIZADO, textoRepository.getTextoQuiron());
			redirecionarParaMenuAdm("mensagem", "Texto sobre Quiron atualizado com sucesso");
		} catch (EmailException e) {
			e.printStackTrace();
			result.include("mensagem", "Texto sobre Quiron atualizado com sucesso");			
			redirecionarParaMenuAdm("mensagemErro", "N&atilde;o foi poss&iacute;vel enviar os emails de notifica&ccedil;&atilde;o para os clientes referente a atualiza&ccedil;&atilde;o do texto sobre Quiron.<br/>Mensagem de Erro: " + e.getMensagem() + ".");
		}
	}	
	
	@Restrito
	@Post("/menu/psicologia/atualizar")
	public void atualizarTextoPsicologia(Texto texto){				
		try {
			validacaoService.verificarCamposPreenchidos(texto, Local.PSICOLOGIA, result);
			textoRepository.atualizarTextoPsicologia(texto);
			emailService.notificarTextoParaPessoas(Notificacao.TEXTO_ATUALIZADO, textoRepository.getTextoPsicologia());
			redirecionarParaMenuAdm("mensagem", "Texto sobre psicologia atualizado com sucesso");
		} catch (EmailException e) {
			e.printStackTrace();
			result.include("mensagem", "Texto sobre psicologia atualizado com sucesso");			
			redirecionarParaMenuAdm("mensagemErro", "N&atilde;o foi poss&iacute;vel enviar os emails de notifica&ccedil;&atilde;o para os clientes referente a atualiza&ccedil;&atilde;o do texto sobre Psicologia.<br/>Mensagem de Erro: " + e.getMensagem() + ".");
		}		
	}
	
	@Restrito
	@Post("/menu/educacao/atualizar")
	public void atualizarTextoEducacao(Texto texto){				
		try {
			validacaoService.verificarCamposPreenchidos(texto, Local.EDUCACAO, result);
			textoRepository.atualizarTextoEducacao(texto);
			emailService.notificarTextoParaPessoas(Notificacao.TEXTO_ATUALIZADO, textoRepository.getTextoEducacao());
			redirecionarParaMenuAdm("mensagem", "Texto sobre Educa&ccedil;&atilde;o atualizado com sucesso");
		} catch (EmailException e) {
			e.printStackTrace();
			result.include("mensagem", "Texto sobre Educa&ccedil;&atilde;o atualizado com sucesso");			
			redirecionarParaMenuAdm("mensagemErro", "N&atilde;o foi poss&iacute;vel enviar os emails de notifica&ccedil;&atilde;o para os clientes referente a atualiza&ccedil;&atilde;o do texto sobre Educa&ccedil;&atilde;o.<br/>Mensagem de Erro: " + e.getMensagem() + ".");
		}
	}
	
	@Restrito
	@Post("/menu/cultura/atualizar")
	public void atualizarTextoCultura(Texto texto){		
		try {
			validacaoService.verificarCamposPreenchidos(texto, Local.CULTURA, result);		
			textoRepository.atualizarTextoCultura(texto);
			emailService.notificarTextoParaPessoas(Notificacao.TEXTO_ATUALIZADO, textoRepository.getTextoCultura());
			redirecionarParaMenuAdm("mensagem", "Texto sobre cultura atualizado com sucesso");
		} catch (EmailException e) {
			e.printStackTrace();
			result.include("mensagem", "Texto sobre cultura atualizado com sucesso");			
			redirecionarParaMenuAdm("mensagemErro", "N&atilde;o foi poss&iacute;vel enviar os emails de notifica&ccedil;&atilde;o para os clientes referente a atualiza&ccedil;&atilde;o do texto sobre Cultura.<br/>Mensagem de Erro: " + e.getMensagem() + ".");
		}		
	}
	
	@Restrito
	@Post("/menu/artesorientais/atualizar")
	public void atualizarTextoArtesOrientais(Texto texto){		
		try {
			validacaoService.verificarCamposPreenchidos(texto, Local.ARTESORIENTAIS, result);
			textoRepository.atualizarTextoArtesOrientais(texto);			
			emailService.notificarTextoParaPessoas(Notificacao.TEXTO_ATUALIZADO, textoRepository.getTextoArtesOrientais());
			redirecionarParaMenuAdm("mensagem", "Texto sobre artes orientais atualizado com sucesso");
		} catch (EmailException e) {
			e.printStackTrace();
			result.include("mensagem", "Texto sobre artes orientais atualizado com sucesso");			
			redirecionarParaMenuAdm("mensagemErro", "N&atilde;o foi poss&iacute;vel enviar os emails de notifica&ccedil;&atilde;o para os clientes referente a atualiza&ccedil;&atilde;o do texto sobre Artes Orientais.<br/>Mensagem de Erro: " + e.getMensagem() + ".");
		}		
	}

	private void redirecionarParaMenuAdm(String nomeMensagem, String mensagem) {
		result.include(nomeMensagem, mensagem);
		result.forwardTo(this).menu();
	}	
}
