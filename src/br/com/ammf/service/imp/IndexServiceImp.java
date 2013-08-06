package br.com.ammf.service.imp;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import br.com.ammf.model.Contato;
import br.com.ammf.model.Local;
import br.com.ammf.model.Paragrafo;
import br.com.ammf.model.SessaoCliente;
import br.com.ammf.model.Texto;
import br.com.ammf.model.Usuario;
import br.com.ammf.repository.TextoRepository;
import br.com.ammf.repository.UsuarioRepository;
import br.com.ammf.service.IndexService;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class IndexServiceImp implements IndexService{
	
	private TextoRepository textoRepository;
	private UsuarioRepository usuarioRepository;
	
	public IndexServiceImp(
			TextoRepository textoRepository,
			UsuarioRepository usuarioRepository){
		this.textoRepository = textoRepository;
		this.usuarioRepository = usuarioRepository;
	}

	@Override
	public SessaoCliente atualizar(SessaoCliente sessaoCliente) {		
		
		Texto textoIndex = textoRepository.getTextoIndex();
		if(textoIndex == null) textoIndex = criarTextoDefault(Local.INDEX);		
		Texto textoPsicologia = textoRepository.getTextoPsicologia();
		if(textoPsicologia == null) textoPsicologia = criarTextoDefault(Local.PSICOLOGIA);
		Texto textoEducacao = textoRepository.getTextoEducacao();
		if(textoEducacao == null) textoEducacao = criarTextoDefault(Local.EDUCACAO);
		Texto textoCultura = textoRepository.getTextoCultura();
		if(textoCultura == null) textoCultura = criarTextoDefault(Local.CULTURA);
		Texto textoArtesOrientais = textoRepository.getTextoArtesOrientais();
		if(textoArtesOrientais == null) textoArtesOrientais = criarTextoDefault(Local.ARTESORIENTAIS);		
		Texto textoQuiron = textoRepository.getTextoQuiron();
		if(textoQuiron == null ) textoQuiron = criarTextoDefault(Local.QUIRON);
		
		sessaoCliente.setTextoIndex(textoIndex);
		sessaoCliente.setTextoPsicologia(criarListaDeParagrafos(textoPsicologia));
		sessaoCliente.setTextoEducacao(criarListaDeParagrafos(textoEducacao));
		sessaoCliente.setTextoCultura(criarListaDeParagrafos(textoCultura));
		sessaoCliente.setTextoArtesOrientais(criarListaDeParagrafos(textoArtesOrientais));
		sessaoCliente.setTextoQuiron(criarListaDeParagrafos(textoQuiron));
		
		sessaoCliente.setContato(criarDadosDeContato());
		
		return sessaoCliente;
	}

	private Contato criarDadosDeContato() {
		Usuario administrador = usuarioRepository.obterAdministrador();
		
		String email = administrador.getEmail();
		String linkedin = administrador.getLinkedin();
		String telefone = administrador.getTelefone();
		String endereco = administrador.getEndereco();
		boolean mostrarMapa = administrador.isMostrarMapa();
		String localizacao = administrador.isMostrarMapa() ? administrador.getLocalizacao() : "";
		Contato contato = new Contato(email, linkedin, telefone, endereco, mostrarMapa, localizacao);		
		return contato;
	}

	private Texto criarTextoDefault(Local local) {
		Texto texto = new Texto();
		texto.setAutor("Alcindo Miguel Martins Filho");
		texto.setConfirmado(true);
		texto.setConteudo("Texto nao disponibilizado.");
		texto.setLocal(local);
		texto.setPostagem(new Date());
		texto.setTitulo(local.toString());
		texto.setUuid(UUID.randomUUID().toString());
		textoRepository.cadastrar(texto);
		return texto;
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
