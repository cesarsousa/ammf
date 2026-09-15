package br.com.ammf.service.imp;

import br.com.ammf.repository.ErroRepository;
import br.com.ammf.service.LogAplicacaoService;

import javax.inject.Inject;

public class LogAplicacaoServiceImp  implements LogAplicacaoService{

	private ErroRepository erroRepository;

	@Inject
	public LogAplicacaoServiceImp(ErroRepository erroRepository) {
		super();
		this.erroRepository = erroRepository;
	}

	@Override
	public void erro(String mensagemErro) {
		erroRepository.salvaLogDeErrosNoBanco(mensagemErro);
		
	}

}
