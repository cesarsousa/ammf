package br.com.ammf.repository;

import java.util.List;

import javax.crypto.spec.PSource;

import br.com.ammf.exception.DBException;
import br.com.ammf.model.Pessoa;
import br.com.ammf.model.Status;

public interface PessoaRepository {

	void cadastrar(Pessoa pessoa);

	List<Pessoa> listar();

	List<Pessoa> listarPorNomeEmail(String paramConsulta);
	
	List<Pessoa> listarPorStatus(Status status);

	List<String> listarEmails();

	void remover(Pessoa pessoa);

	Pessoa obter(String uuid);
<<<<<<< HEAD

	boolean jaEstaCadastrada(String email);
	
	
=======
>>>>>>> 11524b31c1230f6461860679722243dabc0bc373

}
