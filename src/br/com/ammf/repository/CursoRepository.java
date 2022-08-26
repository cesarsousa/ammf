package br.com.ammf.repository;

import br.com.ammf.model.Curso;

public interface CursoRepository {

	Curso get();

	void salvarAtualizar(Curso curso);

}
