package br.com.ammf.repository;

import java.util.Date;

import org.apache.log4j.Logger;

import br.com.ammf.exception.Excecao;
import br.com.ammf.model.LogAplicacao;
import br.com.ammf.repository.imp.LogAplicacaoDao;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class ErroRepository extends RuntimeException {
	private static final long serialVersionUID = 1L;
	static Logger logger = Logger.getLogger(ErroRepository.class);
	
	protected String mensagemErro;
	
	public ErroRepository() {}

	public ErroRepository(Excecao excecao) {
		this.mensagemErro = excecao.getMensagemErro();
		if(excecao.getGeraLog().ativo()){
			
			logger.error(mensagemErro, excecao.getThrowable());		
			
			if(excecao.getThrowable() != null){
				if(excecao.getThrowable() != null){				
					mensagemErro += " | " + excecao.getThrowable().getMessage().toString() + " |";
					mensagemErro += " | " + excecao.getThrowable().getCause().toString() + " |";
				}
			}
			
			salvaLogDeErrosNoBanco(mensagemErro);			
		}
	}
	
	public void salvaLogDeErrosNoBanco(String mensagemErro){
		
		LogAplicacaoRepository logRepository = new LogAplicacaoDao();
		LogAplicacao logAplicacao = new LogAplicacao();
		
		logAplicacao.setAplicacao("Ammf");
		logAplicacao.setData(new Date());
		logAplicacao.setDescricaoErro(mensagemErro);
		logAplicacao.setIp("");
		logAplicacao.setLogin("");
		
		logRepository.salvar(logAplicacao);
	}

}
