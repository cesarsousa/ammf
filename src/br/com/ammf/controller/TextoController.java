package br.com.ammf.controller;

import java.util.List;

import br.com.ammf.interceptor.Restrito;
import br.com.ammf.model.Texto;
import br.com.ammf.repository.TextoRepository;
import br.com.ammf.utils.formatter;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class TextoController {
	
	// TODO rever logica de cadastrar texto, notificar usuarios e anotar restrito.

	private Result result;
	private TextoRepository textoRepository;

	public TextoController(Result result, TextoRepository textoRepository) {
		this.result = result;
		this.textoRepository = textoRepository;
	}
	
	@Post("/texto/novo")
	public void novo(){}
	
	@Post("/texto/cadastra")
	public void cadastrarTexto(Texto texto){
		System.out.println("cadastro");
		textoRepository.cadastrar(texto);
		result.forwardTo(this).visualizarTexto(texto);		
	}
	
	@Restrito
	@Get("/texto/lista")
	public void listaTitulos(){
		List<Object[]> titulos = textoRepository.listarTitulos();
		result.include("titulos", formatter.comoArrayList(titulos));			
	}
	
	
	@Get("/texto/visualiza/{uuid}")
	public void visualizarTexto(String uuid){
		Texto texto = textoRepository.obterPor(uuid);
		result.redirectTo(this).visualizarTexto(texto);
	}
	
	public Texto visualizarTexto(Texto texto){
		return texto;
	}	
}
