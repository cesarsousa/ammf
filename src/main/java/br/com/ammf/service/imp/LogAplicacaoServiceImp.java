package br.com.ammf.service.imp;

import br.com.ammf.repository.ErroRepository;
import br.com.ammf.service.LogAplicacaoService;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class LogAplicacaoServiceImp  implements LogAplicacaoService{
	
	private ErroRepository erroRepository;

	public LogAplicacaoServiceImp(ErroRepository erroRepository) {
		super();
		this.erroRepository = erroRepository;
	}

	@Override
	public void erro(String mensagemErro) {
		erroRepository.salvaLogDeErrosNoBanco(mensagemErro);
		
	}

}
