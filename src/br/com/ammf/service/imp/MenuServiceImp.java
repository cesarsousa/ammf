package br.com.ammf.service.imp;

import br.com.ammf.model.SessaoUsuario;
import br.com.ammf.model.Texto;
import br.com.ammf.repository.TextoRepository;
import br.com.ammf.service.MenuService;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class MenuServiceImp implements MenuService{
	
	private TextoRepository textoRepository;
	
	public MenuServiceImp(TextoRepository textoRepository){
		this.textoRepository = textoRepository;
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
	public void enviarEmailNotificacaoCadastro() {
		// TODO enviar email de cadastro de pessoa
		
	}

}
