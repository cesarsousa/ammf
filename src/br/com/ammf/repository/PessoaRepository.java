package br.com.ammf.repository;

import java.util.List;

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

	boolean jaEstaCadastrada(String email);

	int totalCadastrosPendentes();

}
