package br.com.ammf.repository;

import br.com.ammf.exception.ErroAplicacao;
import br.com.ammf.model.LogAplicacao;

public interface LogAplicacaoRepository {
	
	void salvar(LogAplicacao logAplicacao)  throws ErroAplicacao;	

}
