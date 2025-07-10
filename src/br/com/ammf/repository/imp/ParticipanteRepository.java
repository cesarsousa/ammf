package br.com.ammf.repository.imp;

import java.util.List;

import br.com.ammf.model.Participante;

public interface ParticipanteRepository {

	List<Participante> buscarPorNome(String parametro, String parametroEvento);

}
