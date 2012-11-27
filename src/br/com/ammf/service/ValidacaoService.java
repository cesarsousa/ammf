package br.com.ammf.service;

import br.com.ammf.model.Pessoa;
import br.com.caelum.vraptor.Result;

public interface ValidacaoService {
	
	/**
	 * Verifica se todos os campos obrigatórios foram devidamente preenchidos.
	 * @param pessoa objeto a ser validado.
	 * @return <code>true</code> caso todos os campos estejam preenchidos, caso contrário retorna <code>false</code>.
	 */
	boolean pessoa(Pessoa pessoa, Result result);

}
