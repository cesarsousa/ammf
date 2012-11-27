package br.com.ammf.service.imp;

import br.com.ammf.model.Pessoa;
import br.com.ammf.service.ValidacaoService;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class ValidacaoServiceImp implements ValidacaoService {

	/*
	 * (non-Javadoc)
	 * @see br.com.ammf.service.ValidacaoService#pessoa(br.com.ammf.model.Pessoa)
	 */
	public boolean pessoa(Pessoa pessoa, Result result) {
		boolean resultado = true;
		if(pessoa.getNome() == null || pessoa.getNome().isEmpty()){
			result.include("nomeEmBranco", "O nome deve ser informado");
			resultado = false;
		}
		if(pessoa.getEmail() == null || pessoa.getEmail().isEmpty()){
			result.include("emailEmBranco", "O email deve ser informado");
			resultado = false;
		}
		if(!resultado){
			result.include("pessoaCadastro", pessoa);
		}
		return resultado;
	}

}
