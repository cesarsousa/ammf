package br.com.ammf.controller;

import br.com.ammf.repository.TextoRepository;
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
	
}
