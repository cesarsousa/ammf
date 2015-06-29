package br.com.ammf.repository;

import br.com.ammf.model.Constelacao;

public interface ConstelacaoRepository {
	
	void salvarAtualizar(Constelacao constelacao);

	Constelacao get();

}
