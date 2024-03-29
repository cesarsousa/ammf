package br.com.ammf.service.imp;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import br.com.ammf.exception.EmailException;
import br.com.ammf.model.Comentario;
import br.com.ammf.model.Constelacao;
import br.com.ammf.model.Depoimento;
import br.com.ammf.model.Faq;
import br.com.ammf.model.Link;
import br.com.ammf.model.Livro;
import br.com.ammf.model.Local;
import br.com.ammf.model.Mensagem;
import br.com.ammf.model.Notificacao;
import br.com.ammf.model.Pessoa;
import br.com.ammf.model.Resenha;
import br.com.ammf.model.SessaoUsuario;
import br.com.ammf.model.Situacao;
import br.com.ammf.model.Status;
import br.com.ammf.model.Texto;
import br.com.ammf.model.Usuario;
import br.com.ammf.repository.PessoaRepository;
import br.com.ammf.service.LogAplicacaoService;
import br.com.ammf.utils.HtmlMensagem;
import br.com.ammf.utils.email.Email;
	
public class EnviarEmail {
	
	private PessoaRepository pessoaRepository;
	private SessaoUsuario sessaoUsuario;
	
	private Usuario administrador;
	private Email email;
	private HtmlMensagem htmlMensagem;
	
	public EnviarEmail(SessaoUsuario sessaoUsuario, PessoaRepository pessoaRepository, LogAplicacaoService logAplicacaoService){
		this.sessaoUsuario = sessaoUsuario;
		this.pessoaRepository = pessoaRepository;
		this.administrador = this.sessaoUsuario.getUsuario();
		this.email = new Email(administrador.isEmailAtivado(), administrador.isAdministrativo(), logAplicacaoService);
		this.htmlMensagem = new HtmlMensagem(administrador.isAdministrativo());
		
	}

	public void notificarNovoCadastroFeitoPeloCliente(Pessoa pessoa) throws EmailException {					
		// Notificar o cliente do recebimento e cadastramento.
		email.enviarEmail(
				administrador.getEmail(), 
				administrador.getSenha(), 
				pessoa.getEmail(), 
				htmlMensagem.getAssuntoNotificarClienteRecebimentoCadastro(), 
				htmlMensagem.getMensagemNotificarClienteRecebimentoCadastro(pessoa, administrador.getLinkedin()));
		
		// Notificar o administrador do novo cadatro
		email.enviarEmail(
				administrador.getEmail(), 
				administrador.getSenha(), 
				administrador.getEmailNotificacao(), 
				htmlMensagem.getAssuntoNotificarAdmRecebimentoCadastro(pessoa.getNome()), 
				htmlMensagem.getMensagemNotificarAdmRecebimentoCadastro(pessoa));
	}

	public void notificarNovoCadastroFeitoPeloAdm(Pessoa pessoa) throws EmailException {		
		email.enviarEmail(
				administrador.getEmail(), 
				administrador.getSenha(), 
				pessoa.getEmail(),
				htmlMensagem.getAssuntoCadastroPessoaPeloAdm(),
				htmlMensagem.getMensagemCadastroPessoaPeloAdm(pessoa, administrador.getLinkedin()));
	}

	public void enviarSolicitacaoParaConfirmacaoCadastro(Pessoa pessoa) throws EmailException {		
		email.enviarEmail(
				administrador.getEmail(), 
				administrador.getSenha(), 
				pessoa.getEmail(),
				htmlMensagem.getAssuntoSolicitacaoParaConfirmacaoCadastro(),
				htmlMensagem.getMensagemSolicitacaoParaConfirmacaoCadastro(pessoa, administrador.getLinkedin()));
	}

	public void notificarTextoParaPessoas(Notificacao notificacao, Texto texto) throws EmailException {
		List<Pessoa> pessoas = pessoaRepository.listarPorStatus(Status.CONFIRMADO, Situacao.ATIVO);		
		for(Pessoa pessoa : pessoas){
			enviarEmailNotificacaoTexto(notificacao, texto, pessoa);
		}		
	}

