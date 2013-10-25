package br.com.ammf.service.imp;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import br.com.ammf.model.Contato;
import br.com.ammf.model.Local;
import br.com.ammf.model.Paragrafo;
import br.com.ammf.model.SessaoCliente;
import br.com.ammf.model.Terapeuta;
import br.com.ammf.model.Texto;
import br.com.ammf.model.Usuario;
import br.com.ammf.repository.TerapeutaRepository;
import br.com.ammf.repository.TextoRepository;
import br.com.ammf.repository.UsuarioRepository;
import br.com.ammf.service.IndexService;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class IndexServiceImp implements IndexService{
	
	private TextoRepository textoRepository;
	private UsuarioRepository usuarioRepository;
	private TerapeutaRepository terapeutaRepository;
	
	public IndexServiceImp(
			TextoRepository textoRepository,
			UsuarioRepository usuarioRepository,
			TerapeutaRepository terapeutaRepository){
		this.textoRepository = textoRepository;
		this.usuarioRepository = usuarioRepository;
		this.terapeutaRepository = terapeutaRepository;
	}

	@Override
	public SessaoCliente atualizar(SessaoCliente sessaoCliente) throws Exception {		
		
		//Terapeuta terapeuta = terapeutaRepository.get();
		//if(terapeuta == null) terapeuta = new Terapeuta();
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
		
		//sessaoCliente.setTerapeuta(terapeuta);
		sessaoCliente.setTextoIndex(textoIndex);
		sessaoCliente.setTextoPsicologia(criarListaDeParagrafos(textoPsicologia));
		sessaoCliente.setTextoEducacao(criarListaDeParagrafos(textoEducacao));
		sessaoCliente.setTextoCultura(criarListaDeParagrafos(textoCultura));
		sessaoCliente.setTextoArtesOrientais(criarListaDeParagrafos(textoArtesOrientais));
		sessaoCliente.setTextoQuiron(criarListaDeParagrafos(textoQuiron));
		
		sessaoCliente.setContato(criarDadosDeContato());
		
		return sessaoCliente;
	}

	/*private Terapeuta criarTerapeuta() {
		Terapeuta terapeuta = new Terapeuta();
		terapeuta.setId(1L);
		terapeuta.setTitulo("Psicologo");
		terapeuta.setInformacao("Terapeuta e psicologo");
		terapeuta.setFormacao("Formado em psicologia e literatura");
		terapeuta.setAtuacao("Psicologia");
		terapeuta.setTratamento("Adultos");	
		terapeutaRepository.cadastrar(terapeuta);
		return terapeuta;
	}*/

	private Contato criarDadosDeContato() throws Exception {
		Usuario administrador = usuarioRepository.obterAdministrador();
		
		if(administrador == null){
			throw new Exception(new IllegalArgumentException("Impossivel definir o administrador na base de dados"));
		}		
		
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
