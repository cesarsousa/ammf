package br.com.ammf.repository;

import java.util.List;

import br.com.ammf.model.Resenha;
import br.com.ammf.model.Texto;

public interface ResenhaRepository {
	
	void cadastrar(Resenha resenha);
	
	List<Texto> listar(String parametro);

	List<Texto> listar();

	void deletar(Resenha resenha);

	Resenha obterPorUuid(String uuid);

	void atualizar(Resenha resenha);

}
