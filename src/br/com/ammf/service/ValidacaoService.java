package br.com.ammf.service;

import br.com.ammf.model.Pessoa;
import br.com.ammf.model.Texto;
import br.com.ammf.model.Usuario;
import br.com.caelum.vraptor.Result;

public interface ValidacaoService {	
	
	boolean pessoa(Pessoa pessoa, Result result);

	boolean usuario(Usuario usuario, Result result);

	void verificarCamposPreenchidos(Texto texto);

	boolean depoimento(Texto texto, Result result);

}
