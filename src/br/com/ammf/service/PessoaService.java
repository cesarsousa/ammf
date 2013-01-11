package br.com.ammf.service;

import br.com.ammf.exception.DBException;
import br.com.ammf.model.Pessoa;

public interface PessoaService {

	void cadastrar(Pessoa pessoa) throws DBException;

	void notificarCadastroPelocliente(Pessoa pessoa);

}
