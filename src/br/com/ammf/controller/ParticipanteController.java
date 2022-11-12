package br.com.ammf.controller;

import java.util.List;

import br.com.ammf.dto.ParticipanteDto;
import br.com.ammf.interceptor.Restrito;
import br.com.ammf.service.ParticipanteService;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class ParticipanteController {
	
	private Result result;
	private ParticipanteService participanteService;

	public ParticipanteController(
			Result result,
			ParticipanteService participanteService) {
		super();
		this.result = result;
		this.participanteService = participanteService;
	}


	@Restrito
	@Get("/menu/participante")
	public void participanteAdmin(){}
	
	
	@Restrito
	@Get("/participante/busca")
	public void buscarParticipantesEEventosRelacionados(String parametro){
		
		List<ParticipanteDto> participantesDto = participanteService.buscarPorNome(parametro);
		
		if(participantesDto.isEmpty()) {
			result.include("resultBuscarInsucesso_paticipantes", "0 ocorr&ecirc;ncia(s) para a pesquisa: <b>" + parametro + "</b>");			
		}else {
			result.include("participantesDto", participantesDto);			
		}
		
		result.redirectTo(this).participanteAdmin();
		
	}
	
	
	
}
