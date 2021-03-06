package br.com.ammf.service.imp;

import java.util.ArrayList;
import java.util.List;

import br.com.ammf.model.Constelacao;
import br.com.ammf.model.Contato;
import br.com.ammf.model.DadosTerapeuta;
import br.com.ammf.model.Depoimento;
import br.com.ammf.model.Faq;
import br.com.ammf.model.Link;
import br.com.ammf.model.Livro;
import br.com.ammf.model.Local;
import br.com.ammf.model.LocalEvento;
import br.com.ammf.model.Paragrafo;
import br.com.ammf.model.Resenha;
import br.com.ammf.model.SessaoCliente;
import br.com.ammf.model.Terapeuta;
import br.com.ammf.model.Texto;
import br.com.ammf.model.Usuario;
import br.com.ammf.model.Video;
import br.com.ammf.repository.ConstelacaoRepository;
import br.com.ammf.repository.DepoimentoRepository;
import br.com.ammf.repository.FaqRepository;
import br.com.ammf.repository.LinkRepository;
import br.com.ammf.repository.LivroRepository;
import br.com.ammf.repository.ResenhaRepository;
import br.com.ammf.repository.TerapeutaRepository;
import br.com.ammf.repository.TextoRepository;
import br.com.ammf.repository.UsuarioRepository;
import br.com.ammf.repository.VideoRepository;
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
	private ConstelacaoRepository constelacaoRepository;
	private VideoRepository videoRepository;
	
	public IndexServiceImp(
			TextoRepository textoRepository,
			UsuarioRepository usuarioRepository,
			ResenhaRepository resenhaRepository,
			LinkRepository linkRepository,
			DepoimentoRepository depoimentoRepository,
			LivroRepository livroRepository,
			FaqRepository faqRepository,
			TerapeutaRepository terapeutaRepository,
			ConstelacaoRepository constelacaoRepository,
			VideoRepository videoRepository){
		this.textoRepository = textoRepository;		
		this.usuarioRepository = usuarioRepository;
		this.resenhaRepository = resenhaRepository;
		this.linkRepository = linkRepository;
		this.depoimentoRepository = depoimentoRepository;
		this.livroRepository = livroRepository;
		this.faqRepository = faqRepository;
		this.terapeutaRepository = terapeutaRepository;
		this.constelacaoRepository = constelacaoRepository;
		this.videoRepository = videoRepository;
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
		
		Constelacao constelacao = constelacaoRepository.get(LocalEvento.NITEROI);
		if(constelacao == null){
			constelacao = new Constelacao();
		}
		
		Constelacao constelacaoBarra = constelacaoRepository.get(LocalEvento.BARRA);
		if(constelacaoBarra == null){
			constelacaoBarra = new Constelacao();
		}
		
		sessaoCliente.setTerapeuta(new DadosTerapeuta(terapeuta));
		sessaoCliente.setTextoIndex(textoIndex);
		sessaoCliente.setTextoPsicologia(criarListaDeParagrafos(textoPsicologia));
		sessaoCliente.setTextoEducacao(criarListaDeParagrafos(textoEducacao));
		sessaoCliente.setTextoCultura(criarListaDeParagrafos(textoCultura));
		sessaoCliente.setTextoArtesOrientais(criarListaDeParagrafos(textoArtesOrientais));
		sessaoCliente.setTextoQuiron(criarListaDeParagrafos(textoQuiron));
		
		sessaoCliente.setContato(criarDadosDeContato());
		
		sessaoCliente.setConstelacao(constelacao);
		sessaoCliente.setConstelacaoBarra(constelacaoBarra);
		
		return sessaoCliente;
	}
	
	private Contato criarDadosDeContato() throws Exception {
		Usuario administrador = usuarioRepository.obterAdministrador();
		
		if(administrador == null){
			throw new Exception(new IllegalArgumentException("Impossivel definir o administrador na base de dados"));
		}		
		
		String email = administrador.getEmailNotificacao();
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
		if(texto == null || !texto.isConfirmado()){
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
	public List<Paragrafo> criarListaDeParagrafos(Resenha resenha) {
		List<Paragrafo> paragrafos = new ArrayList<Paragrafo>();
		if(resenha == null){
			Paragrafo paragrafo = new Paragrafo();
			paragrafo.setTrechoTexto("Esta resenha está sendo atualizada... Logo estará disponível.");
			paragrafos.add(paragrafo);
		}else{
			String textoDividido[] = resenha.getDescricao().split("\n");
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
		
		List<Livro> livros = livroRepository.listarLivrosProprietarios();
		if(livros.size() == 0){
			result.include("livroNaoDisponivel", true);
		}else{
			Livro livro = livros.get(0);
			result.include("livroNewsUuid", livro.getUuid());
			result.include("livroNewsSinopse", livro.getSinopse());
		}
		
		Texto blog = textoRepository.obterUltimaPublicacao();
		if(blog != null){
			result.include("blogNews", "Blog");
			result.include("blogNewsTitulo", blog.getTitulo());
			result.include("blogNewsConteudo", obterDescricaoResumida(blog.getConteudo()));
			result.include("blogNewsPostagem", "blog postado em " + blog.getDataFormatada());
			existeNews = true;
		}
		
		Resenha resenha = resenhaRepository.obterUltimaPublicacao();
		if(resenha != null){
			result.include("resenhaNews", "Resenha");
			result.include("resenhaNewsUuid", resenha.getUuid());
			result.include("resenhaNewsConteudo", obterDescricaoResumida(resenha.getDescricao()));
			result.include("resenhaNewsPostagem", "resenha postada em " + resenha.getDataFormatada());
			existeNews = true;
		}
		
		Link link = linkRepository.obterUltimaPublicacao();
		if(link != null){
			result.include("linkNews", "Link");
			result.include("linkNewsTitulo", link.getTitulo());
			result.include("linkNewsConteudo", obterDescricaoResumida(link.getDescricao()));
			result.include("linkNewsPostagem", "link postado em " + link.getDataFormatada());
			existeNews = true;
		}
		
		Depoimento depoimento = depoimentoRepository.obterUltimaPublicacao();
		if(depoimento != null && !depoimento.isPendente()){
			result.include("depoimentoNews", "Depoimento");
			result.include("depoimentoNewsTitulo", "por " + depoimento.getAutor());
			result.include("depoimentoNewsConteudo", obterDescricaoResumida(depoimento.getConteudo()));
			result.include("depoimentoNewsPostagem", "depoimento postado em " + depoimento.getDataFormatada());
			existeNews = true;
		}
		
		Livro livro = livroRepository.obterUltimaPublicacao();
		if(livro != null){
			result.include("lojaNews", "Loja Virtual");
			result.include("lojaNewsTitulo", livro.getTitulo());
			result.include("lojaNewsConteudo", obterDescricaoResumida(livro.getSinopse()));
			result.include("lojaNewsPostagem", "livro postado em " + livro.getDataFormatada());
			existeNews = true;
		}
		
		Faq faq = faqRepository.obterUltimaPublicacao();
		if(faq != null && faq.isPublica() && faq.getRespondida()){
			result.include("faqNews", "Faq");
			result.include("faqNewsTitulo", faq.getPergunta());
			result.include("faqNewsConteudo", obterDescricaoResumida(faq.getResposta()));
			result.include("faqNewsPostagem", "FAQ postada em " + faq.getDataFormatada());
			existeNews = true;
		}
		
		List<Video> videos = videoRepository.obterVideosAtivos();
		if(!videos.isEmpty()) {
			result.include("videos", videos);
			existeNews = true;
		}
		
		if(existeNews){
			result.include("news", true);
		}
		
	}

	private String obterDescricaoResumida(String conteudo) {
		String resultado = "Conte&uacute;do n&atilde;o dispon&iacute;vel";
		if(conteudo == null || conteudo.isEmpty()){
			return resultado;
		}else if(conteudo.length() > 500){
			resultado = conteudo.substring(0, 500) + "...";
		}else{
			resultado = conteudo;
		}
		return resultado;
	}

}
