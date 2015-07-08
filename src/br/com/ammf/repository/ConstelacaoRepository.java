package br.com.ammf.repository;

import java.util.List;

import br.com.ammf.model.Constelacao;
import br.com.ammf.model.Evento;
import br.com.ammf.model.TipoEvento;

public interface ConstelacaoRepository {
	
	void salvarAtualizar(Constelacao constelacao);

	Constelacao get();

	void cadastrar(Evento evento);

	List<Evento> listar(TipoEvento tipoEvento);

}
