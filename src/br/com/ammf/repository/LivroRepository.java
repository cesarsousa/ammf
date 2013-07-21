package br.com.ammf.repository;

import java.util.List;

import br.com.ammf.model.Livro;

public interface LivroRepository {

	void cadastrar(Livro livro);

	List<Livro> listar();

	void atualizar(Livro livro);

}
