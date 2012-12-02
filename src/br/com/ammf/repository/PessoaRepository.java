package br.com.ammf.repository;

import java.util.List;

import br.com.ammf.exception.DBException;
import br.com.ammf.model.Pessoa;

public interface PessoaRepository {

	void cadastrar(Pessoa pessoa) throws DBException;

	List<Pessoa> listar();
	
	

}
