package br.com.ammf.controller;

import static br.com.caelum.vraptor.view.Results.json;

import java.util.List;

import br.com.ammf.interceptor.Restrito;
import br.com.ammf.model.Pessoa;
import br.com.ammf.model.Status;
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
	
	@Restrito
	@Get("/pessoa/listar")
	public void listarPessoas(){
		List<Pessoa> pessoas = pessoaRepository.listar();		
		result.use(json()).withoutRoot().from(pessoas).exclude("id").serialize();
	}
	
	@Restrito
	@Get("/pessoa/confirmadas")
	public void listarPessoasConfirmadas(){
		List<Pessoa> pessoas = pessoaRepository.listarPorStatus(Status.CONFIRMADO);
		result.use(json()).withoutRoot().from(pessoas).exclude("id").serialize();
	}
	
	@Restrito
	@Get("/pessoa/pendentes")
	public void listarPessoasPendentes(){
		List<Pessoa> pessoas = pessoaRepository.listarPorStatus(Status.PENDENTE);
		result.use(json()).withoutRoot().from(pessoas).exclude("id").serialize();
	}	
	
	@Get("/remover/email/{uuid}")
	public void removerAssinaturaEmail(String uuid){
		System.out.println(".........remover assinatura de email de uuid: " + uuid);
	}
	
	@Restrito
	@Get("/pessoa/consulta")
	public void consultar(String paramConsulta){
		List<Pessoa> pessoas = pessoaRepository.listarPorNomeEmail(paramConsulta);		
		result.use(json()).withoutRoot().from(pessoas).exclude("id").serialize();		
	}

}
