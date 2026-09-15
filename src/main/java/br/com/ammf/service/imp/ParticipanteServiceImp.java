package br.com.ammf.service.imp;

import java.util.ArrayList;
import java.util.List;

import br.com.ammf.dto.ParticipanteDto;
import br.com.ammf.model.Participante;
import br.com.ammf.repository.imp.ParticipanteRepository;
import br.com.ammf.service.ParticipanteService;

import javax.inject.Inject;

public class ParticipanteServiceImp implements ParticipanteService {

	private ParticipanteRepository participanteRepository;

	@Inject
	public ParticipanteServiceImp(ParticipanteRepository participanteRepository){
		this.participanteRepository = participanteRepository;
	}

	@Override
	public List<ParticipanteDto> buscarPorNome(String parametro, String parametroEvento) {
		List<Participante> participantes = participanteRepository.buscarPorNome(parametro, parametroEvento);
		return converterDto(participantes);
	}

	private List<ParticipanteDto> converterDto(List<Participante> participantes) {
		List<ParticipanteDto> participantesDto = new ArrayList<ParticipanteDto>();
		for(Participante participante : participantes) {
			ParticipanteDto participanteDto = new ParticipanteDto(participante);
			participantesDto.add(participanteDto);
		}
		return participantesDto;
	}

}
