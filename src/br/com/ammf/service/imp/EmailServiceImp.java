package br.com.ammf.service.imp;

import br.com.ammf.exception.EmailException;
import br.com.ammf.model.Pessoa;
import br.com.ammf.model.Usuario;
import br.com.ammf.repository.UsuarioRepository;
import br.com.ammf.service.EmailService;
import br.com.ammf.utils.HtmlMensagem;
import br.com.ammf.utils.email.Email;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class EmailServiceImp implements EmailService {
	
	private UsuarioRepository usuarioRepository;
	private Usuario administrador;
	
	public EmailServiceImp(UsuarioRepository usuarioRepository){
		this.usuarioRepository = usuarioRepository;
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

}
