package br.com.ammf.controller;

import static br.com.caelum.vraptor.view.Results.json;

import java.util.ArrayList;
import java.util.List;

import br.com.ammf.model.Pessoa;
import br.com.ammf.repository.PessoaRepository;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class PessoaController {
	
	private Result result;
	private PessoaRepository pessoaRepository;
	
	public PessoaController(Result result, PessoaRepository pessoaRepository){
		this.result = result;
		this.pessoaRepository = pessoaRepository;
	}
	
	@Get("/pessoa/listar")
	public void listarPessoas(){
		List<Pessoa> pessoas = pessoaRepository.listar();		
		result.use(json()).withoutRoot().from(pessoas).exclude("id").serialize();
	}

}
