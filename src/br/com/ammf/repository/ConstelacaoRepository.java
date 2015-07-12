package br.com.ammf.repository;

import java.util.List;

import br.com.ammf.model.Constelacao;
import br.com.ammf.model.Evento;
import br.com.ammf.model.Participante;
import br.com.ammf.model.TipoEvento;

public interface ConstelacaoRepository {
	
	void salvarAtualizar(Constelacao constelacao);

	Constelacao get();

	void cadastrar(Evento evento);

	List<Evento> listar(TipoEvento tipoEvento);

	void remover(Evento evento);
	
	Evento obter(long id);

	void cadastrar(Participante participante);

	Participante obterParticipante(long id);

	void remover(Participante participante);

}
