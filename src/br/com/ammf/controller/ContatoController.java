package br.com.ammf.controller;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class ContatoController {
	
	private Result result;
	
	public ContatoController(Result result){
		this.result = result;
	}
	
	@Get("/cliente/contato")
	public void contatoCliente(){}

}
