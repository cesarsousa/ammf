package br.com.ammf.repository;

import java.util.List;

import br.com.ammf.model.Pessoa;
import br.com.ammf.model.Situacao;
import br.com.ammf.model.Status;

public interface PessoaRepository {

	void cadastrar(Pessoa pessoa);
	
	void remover(Pessoa pessoa, Situacao situacao);
	
	void confirmar(Pessoa pessoa);
	
	void ativar(Pessoa pessoa);
	
	void atualizar(Pessoa pessoa);

	List<Pessoa> listar();

	List<Pessoa> listarPorNomeEmail(String paramConsulta);
	
	List<Pessoa> listarPorStatus(Status status);
	
	List<Pessoa> listarPorStatus(Status status, Situacao situacao);

	List<String> listarEmails();	

	Pessoa obterPeloUuid(String uuid);
	
	Pessoa obterPeloEmail(String email);

	boolean jaEstaCadastrada(String email);

	int totalCadastrosPendentes();

	List<Pessoa> obter(long parseLong);

	boolean jaFoiRemovida(String email);

	

}
