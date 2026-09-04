package br.com.ammf.repository;

import java.util.List;

import br.com.ammf.model.Categoria;
import br.com.ammf.model.TipoCategoria;

public interface CategoriaRepository {

	void salvar(Categoria categoria);
	
	List<Categoria> listarPorTipo(TipoCategoria tipoCategoria);

	Categoria obterPor(long id);
	

}
