package br.com.ammf.repository;

import java.util.List;

import br.com.ammf.exception.ErroAplicacao;
import br.com.ammf.model.LogAplicacao;

public interface LogAplicacaoRepository {
	
	void salvar(LogAplicacao logAplicacao)  throws ErroAplicacao;

	List<LogAplicacao> listar();

}
