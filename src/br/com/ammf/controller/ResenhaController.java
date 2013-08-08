package br.com.ammf.controller;

import br.com.ammf.repository.ResenhaRepository;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class ResenhaController {

	private Result result;
	private ResenhaRepository resenhaRepository;
	
	public ResenhaController(Result result, ResenhaRepository resenhaRepository) {
		this.result = result;
		this.resenhaRepository = resenhaRepository;
	}
	
	
	@Get("/menu/resenha")
	public void resenhaAdmin(){}
	
	
	
}
