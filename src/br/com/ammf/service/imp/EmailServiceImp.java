package br.com.ammf.service.imp;

import java.util.List;

import br.com.ammf.exception.EmailException;
import br.com.ammf.model.Notificacao;
import br.com.ammf.model.Pessoa;
import br.com.ammf.model.Situacao;
import br.com.ammf.model.Status;
import br.com.ammf.model.Texto;
import br.com.ammf.model.Usuario;
import br.com.ammf.repository.PessoaRepository;
import br.com.ammf.repository.UsuarioRepository;
import br.com.ammf.service.EmailService;
import br.com.ammf.utils.HtmlMensagem;
import br.com.ammf.utils.email.Email;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class EmailServiceImp implements EmailService {
	
	private UsuarioRepository usuarioRepository;
	private PessoaRepository pessoaRepository;
	private Usuario administrador;
	
	public EmailServiceImp(UsuarioRepository usuarioRepository, PessoaRepository pessoaRepository){
		this.usuarioRepository = usuarioRepository;
		this.pessoaRepository = pessoaRepository;
		this.administrador = this.usuarioRepository.obterAdministrador();
	}

	@Override
	public void notificacarNovoCadastroFeitoPeloCliente(Pessoa pessoa) throws EmailException {					
		// Notificar o cliente do recebimento e cadastramento.
		Email.enviarEmail(
				administrador.getEmail(), 
				administrador.getSenha(), 
				pessoa.getEmail(), 
				HtmlMensagem.getAssuntoNotificarClienteRecebimentoCadastro(), 
				HtmlMensagem.getMensagemNotificarClienteRecebimentoCadastro(pessoa, administrador.getLinkedin()));
		
		// Notificar o administrador do novo cadatro
		Email.enviarEmail(
				administrador.getEmail(), 
				administrador.getSenha(), 
				administrador.getEmail(), 
				HtmlMensagem.getAssuntoNotificarAdmRecebimentoCadastro(pessoa.getNome()), 
				HtmlMensagem.getMensagemNotificarAdmRecebimentoCadastro(pessoa));
	}

	@Override
	public void notificacarNovoCadastroFeitoPeloAdm(Pessoa pessoa) throws EmailException {		
		Email.enviarEmail(
				administrador.getEmail(), 
				administrador.getSenha(), 
				pessoa.getEmail(),
				HtmlMensagem.getAssuntoCadastroPessoaPeloAdm(),
				HtmlMensagem.getMensagemCadastroPessoaPeloAdm(pessoa, administrador.getLinkedin()));
	}

	@Override
	public void enviarSolicitacaoParaConfirmacaoCadastro(Pessoa pessoa) throws EmailException {		
		Email.enviarEmail(
				administrador.getEmail(), 
				administrador.getSenha(), 
				pessoa.getEmail(),
				HtmlMensagem.getAssuntoSolicitacaoParaConfirmacaoCadastro(),
				HtmlMensagem.getMensagemSolicitacaoParaConfirmacaoCadastro(pessoa, administrador.getLinkedin()));
	}

	@Override
	public void notificarPessoas(Notificacao notificacao, Texto texto) throws EmailException {
		List<Pessoa> pessoas = pessoaRepository.listarPorStatus(Status.CONFIRMADO, Situacao.ATIVO);		
		for(Pessoa pessoa : pessoas){
			enviarEmailNotificacaoTexto(notificacao, texto, pessoa);
		}		
	}

	private void enviarEmailNotificacaoTexto(Notificacao notificacao, Texto texto, Pessoa pessoa) throws EmailException{
		String mensagem;
		if(Notificacao.TEXTO_ATUALIZADO == notificacao){
			mensagem = HtmlMensagem.getMensagemNotificacaoDeTextoAtualizado(texto, administrador.getLinkedin(), pessoa);
		}else if(Notificacao.TEXTO_NOVO == notificacao){
			mensagem = HtmlMensagem.getMensagemNotificacaoDeTextoAdicionado(texto, administrador.getLinkedin(), pessoa);
		}else{
			throw new EmailException("Tipo de notificacao de texto nao permitida: " + notificacao.toString());
		}
		
		Email.enviarEmail(
				administrador.getEmail(),
				administrador.getSenha(), 
				pessoa.getEmail(),
				HtmlMensagem.getAssunto(notificacao, texto),
				mensagem);
	}

}
