package br.com.ammf.controller;

import static br.com.caelum.vraptor.view.Results.json;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import br.com.ammf.interceptor.Restrito;
import br.com.ammf.model.Categoria;
import br.com.ammf.model.Livro;
import br.com.ammf.model.TipoCategoria;
import br.com.ammf.repository.CategoriaRepository;
import br.com.ammf.repository.LivroRepository;
import br.com.ammf.service.ImagemService;
import br.com.ammf.service.LivroService;
import br.com.ammf.service.ValidacaoService;
import br.com.ammf.utils.DataUtils;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;

@Resource
public class LivroController {
	
	//TODO adiconar categoria no editar livro e arumar o check para remover foto.

	private Result result;
	private ValidacaoService validacaoService;
	private LivroService livroService;
	private LivroRepository livroRepository;
	private CategoriaRepository categoriaRepository;
	
	public LivroController(
			Result result, 
			ValidacaoService validacaoService,
			LivroService livroService,
			LivroRepository livroRepository,
			CategoriaRepository categoriaRepository){
		this.result = result;
		this.validacaoService = validacaoService;
		this.livroService = livroService;
		this.livroRepository = livroRepository;
		this.categoriaRepository = categoriaRepository;
	}
	
	@Restrito
	@Post("/livro/adm/cadastrar")
	public void cadastrarLivro(UploadedFile imagemLivro, Livro livro){
		try {
			boolean validado = validacaoService.cadastrarLivro(imagemLivro, livro, result);		
			
			if(validado){
				livroService.cadastrar(imagemLivro, livro);				
				// notificar clientes cliente.
				result.include("msgLojaAdm", "O livro <i>" + livro.getTitulo() + "</i> foi cadastrado com sucesso.");
			}			
			
			result.forwardTo(LojaController.class).lojaAdmin();
		} catch (Exception e) { // TODO trocar email exception verificar exeção de salvar arquivos
			e.printStackTrace();
			result.include("msgErroLojaAdm", "N&atilde;o foi poss&iacute;vel efetuar o cadastro do livro '" + livro.getTitulo() + "'.<br/>Mensagem de Erro: " + e.toString() + ".");
			result.redirectTo(LojaController.class).lojaAdmin();
		}
	}
	
	@Restrito
	@Post("/livro/adm/atualizar")
	public void atualizarLivro(UploadedFile novaImagemLivro, String dataPostagem, Livro livro, boolean removerImagemLivroEdt){ 
		try {			
			boolean validado = validacaoService.atualizarLivro(novaImagemLivro, livro, result);
			
			if(validado){
				livroService.atualizar(novaImagemLivro, dataPostagem, livro, removerImagemLivroEdt);				
				// notificar clientes cliente e adm.
				result.include("msgLojaAdm", "O livro <i>" + livro.getTitulo() + "</i> foi atualizado com sucesso.");				
			}
			
			result.forwardTo(LojaController.class).lojaAdmin();
		} catch (Exception e) {
			e.printStackTrace();
			result.include("msgErroLojaAdm", "N&atilde;o foi poss&iacute;vel efetuar a atualiza&ccedil;&atilde;o do cadastro do livro '" + livro.getTitulo() + "'.<br/>Mensagem de Erro: " + e.toString() + ".");
			result.redirectTo(LojaController.class).lojaAdmin();
		}		
	}
	
	@Restrito
	@Get("/livro/adm/busca")
	public void buscarLivros(String param){		
		List<Livro> livrosSolicitados = livroRepository.listarPorAutorTitulo(param);
		result.include("livrosSolicitados", livrosSolicitados);
		result.include("flagBuscarLivro", true);
		result.include("labelResultadoConsultaLivro", "Total de " + livrosSolicitados.size() + " ocorr&ecirc;ncia(s) para a pesquisa '" + param + "'");
		if(livrosSolicitados.size() == 0) result.include("buscaSemResultado", "0 ocorr&ecirc;ncias para a pesquisa <b>'" + param + "'</b>");
		result.redirectTo(LojaController.class).lojaAdmin();
	}
	
	@Restrito
	@Get("/livro/adm/listar")
	public void listarTodos(){
		List<Livro> livrosSolicitados = livroRepository.listar();
		result.include("listagemLivros", true);
		result.include("livrosSolicitados", livrosSolicitados);
		result.redirectTo(LojaController.class).lojaAdmin();
	}
	
	@Restrito
	@Get("/livro/adm/editar/{uuid}")
	public void editarLivro(String uuid){
		Livro livro = livroRepository.obterPorUuid(uuid);
		result.include("livro", livro);
		result.include("editarLivro", true);
		result.include("uuid", uuid);
		result.redirectTo(LojaController.class).lojaAdmin();
	}
	
	@Restrito
	@Post("/livro/categoria/nova")
	public void cadastrarNovaCategoria(String categoria){		
		try {
			livroService.cadastrarCategoria(categoria);
			retornarJson("<div id=\"msgCadastrarCategoria\" class=\"msgBorderInterno msgSucesso t80 closeClick ponteiro\">Categoria adicionada com sucesso</div>");
		} catch (Exception e) {
			retornarJson("<div id=\"msgCadastrarCategoria\" class=\"msgBorderInterno msgErro t80 closeClick ponteiro\">Erro! N&atilde;o foi possivel cadastrar a categoria</div>");
		}		
	}
	
	@Restrito
	@Get("/livro/categorias")
	public void listarCategorias(){
		List<Categoria> categorias =  categoriaRepository.listarPorTipo(TipoCategoria.Livro);
		result.use(json()).withoutRoot().from(categorias).serialize();
	}

	private void retornarJson(String mensagem) {
		result.use(json()).withoutRoot().from(mensagem).serialize();
		
	}
	

}
