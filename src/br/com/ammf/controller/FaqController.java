package br.com.ammf.controller;

import br.com.ammf.model.Faq;
import br.com.ammf.service.ValidacaoService;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class FaqController {
	
	private Result result;
	private ValidacaoService validacaoService;
	
	public FaqController(Result result, ValidacaoService validacaoService ){
		this.result = result;
		this.validacaoService = validacaoService;
	}
	
	
	@Get("/cliente/faq")
	public void faqCliente(){
				
	}
	
	@Post("/cliente/faq/pergunta")
	public void novaPergunta(Faq faq){
		try {
			boolean validado = validacaoService.cadastrarFaq(faq, result);
			result.redirectTo(this).faqCliente();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}
	
	

}
