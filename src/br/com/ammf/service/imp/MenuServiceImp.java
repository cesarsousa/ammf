package br.com.ammf.service.imp;

import java.util.ArrayList;
import java.util.List;

import br.com.ammf.exception.EmailException;
import br.com.ammf.model.Notificacao;
import br.com.ammf.model.Pessoa;
import br.com.ammf.model.SessaoUsuario;
import br.com.ammf.model.Status;
import br.com.ammf.model.Texto;
import br.com.ammf.repository.PessoaRepository;
import br.com.ammf.repository.TextoRepository;
import br.com.ammf.service.MenuService;
import br.com.ammf.utils.DataUtils;
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
		sessaoUsuario.setNotificacoes(atualizarListaDeNotificacoes());
		return sessaoUsuario;
	}	

	

	@Override
	public void cadastrar(Pessoa pessoa) throws EmailException {
		pessoa.setStatus(Status.CONFIRMADO);
		pessoa.setDataCadastro(DataUtils.getNow());
		pessoaRepository.cadastrar(pessoa);			
	}
	
	@Override
	public void notificarPessoas(Texto texto) throws EmailException {
		List<Pessoa> pessoas = pessoaRepository.listarPorStatus(Status.CONFIRMADO);		
		for(Pessoa pessoa : pessoas){
			enviarEmailNotificacaoTexto(Notificacao.TEXTO_ATUALIZADO, texto, pessoa);
		}
	}	
	
	private void enviarEmailNotificacaoTexto(Notificacao notificacao, Texto texto, Pessoa pessoa) throws EmailException{
		Email.enviarEmail(
				sessaoUsuario.getUsuario().getEmail(),
				sessaoUsuario.getUsuario().getSenha(), 
				pessoa.getEmail(),
				HtmlMensagem.getAssunto(notificacao, texto),
				HtmlMensagem.getMensagemTextoAtualizado(texto, sessaoUsuario.getUsuario().getLinkedin(), pessoa));
	}	
	
	@Override
	public void enviarEmailNotificacaoCadastro(Pessoa pessoa) throws EmailException {
		Email.enviarEmail(
				sessaoUsuario.getUsuario().getEmail(),
				sessaoUsuario.getUsuario().getSenha(), 
				pessoa.getEmail(),
				HtmlMensagem.getAssuntoCadastroPessoa(),
				HtmlMensagem.getMensagemCadastroPessoa(pessoa, sessaoUsuario.getUsuario().getLinkedin()));
	}
	
	private List<String> atualizarListaDeNotificacoes() {
		List<String> notificacoes = new ArrayList<String>();
		
		if(textoRepository.totalDepoimentosPendentes() > 0){
			notificacoes.add("<b>depoimento:</b> "+ textoRepository.totalDepoimentosPendentes() + " depoimento(s) pendente(s) confirma&ccedil;&atilde;o");
		}
		
		if(pessoaRepository.totalCadastrosPendentes() > 0){
			notificacoes.add("<b>cadastro:</b> " + pessoaRepository.totalCadastrosPendentes() + " pessoa(s) pendente(s) confirma&ccedil;&atilde;o");
		}
		return notificacoes;
	}
	
	
	
}