	private void enviarEmailNotificacaoTexto(Notificacao notificacao, Texto texto, Pessoa pessoa) throws EmailException{
		String mensagem;
		if(Notificacao.TEXTO_ATUALIZADO == notificacao){
			mensagem = htmlMensagem.getMensagemNotificacaoDeTextoAtualizado(texto, administrador.getLinkedin(), pessoa);
		}else if(Notificacao.TEXTO_NOVO == notificacao){
			mensagem = htmlMensagem.getMensagemNotificacaoDeTextoAdicionado(texto, administrador.getLinkedin(), pessoa);
		}else{
			throw new EmailException("Tipo de notificacao de texto nao permitida: " + notificacao.toString());
		}
		
		email.enviarEmail(
				administrador.getEmail(),
				administrador.getSenha(), 
				pessoa.getEmail(),
				htmlMensagem.getAssunto(notificacao, texto),
				mensagem);
	}

	public void enviarEsclarecimentoSobreCadastro(Pessoa pessoa) throws EmailException {
		email.enviarEmail(
				administrador.getEmail(),
				administrador.getSenha(), 
				pessoa.getEmail(),
				htmlMensagem.getAssuntoEsclarecimentoCadastro(),
				htmlMensagem.getMensagemEsclarecimentoCadastro(pessoa, administrador.getLinkedin()));
		
	}

	public void notificarNovoContatoFeitoCliente(Mensagem mensagem) throws EmailException {		
		
		// notificar o administrador no novo contato enviado
		email.enviarEmail(
				administrador.getEmail(), 
				administrador.getSenha(), 
				administrador.getEmailNotificacao(), 
				htmlMensagem.getAssuntoNotificarAdmNovoContato(mensagem.getNome()), 
				htmlMensagem.getMensagemNotificarAdmNovoContato(mensagem));
		
		// notificar o cliente do contato enviado
		email.enviarEmail(
				administrador.getEmail(), 
				administrador.getSenha(), 
				mensagem.getEmail(), 
				htmlMensagem.getAssuntoNotificarClienteNovoContato(), 
				htmlMensagem.getMensagemNotificarClienteNovoContato(mensagem, administrador.getLinkedin()));		
	}

	public void notificarResenhaParaPessoas(Notificacao notificacao, Resenha resenha) throws EmailException {
		List<Pessoa> pessoas = pessoaRepository.listarPorStatus(Status.CONFIRMADO, Situacao.ATIVO);		
		for(Pessoa pessoa : pessoas){
			enviarEmailNotificacaoResenha(notificacao, resenha, pessoa);
		}		
	}

	private void enviarEmailNotificacaoResenha(Notificacao notificacao,	Resenha resenha, Pessoa pessoa) throws EmailException {
		String mensagem;
		if(Notificacao.RESENHA_NOVA == notificacao){
			mensagem = htmlMensagem.getMensagemNotificacaoDeResenhaAdicionada(resenha, administrador.getLinkedin(), pessoa);
		}else if(Notificacao.RESENHA_ATUALIZADA == notificacao){
			mensagem = htmlMensagem.getMensagemNotificacaoDeResenhaAtualizada(resenha, administrador.getLinkedin(), pessoa);
		}else{
			throw new EmailException("Tipo de notificacao de resenha nao permitida: " + notificacao.toString());
		}	
		
		email.enviarEmail(
				administrador.getEmail(),
				administrador.getSenha(), 
				pessoa.getEmail(),
				htmlMensagem.getAssunto(notificacao, resenha),
				mensagem);		
	}

	public void notificarLivroParaPessoas(Notificacao notificacao, Livro livro) throws EmailException {
		List<Pessoa> pessoas = pessoaRepository.listarPorStatus(Status.CONFIRMADO, Situacao.ATIVO);		
		for(Pessoa pessoa : pessoas){
			enviarEmailNotificacaoLivro(notificacao, livro, pessoa);
		}		
	}

	private void enviarEmailNotificacaoLivro(Notificacao notificacao, Livro livro, Pessoa pessoa) throws EmailException {
		String mensagem;
		if(Notificacao.LIVRO_NOVO == notificacao){
			mensagem = htmlMensagem.getMensagemNotificacaoDeLivroAdicionado(livro, administrador.getLinkedin(), pessoa);
		}else if(Notificacao.LIVRO_ATUALIZADO == notificacao){
			mensagem = htmlMensagem.getMensagemNotificacaoDeLivroAtualizado(livro, administrador.getLinkedin(), pessoa);
		}else{
			throw new EmailException("Tipo de notificacao de livro nao permitida: " + notificacao.toString());
		}	
		
		email.enviarEmail(
				administrador.getEmail(),
				administrador.getSenha(), 
				pessoa.getEmail(),
				htmlMensagem.getAssunto(notificacao, livro),
				mensagem);		
	}

