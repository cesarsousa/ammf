package br.com.ammf.service;

import br.com.ammf.exception.DBException;
import br.com.ammf.exception.EmailException;
import br.com.ammf.model.Pessoa;
import br.com.ammf.model.Texto;

public interface PessoaService {
	
	boolean ehCodigo(String paramConsulta);

	void cadastrarComoCliente(Pessoa pessoa) throws DBException;

	void cadastrarComoAdm(Pessoa pessoa);

	

}
