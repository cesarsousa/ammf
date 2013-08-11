package br.com.ammf.controller;

import br.com.ammf.interceptor.Restrito;
import br.com.ammf.model.Resenha;
import br.com.ammf.repository.ResenhaRepository;
import br.com.ammf.service.ValidacaoService;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class ResenhaController {

	private Result result;
	private ResenhaRepository resenhaRepository;
	private ValidacaoService validacaoService;
	
	public ResenhaController(
			Result result, 
			ResenhaRepository resenhaRepository,
			ValidacaoService validacaoService) {
		this.result = result;
		this.resenhaRepository = resenhaRepository;
		this.validacaoService = validacaoService;
	}	
	
	@Restrito
	@Get("/menu/resenha")
	public void resenhaAdmin(){}
	
	@Restrito
	@Post("/resenha/nova")
	public void cadastrarResenha(Resenha resenha){
		if(validacaoService.novaResenha(resenha, result)){
			
			result.include("resenhaMensagemSucesso", "Resenha adicionada com sucesso");
		}
		result.redirectTo(this).resenhaAdmin();
	}
	
}
