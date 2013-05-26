package br.com.ammf.controller;

import static br.com.caelum.vraptor.view.Results.json;

import java.util.List;

import br.com.ammf.interceptor.Restrito;
import br.com.ammf.model.Local;
import br.com.ammf.model.Paragrafo;
import br.com.ammf.model.Texto;
import br.com.ammf.repository.TextoRepository;
import br.com.ammf.service.imp.IndexServiceImp;
import br.com.ammf.utils.DataUtils;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class BlogController {
	
	private Result result;
	private TextoRepository textoRepository;
	
	public BlogController(Result result, TextoRepository textoRepository){
		this.result = result;
		this.textoRepository = textoRepository;
	}
	
	@Restrito
	@Get("/blog/editar")
	public void editarBlog(){}
	
	@Restrito
	@Post("/blog/novo")
	public void cadastrarNovo(Texto texto){		
		texto.setLocal(Local.BLOG);
		texto.setPostagem(DataUtils.getNow());		
		textoRepository.cadastrar(texto);
		
		// TODO notificar usuarios...
		
		result.include("blogMensagemSucesso", "O texto <i>" + texto.getTitulo() + "</i> foi cadastrado com sucesso.");
		result.redirectTo(this).editarBlog();
	}
	
	@Restrito
	@Get("/blog/busca/texto")
	public void listarTextos(String paramConsulta){		
		List<Texto> textos = textoRepository.listarTitulos(paramConsulta);		
		result.use(json()).withoutRoot().from(textos).exclude("id", "autor", "local").serialize();		
	}
	
	@Restrito
	@Get("/blog/visualizar/{uuid}")
	public void visualizarTextoEdicao(String uuid){
		Texto texto = textoRepository.obterPor(uuid);
		result.use(json()).withoutRoot().from(texto).exclude("id", "local", "postagem") .serialize();		
	}
	
	@Restrito
	@Get("/blog/listar")
	public void listarTodos(){
		List<Texto> textosBlog = textoRepository.listar(Local.BLOG, "postagem");
		result.include("textosBlog", textosBlog);
		result.include("flagAdmBlogListar", true);
		result.redirectTo(this).editarBlog();
	}
	
	@Restrito
	@Get("/blog/remover/{uuid}")
	public void removerTexto(String uuid){
		textoRepository.deletar(uuid);		
		result.include("blogMensagemSucesso", "O texto foi removido com sucesso.");
		result.redirectTo(this).editarBlog();		
	}
	
	@Restrito
	@Post("/blog/atualiza")
	public void atualizarTexto(Texto texto){
		Texto textoOriginal = textoRepository.obterPor(texto.getUuid());
		textoOriginal.setAutor(texto.getAutor());
		textoOriginal.setTitulo(texto.getTitulo());
		textoOriginal.setConteudo(texto.getConteudo());
		textoRepository.atualizar(textoOriginal);		
		
		result.include("blogMensagemSucesso", "O texto '<i>" + texto.getTitulo() + "</i>' foi atualizado com sucesso");
		result.redirectTo(this).editarBlog();		
	}
	
	@Get("/blog/cliente")
	public void blogCliente(){
		List<Texto> textosBlog = textoRepository.listar(Local.BLOG, "postagem");
		Texto ultimaPublicacao = textoRepository.obterPor(textoRepository.obterUuidUltimaPublicacao());
		result.include("ultimaPublicacao", ultimaPublicacao);
		result.include("textosBlog", textosBlog);		
	}	
	
	@Get("/blog/cliente/lertexto/{uuid}")
	public void lerTextoNaIntegra(String uuid){
		// TODO criar ler texto na integra a partir do email 
		System.out.println("redirecionar para logica de ler texto " + uuid);
	}
	
	@Get("/blog/cliente/texto")
	public void clienteVisualizarTexto(String uuid){
		
		Texto texto = textoRepository.obterPor(uuid);
		result.use(json()).withoutRoot().from(texto).exclude("id", "local") .serialize();
	}

}
