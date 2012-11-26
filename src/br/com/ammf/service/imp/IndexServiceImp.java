package br.com.ammf.service.imp;

import java.util.ArrayList;
import java.util.List;

import br.com.ammf.model.Paragrafo;
import br.com.ammf.model.SessaoCliente;
import br.com.ammf.model.Texto;
import br.com.ammf.repository.TextoRepository;
import br.com.ammf.service.IndexService;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class IndexServiceImp implements IndexService{
	
	private TextoRepository textoRepository;
	
	public IndexServiceImp(TextoRepository textoRepository){
		this.textoRepository = textoRepository;
	}

	@Override
	public SessaoCliente atualizar(SessaoCliente sessaoCliente) {
		sessaoCliente.setTextoIndex(textoRepository.getTextoIndex());
		sessaoCliente.setTextoPsicologia(criarListaDeParagrafos(textoRepository.getTextoPsicologia()));
		sessaoCliente.setTextoEducacao(criarListaDeParagrafos(textoRepository.getTextoEducacao()));
		sessaoCliente.setTextoCultura(criarListaDeParagrafos(textoRepository.getTextoCultura()));
		sessaoCliente.setTextoArtesOrientais(criarListaDeParagrafos(textoRepository.getTextoArtesOrientais()));
		return sessaoCliente;
	}

	private List<Paragrafo> criarListaDeParagrafos(Texto texto) {
		List<Paragrafo> paragrafos = new ArrayList<Paragrafo>();		
		String textoDividido[] = texto.getConteudo().split("\\.");		
		for(String trecho : textoDividido){
			Paragrafo paragrafo = new Paragrafo();
			paragrafo.setTrechoTexto(trecho.trim());
			paragrafos.add(paragrafo);
		}		
		return paragrafos;
	}

}
