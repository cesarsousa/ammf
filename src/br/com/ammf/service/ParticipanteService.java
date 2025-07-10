package br.com.ammf.service;

import java.util.List;

import br.com.ammf.dto.ParticipanteDto;

public interface ParticipanteService {

	List<ParticipanteDto> buscarPorNome(String parametro, String parametroEvento);

}
