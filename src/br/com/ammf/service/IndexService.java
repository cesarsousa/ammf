package br.com.ammf.service;

import java.util.List;

import br.com.ammf.model.Paragrafo;
import br.com.ammf.model.SessaoCliente;
import br.com.ammf.model.Texto;
import br.com.caelum.vraptor.Result;

public interface IndexService {

	SessaoCliente atualizar(SessaoCliente sessaoCliente) throws Exception;	
	
	List<Paragrafo> criarListaDeParagrafos(Texto texto);

	void atualizarNews(Result result);
	
}
