package br.com.ammf.service.imp;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import br.com.ammf.model.Local;
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
		
		Texto textoIndex = textoRepository.getTextoIndex();
		if(textoIndex == null) criarTextoDefault(textoIndex, Local.INDEX);		
		Texto textoPsicologia = textoRepository.getTextoPsicologia();
		if(textoPsicologia == null) criarTextoDefault(textoPsicologia, Local.PSICOLOGIA);
		Texto textoEducacao = textoRepository.getTextoEducacao();
		if(textoEducacao == null) criarTextoDefault(textoEducacao, Local.EDUCACAO);
		Texto textoCultura = textoRepository.getTextoCultura();
		if(textoCultura == null) criarTextoDefault(textoCultura, Local.CULTURA);
		Texto textoArtesOrientais = textoRepository.getTextoArtesOrientais();
		if(textoArtesOrientais == null) criarTextoDefault(textoArtesOrientais, Local.ARTESORIENTAIS);		
		
		sessaoCliente.setTextoIndex(textoRepository.getTextoIndex());
		sessaoCliente.setTextoPsicologia(criarListaDeParagrafos(textoRepository.getTextoPsicologia()));
		sessaoCliente.setTextoEducacao(criarListaDeParagrafos(textoRepository.getTextoEducacao()));
		sessaoCliente.setTextoCultura(criarListaDeParagrafos(textoRepository.getTextoCultura()));
		sessaoCliente.setTextoArtesOrientais(criarListaDeParagrafos(textoRepository.getTextoArtesOrientais()));
		return sessaoCliente;
	}

	private void criarTextoDefault(Texto texto, Local local) {
		texto = new Texto();
		texto.setAutor("Alcindo Miguel Martins Filho");
		texto.setConfirmado(true);
		texto.setConteudo("Texto nao disponibilizado.");
		texto.setLocal(local);
		texto.setPostagem(Calendar.getInstance());
		texto.setTitulo(local.toString());
		texto.setUuid(UUID.randomUUID().toString());
		textoRepository.cadastrar(texto);
	}

	public List<Paragrafo> criarListaDeParagrafos(Texto texto) {
		List<Paragrafo> paragrafos = new ArrayList<Paragrafo>();
		if(texto == null){
			Paragrafo paragrafo = new Paragrafo();
			paragrafo.setTrechoTexto("Texto nao disponibilizado.");
			paragrafos.add(paragrafo);
		}else{
			String textoDividido[] = texto.getConteudo().split("\n");
			for (String trecho : textoDividido) {
				Paragrafo paragrafo = new Paragrafo();
				paragrafo.setTrechoTexto(trecho.trim());
				paragrafos.add(paragrafo);
			}
		}
		return paragrafos;
	}

}
