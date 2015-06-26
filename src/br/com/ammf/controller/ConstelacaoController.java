package br.com.ammf.controller;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class ConstelacaoController {
	
	private Result result;

	public ConstelacaoController(Result result) {
		this.result = result;
	}
	
	@Get("/constelacao/cliente")
	public void constelacaoCliente(){
		
	}

}
