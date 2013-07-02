package br.com.ammf.service;

import br.com.ammf.model.Depoimento;
import br.com.ammf.model.Mensagem;
import br.com.ammf.model.Pessoa;
import br.com.ammf.model.Texto;
import br.com.ammf.model.Usuario;
import br.com.caelum.vraptor.Result;

public interface ValidacaoService {
	
	void verificarCamposPreenchidos(Texto texto);
	
	boolean pessoa(Pessoa pessoa, Result result);

	boolean usuario(Usuario usuario, Result result);	

	boolean depoimento(Depoimento depoimento, Result result);

	boolean blog(Texto texto, Result result);

	boolean mensagem(Mensagem mensagem, Result result);	

}
