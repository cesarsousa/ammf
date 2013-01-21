package br.com.ammf.service;

import br.com.ammf.exception.DBException;
import br.com.ammf.exception.EmailException;
import br.com.ammf.model.Pessoa;
import br.com.ammf.model.SessaoUsuario;
import br.com.ammf.model.Texto;

public interface MenuService {

	SessaoUsuario atualizar(SessaoUsuario sessaoUsuario);

	void notificarPessoas(Texto texto) throws EmailException;	

	void cadastrar(Pessoa pessoa) throws EmailException;

	void enviarEmailNotificacaoCadastro(Pessoa pessoa) throws EmailException;
	

}