	public void notificarLinkParaPessoas(Link link) throws EmailException {
		List<Pessoa> pessoas = pessoaRepository.listarPorStatus(Status.CONFIRMADO, Situacao.ATIVO);		
		for(Pessoa pessoa : pessoas){
			enviarEmailNotificacaoLink(link, pessoa);
		}		
	}

	private void enviarEmailNotificacaoLink(Link link, Pessoa pessoa) throws EmailException {
		String mensagem = htmlMensagem.getMensagemNotificacaoDeLink(link, administrador.getLinkedin(), pessoa);	
		
		email.enviarEmail(
				administrador.getEmail(),
				administrador.getSenha(), 
				pessoa.getEmail(),
				htmlMensagem.getAssuntoLink(),
				mensagem);		
	}

	public void notificarNovaFaqParaAdmin(Faq faq) throws EmailException {
		email.enviarEmail(
				administrador.getEmail(),
				administrador.getSenha(), 
				administrador.getEmailNotificacao(),
				htmlMensagem.getAssuntoNovoFaqParaAdmin(faq.getNome()),
				htmlMensagem.getMensagemNotificacaoDeFaqParaAdmin(faq, administrador.getLinkedin()));		
	}

	public void notificarRespostaFaqParaCliente(Faq faq) throws EmailException {
		email.enviarEmail(
				administrador.getEmail(),
				administrador.getSenha(), 
				faq.getEmail(),
				htmlMensagem.getAssuntoRespostaFaqParaCliente(),
				htmlMensagem.getMensagemRespostaFaqParaCliente(faq, administrador.getLinkedin()));		
	}

	public void notificarNovoComentarioParaAdmin(Texto texto, Comentario comentario) throws EmailException {
		email.enviarEmail(
				administrador.getEmail(),
				administrador.getSenha(), 
				administrador.getEmailNotificacao(),
				htmlMensagem.getAssuntoNotificarComentarioAdmin(texto.getTitulo(), Local.BLOG),
				htmlMensagem.getMensagemNotificarComentarioAdmin(texto.getTitulo(), comentario, Local.BLOG));	
	}

	public void notificarNovoDepoimentoParaAdmin(Depoimento depoimento) throws EmailException {
		email.enviarEmail(
				administrador.getEmail(),
				administrador.getSenha(), 
				administrador.getEmailNotificacao(),
				htmlMensagem.getAssuntoNotificarDepoimentoAdmin(),
				htmlMensagem.getMensagemNotificarDepoimentoAdmin(depoimento));	
		
	}

	public void notificarNovoComentarioParaAdmin(Resenha resenha, Comentario comentario) throws EmailException {
		email.enviarEmail(
				administrador.getEmail(),
				administrador.getSenha(), 
				administrador.getEmailNotificacao(),
				htmlMensagem.getAssuntoNotificarComentarioAdmin(resenha.getTitulo(), Local.RESENHA),
				htmlMensagem.getMensagemNotificarComentarioAdmin(resenha.getTitulo(), comentario, Local.RESENHA));		
	}

	public void notificarConstelacaoParaPessoas(Constelacao constelacao) throws EmailException{
		List<Pessoa> pessoas = pessoaRepository.listarPorStatus(Status.CONFIRMADO, Situacao.ATIVO);		
		for(Pessoa pessoa : pessoas){
			enviarEmailNotificacaoConstelacao(constelacao, pessoa);
		}		
		
	}

	private void enviarEmailNotificacaoConstelacao(Constelacao constelacao, Pessoa pessoa) throws EmailException {
		String mensagem = htmlMensagem.getMensagemNotificacaoDe(constelacao, administrador.getLinkedin(), pessoa);	
		
		email.enviarEmail(
				administrador.getEmail(),
				administrador.getSenha(), 
				pessoa.getEmail(),
				htmlMensagem.getAssuntoConstelacao(constelacao),
				mensagem);	
		
	}

}
