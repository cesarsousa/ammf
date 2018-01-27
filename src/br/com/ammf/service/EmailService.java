package br.com.ammf.service;

import br.com.ammf.exception.EmailException;
import br.com.ammf.model.Comentario;
import br.com.ammf.model.Constelacao;
import br.com.ammf.model.Depoimento;
import br.com.ammf.model.Evento;
import br.com.ammf.model.Faq;
import br.com.ammf.model.Link;
import br.com.ammf.model.Livro;
import br.com.ammf.model.Mensagem;
import br.com.ammf.model.Notificacao;
import br.com.ammf.model.Pessoa;
import br.com.ammf.model.Resenha;
import br.com.ammf.model.Texto;

public interface EmailService {

	void notificarNovoCadastroFeitoPeloCliente(Pessoa pessoa) throws EmailException;

	void notificarNovoCadastroFeitoPeloAdm(Pessoa pessoa) throws EmailException;

	void enviarSolicitacaoParaConfirmacaoCadastro(Pessoa pessoa) throws EmailException;

	void notificarTextoParaPessoas(Notificacao notificacao, Texto textoIndex) throws EmailException;

	void notificarResenhaParaPessoas(Notificacao notificacao, Resenha resenha) throws EmailException;

	void enviarEsclarecimentoSobreCadastro(Pessoa pessoa) throws EmailException;

	void notificarNovoContatoFeitoCliente(Mensagem mensagem) throws EmailException;

	void notificarLivroParaPessoas(Notificacao livroNovo, Livro livro) throws EmailException;

	void notificarLinkParaPessoas(Link link) throws EmailException;

	void notificarNovaFaqParaAdmin(Faq faq) throws EmailException;

	void notificarRespostaFaqParaCliente(Faq faq) throws EmailException;

	void notificarNovoComentarioParaAdmin(Texto texto, Comentario comentario) throws EmailException;
	
	void notificarNovoComentarioParaAdmin(Resenha resenha, Comentario comentario) throws EmailException;

	void notificarNovoDepoimentoParaAdmin(Depoimento depoimento) throws EmailException;

	void notificarConstelacaoParaPessoas(Constelacao constelacao) throws EmailException;
	
	void notificarConstelacaoParaEmail(Constelacao constelacao, String destinatario) throws EmailException;

	void notificarResenhaPredefinidaParaAdmin(Resenha resenha) throws EmailException;

	void enviarRelatorioConstelacao(Evento evento) throws EmailException;

	void enviarEmailParaClientes(Mensagem mensagem, boolean todosOsContatos) throws EmailException;

}
