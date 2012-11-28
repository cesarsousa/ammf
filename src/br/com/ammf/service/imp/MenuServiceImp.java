package br.com.ammf.service.imp;

import javax.mail.MessagingException;
import javax.mail.SendFailedException;
import javax.mail.internet.AddressException;

import br.com.ammf.model.Pessoa;
import br.com.ammf.model.SessaoUsuario;
import br.com.ammf.model.Status;
import br.com.ammf.model.Texto;
import br.com.ammf.repository.PessoaRepository;
import br.com.ammf.repository.TextoRepository;
import br.com.ammf.service.MenuService;
import br.com.ammf.utils.HtmlMensagem;
import br.com.ammf.utils.email.Email;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class MenuServiceImp implements MenuService{
	
	private SessaoUsuario sessaoUsuario;
	private TextoRepository textoRepository;
	private PessoaRepository pessoaRepository;
	
	public MenuServiceImp(
			SessaoUsuario sessaoUsuario,
			TextoRepository textoRepository,
			PessoaRepository pessoaRepository){
		this.sessaoUsuario = sessaoUsuario;
		this.textoRepository = textoRepository;
		this.pessoaRepository = pessoaRepository;
	}

	@Override
	public SessaoUsuario atualizar(SessaoUsuario sessaoUsuario) {
		sessaoUsuario.setTextoIndex(textoRepository.getTextoIndex());
		sessaoUsuario.setTextoPsicologia(textoRepository.getTextoPsicologia());
		sessaoUsuario.setTextoEducacao(textoRepository.getTextoEducacao());
		sessaoUsuario.setTextoCultura(textoRepository.getTextoCultura());
		sessaoUsuario.setTextoArtesOrientais(textoRepository.getTextoArtesOrientais());
		return sessaoUsuario;
	}

	@Override
	public void enviarEmailNotificacao(Texto texto) {
		// TODO enviar email de atualizacao de texto
		
	}

	

	@Override
	public void cadastrar(Pessoa pessoa) {
		pessoa.setStatus(Status.CONFIRMADO);
		pessoaRepository.cadastrar(pessoa);		
		enviarEmailNotificacaoCadastro(pessoa);
		
	}
	
	@Override
	public void enviarEmailNotificacaoCadastro(Pessoa pessoa) {
		try {
			Email.enviarEmail(
					sessaoUsuario.getUsuario().getEmail(), 
					sessaoUsuario.getUsuario().getSenha(), 
					pessoa.getEmail(), 
					HtmlMensagem.getAssuntoCadastroPessoa(), 
					HtmlMensagem.getMensagemCadastroPessoa(pessoa));
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SendFailedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
