package br.com.ammf.repository;

import br.com.ammf.model.Terapeuta;

public interface TerapeutaRepository {

	Terapeuta get();

	void atualizar(Terapeuta terapeuta);

}
