package br.com.ammf.service;

import br.com.ammf.exception.EmailException;
import br.com.ammf.model.Notificacao;
import br.com.ammf.model.Pessoa;
import br.com.ammf.model.Texto;

public interface EmailService {

	void notificacarNovoCadastroFeitoPeloCliente(Pessoa pessoa) throws EmailException;

	void notificacarNovoCadastroFeitoPeloAdm(Pessoa pessoa) throws EmailException;

	void enviarSolicitacaoParaConfirmacaoCadastro(Pessoa pessoa) throws EmailException;

	void notificarPessoas(Notificacao notificacao, Texto textoIndex) throws EmailException;

}
