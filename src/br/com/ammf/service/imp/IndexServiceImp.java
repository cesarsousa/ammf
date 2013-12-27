package br.com.ammf.service.imp;

import java.util.ArrayList;
import java.util.List;

import br.com.ammf.model.Contato;
import br.com.ammf.model.DadosTerapeuta;
import br.com.ammf.model.Depoimento;
import br.com.ammf.model.Faq;
import br.com.ammf.model.Link;
import br.com.ammf.model.Livro;
import br.com.ammf.model.Local;
import br.com.ammf.model.Paragrafo;
import br.com.ammf.model.Resenha;
import br.com.ammf.model.SessaoCliente;
import br.com.ammf.model.Terapeuta;
import br.com.ammf.model.Texto;
import br.com.ammf.model.Usuario;
import br.com.ammf.repository.DepoimentoRepository;
import br.com.ammf.repository.FaqRepository;
import br.com.ammf.repository.LinkRepository;
import br.com.ammf.repository.LivroRepository;
import br.com.ammf.repository.ResenhaRepository;
import br.com.ammf.repository.TerapeutaRepository;
import br.com.ammf.repository.TextoRepository;
import br.com.ammf.repository.UsuarioRepository;
import br.com.ammf.service.IndexService;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class IndexServiceImp implements IndexService{
	
	private TextoRepository textoRepository;
	private UsuarioRepository usuarioRepository;
	private ResenhaRepository resenhaRepository;
	private LinkRepository linkRepository;
	private DepoimentoRepository depoimentoRepository;
	private LivroRepository livroRepository;
	private FaqRepository faqRepository;
	private TerapeutaRepository terapeutaRepository;
	
	public IndexServiceImp(
			TextoRepository textoRepository,
			UsuarioRepository usuarioRepository,
			ResenhaRepository resenhaRepository,
			LinkRepository linkRepository,
			DepoimentoRepository depoimentoRepository,
			LivroRepository livroRepository,
			FaqRepository faqRepository,
			TerapeutaRepository terapeutaRepository){
		this.textoRepository = textoRepository;		
		this.usuarioRepository = usuarioRepository;
		this.resenhaRepository = resenhaRepository;
		this.linkRepository = linkRepository;
		this.depoimentoRepository = depoimentoRepository;
		this.livroRepository = livroRepository;
		this.faqRepository = faqRepository;
		this.terapeutaRepository = terapeutaRepository;
	}

	@Override
	public SessaoCliente atualizar(SessaoCliente sessaoCliente) throws Exception {		
		
		Terapeuta terapeuta = terapeutaRepository.get();
		if(terapeuta == null) terapeuta = new Terapeuta();
		Texto textoIndex = textoRepository.getTextoIndex();
		Texto textoPsicologia = textoRepository.getTextoCliente(Local.PSICOLOGIA);
		Texto textoEducacao = textoRepository.getTextoCliente(Local.EDUCACAO);
		Texto textoCultura = textoRepository.getTextoCliente(Local.CULTURA);
		Texto textoArtesOrientais = textoRepository.getTextoCliente(Local.ARTESORIENTAIS);
		Texto textoQuiron = textoRepository.getTextoCliente(Local.QUIRON);
		
		sessaoCliente.setTerapeuta(new DadosTerapeuta(terapeuta));
		sessaoCliente.setTextoIndex(textoIndex);
		sessaoCliente.setTextoPsicologia(criarListaDeParagrafos(textoPsicologia));
		sessaoCliente.setTextoEducacao(criarListaDeParagrafos(textoEducacao));
		sessaoCliente.setTextoCultura(criarListaDeParagrafos(textoCultura));
		sessaoCliente.setTextoArtesOrientais(criarListaDeParagrafos(textoArtesOrientais));
		sessaoCliente.setTextoQuiron(criarListaDeParagrafos(textoQuiron));
		
		sessaoCliente.setContato(criarDadosDeContato());
		
		return sessaoCliente;
	}
	
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

	public List<Paragrafo> criarListaDeParagrafos(Texto texto) {
		List<Paragrafo> paragrafos = new ArrayList<Paragrafo>();
		if(texto == null){
			Paragrafo paragrafo = new Paragrafo();
			paragrafo.setTrechoTexto("Este texto está sendo atualizado... Logo estará disponível.");
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

	@Override
	public void atualizarNews(Result result) {	
		
		boolean existeNews = false;
		
		Texto blog = textoRepository.obterUltimaPublicacao();
		if(blog != null){
			result.include("blogNews", "BLOG. Novo texto adicionado em " + blog.getDataFormatada() + " ");
			result.include("blogNewsTitulo", blog.getTitulo());
			existeNews = true;
		}
		
		Resenha resenha = resenhaRepository.obterUltimaPublicacao();
		if(resenha != null){
			result.include("resenhaNews", "INFORMAÇÃO. Nova resenha adicionada em " + resenha.getDataFormatada() + " ");
			result.include("resenhaNewsTitulo", resenha.getTitulo());
			existeNews = true;
		}
		
		Link link = linkRepository.obterUltimaPublicacao();
		if(link != null){
			result.include("linkNews", "UTILITÁRIOS. Novo link adicionado em " + link.getDataFormatada() + " ");
			result.include("linkNewsTitulo", link.getTitulo());
			existeNews = true;
		}
		
		Depoimento depoimento = depoimentoRepository.obterUltimaPublicacao();
		if(depoimento != null && !depoimento.isPendente()){
			result.include("depoimentoNews", "OPNIÃO. Novo depoimento adicionado em " + depoimento.getDataFormatada() + " ");
			result.include("depoimentoNewsTitulo", "por " + depoimento.getAutor());
			existeNews = true;
		}
		
		Livro livro = livroRepository.obterUltimaPublicacao();
		if(livro != null){
			result.include("lojaNews", "LOJA VIRTUAL. Novo livro adicionado em " + livro.getDataFormatadaCompleta() + " ");
			result.include("lojaNewsTitulo", livro.getTitulo());
			existeNews = true;
		}
		
		Faq faq = faqRepository.obterUltimaPublicacao();
		if(faq != null && faq.isPublica() && faq.getRespondida()){
			result.include("faqNews", "FAQ. Nova pergunta adicionada em " + faq.getDataFormatada() + " ");
			result.include("faqNewsTitulo", faq.getPergunta());
			existeNews = true;
		}
		
		if(existeNews){
			result.include("news", true);
		}
		
	}

}
