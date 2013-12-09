package br.com.ammf.repository;

import java.util.List;

import br.com.ammf.model.Link;

public interface LinkRepository {

	List<Link> listar();

	void cadastrar(Link link);

	void remover(String uuid);

	Link obterUltimaPublicacao();

}
