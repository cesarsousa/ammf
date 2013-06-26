package br.com.ammf.service.imp;

import java.util.ArrayList;
import java.util.List;

import br.com.ammf.exception.EmailException;
import br.com.ammf.model.Notificacao;
import br.com.ammf.model.Pessoa;
import br.com.ammf.model.SessaoUsuario;
import br.com.ammf.model.Status;
import br.com.ammf.model.Texto;
import br.com.ammf.repository.DepoimentoRepository;
import br.com.ammf.repository.PessoaRepository;
import br.com.ammf.repository.TextoRepository;
import br.com.ammf.service.MenuService;
import br.com.ammf.utils.DataUtils;
import br.com.ammf.utils.HtmlMensagem;
import br.com.ammf.utils.email.Email;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class MenuServiceImp implements MenuService{
	
	private TextoRepository textoRepository;
	private PessoaRepository pessoaRepository;
	private DepoimentoRepository depoimentoRepository;
	
	public MenuServiceImp(
			TextoRepository textoRepository,
			PessoaRepository pessoaRepository,
			DepoimentoRepository depoimentoRepository){
		this.textoRepository = textoRepository;
		this.pessoaRepository = pessoaRepository;
		this.depoimentoRepository = depoimentoRepository;
	}

	@Override
	public SessaoUsuario atualizar(SessaoUsuario sessaoUsuario) {
		sessaoUsuario.setTextoIndex(textoRepository.getTextoIndex());
		sessaoUsuario.setTextoPsicologia(textoRepository.getTextoPsicologia());
		sessaoUsuario.setTextoEducacao(textoRepository.getTextoEducacao());
		sessaoUsuario.setTextoCultura(textoRepository.getTextoCultura());
		sessaoUsuario.setTextoArtesOrientais(textoRepository.getTextoArtesOrientais());
		sessaoUsuario.setTextoQuiron(textoRepository.getTextoQuiron());
		sessaoUsuario.setNotificacoes(atualizarListaDeNotificacoes());
		return sessaoUsuario;
	}	
		
	private List<String> atualizarListaDeNotificacoes() {
		List<String> notificacoes = new ArrayList<String>();
		
		int totalDepoimentosPendentes = depoimentoRepository.getTotalDepoimentosPendentes();
		if(totalDepoimentosPendentes > 0){
			notificacoes.add("<b>Depoimento:</b> "+ totalDepoimentosPendentes + " depoimento(s) pendente(s) confirma&ccedil;&atilde;o");
		}
		
		if(pessoaRepository.totalCadastrosPendentes() > 0){
			notificacoes.add("<b>Cadastro:</b> " + pessoaRepository.totalCadastrosPendentes() + " pessoa(s) pendente(s) confirma&ccedil;&atilde;o");
		}
		return notificacoes;
	}


	
	
	
}
