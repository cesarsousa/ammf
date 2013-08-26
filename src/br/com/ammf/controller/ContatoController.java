package br.com.ammf.controller;

import br.com.ammf.exception.EmailException;
import br.com.ammf.model.Mensagem;
import br.com.ammf.model.SessaoCliente;
import br.com.ammf.service.EmailService;
import br.com.ammf.service.IndexService;
import br.com.ammf.service.ValidacaoService;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class ContatoController {
	
	//TODO validar novos campos de configuracao de conta e envio de email pelo contato.
	
	private Result result;
	private SessaoCliente sessaoCliente;
	private IndexService indexService;
	private ValidacaoService validacaoService;
	private EmailService emailService;
	
	public ContatoController(
			Result result,
			SessaoCliente sessaoCliente,
			IndexService indexService,
			ValidacaoService validacaoService,
			EmailService emailService){
		this.result = result;
		this.sessaoCliente = sessaoCliente;
		this.indexService = indexService;
		this.validacaoService = validacaoService;
		this.emailService = emailService;
	}
	
	@Get("/cliente/contato")
	public void contatoCliente(){
		try {
			sessaoCliente = indexService.atualizar(sessaoCliente);
		} catch (Exception e) {
			result.include("mensagem", e.getMessage());
			result.redirectTo(IndexController.class).erro();
		}
	}
	

	@Post("/contato/email")
	public void processarContatoDeCliente(Mensagem mensagem){
		boolean validado = validacaoService.mensagem(mensagem, result);
		try {
			if(validado){
				emailService.notificarNovoContatoFeitoCliente(mensagem);
				result.include("msgContatoCliente", "<b>" + mensagem.getNome() + "</b> sua mensagem foi enviada com sucesso");
			}else{
				result.include("msgErroContatoCliente", true);
			}
			result.redirectTo(this).contatoCliente();
		} catch (EmailException e) {
			e.printStackTrace();
			result.include("msgErroIndex", "Ocorreu um erro interno com nosso provedor de email. N&atilde;o foi poss&iacute;vel enviar sua mensagem .<br/>Por favor tente novamente dentro de alguns minutos. Grato pela aten&ccedil;&atilde;o e desculpem-nos o transtorno.");
			result.redirectTo(IndexController.class).index();
		}		
	}

}
