package br.com.ammf.repository;

import java.util.List;

import br.com.ammf.model.Categoria;
import br.com.ammf.model.Resenha;
import br.com.ammf.model.Texto;

public interface ResenhaRepository {
	
	void cadastrar(Resenha resenha);
	
	List<Texto> listar(String parametro);

	List<Resenha> listar(boolean predefinida);

	void deletar(Resenha resenha);

	Resenha obterPorUuid(String uuid);

	void atualizar(Resenha resenha);

	void cadastrarCategoria(Categoria novaCategoria);

	Resenha ultimaResenhaPublicada();

	List<Resenha> listarPorCategorias(Long idCategoria);

	Resenha obterUltimaPublicacao();

	int getTotalResenhasPredefinidas();

}
