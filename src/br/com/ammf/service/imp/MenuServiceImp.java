package br.com.ammf.service.imp;

import java.util.ArrayList;
import java.util.List;

import br.com.ammf.model.SessaoUsuario;
import br.com.ammf.repository.ComentarioRepository;
import br.com.ammf.repository.DepoimentoRepository;
import br.com.ammf.repository.FaqRepository;
import br.com.ammf.repository.PessoaRepository;
import br.com.ammf.repository.TerapeutaRepository;
import br.com.ammf.repository.TextoRepository;
import br.com.ammf.service.MenuService;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class MenuServiceImp implements MenuService{
	
	private TextoRepository textoRepository;
	private PessoaRepository pessoaRepository;
	private DepoimentoRepository depoimentoRepository;
	private FaqRepository faqRepository;
	private TerapeutaRepository terapeutaRepository;
	private ComentarioRepository comentarioRepository;
	
	public MenuServiceImp(
			TextoRepository textoRepository,
			PessoaRepository pessoaRepository,
			DepoimentoRepository depoimentoRepository,
			FaqRepository faqRepository,
			TerapeutaRepository terapeutaRepository,
			ComentarioRepository comentarioRepository){
		this.textoRepository = textoRepository;
		this.pessoaRepository = pessoaRepository;
		this.depoimentoRepository = depoimentoRepository;
		this.faqRepository = faqRepository;
		this.terapeutaRepository = terapeutaRepository;
		this.comentarioRepository = comentarioRepository;
	}

	@Override
	public SessaoUsuario atualizar(SessaoUsuario sessaoUsuario) {
		sessaoUsuario.setTerapeuta(terapeutaRepository.get());		
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
		
		int totalComentariosBlogPendentes = comentarioRepository.getTotalComentariosBlogPendentes();
		if(totalComentariosBlogPendentes > 0){
			notificacoes.add("<b>Blog:</b> "+ totalComentariosBlogPendentes + " coment&aacute;rio(s) pendente(s) confirma&ccedil;&atilde;o");
		}
		
		int totalDepoimentosPendentes = depoimentoRepository.getTotalDepoimentosPendentes();
		if(totalDepoimentosPendentes > 0){
			notificacoes.add("<b>Depoimento:</b> "+ totalDepoimentosPendentes + " depoimento(s) pendente(s) confirma&ccedil;&atilde;o");
		}
		
		int totalCadastrosPendentes = pessoaRepository.totalCadastrosPendentes();
		if( totalCadastrosPendentes > 0){
			notificacoes.add("<b>Cadastro:</b> " + totalCadastrosPendentes + " pessoa(s) pendente(s) confirma&ccedil;&atilde;o");
		}
		
		int totalPerguntasSemResposta = faqRepository.totalPerguntasSemRespostas();
		if( totalPerguntasSemResposta > 0){
			notificacoes.add("<b>FAQ:</b> " + totalPerguntasSemResposta + " pergunta(s) pendente(s) resposta");
		}
		return notificacoes;
	}


	
	
	
}
