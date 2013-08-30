package br.com.ammf.repository;

import java.util.List;

import br.com.ammf.model.Categoria;
import br.com.ammf.model.Livro;

public interface LivroRepository {

	void cadastrar(Livro livro);

	List<Livro> listar();

	void atualizar(Livro livro);

	List<Livro> listarPorAutorTitulo(String param);

	Livro obterPorUuid(String uuid);

	void cadastrarCategoria(Categoria categoria);

	List<Categoria> listarCategorias();
	
}
