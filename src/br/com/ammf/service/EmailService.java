package br.com.ammf.service;

import br.com.ammf.exception.EmailException;
import br.com.ammf.model.Pessoa;

public interface EmailService {

	void notificacarNovoCadastroFeitoPeloCliente(Pessoa pessoa) throws EmailException;

	void notificacarNovoCadastroFeitoPeloAdm(Pessoa pessoa) throws EmailException;

}
