package br.com.ammf.service;

import br.com.ammf.model.Pessoa;
import br.com.ammf.model.SessaoUsuario;
import br.com.ammf.model.Texto;

public interface MenuService {

	SessaoUsuario atualizar(SessaoUsuario sessaoUsuario);

	void enviarEmailNotificacao(Texto texto);	

	void cadastrar(Pessoa pessoa);

	void enviarEmailNotificacaoCadastro(Pessoa pessoa);
	

}
