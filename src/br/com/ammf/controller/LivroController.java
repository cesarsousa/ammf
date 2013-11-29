package br.com.ammf.controller;

import static br.com.caelum.vraptor.view.Results.json;

import java.io.File;
import java.util.List;

import br.com.ammf.exception.CadastroException;
import br.com.ammf.exception.EmailException;
import br.com.ammf.interceptor.Restrito;
import br.com.ammf.model.Categoria;
import br.com.ammf.model.Livro;
import br.com.ammf.model.Notificacao;
import br.com.ammf.model.TipoCategoria;
import br.com.ammf.repository.CategoriaRepository;
import br.com.ammf.repository.LivroRepository;
import br.com.ammf.service.EmailService;
import br.com.ammf.service.LivroService;
import br.com.ammf.service.ValidacaoService;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;

@Resource
public class LivroController {
	
	private Result result;
	private ValidacaoService validacaoService;
	private LivroService livroService;
	private EmailService emailService;
	private LivroRepository livroRepository;
	private CategoriaRepository categoriaRepository;
	
	public LivroController(
			Result result, 
			ValidacaoService validacaoService,
			EmailService emailService,
			LivroService livroService,
			LivroRepository livroRepository,
			CategoriaRepository categoriaRepository){
		this.result = result;
		this.validacaoService = validacaoService;
		this.livroService = livroService;
		this.emailService = emailService;
		this.livroRepository = livroRepository;
		this.categoriaRepository = categoriaRepository;
	}
	
	@Restrito
	@Post("/livro/adm/cadastrar")
	public void cadastrarLivro(UploadedFile imagemLivro, Livro livro){
		try {			
			if(validacaoService.cadastrarLivro(imagemLivro, livro, result)){
				livroService.cadastrar(imagemLivro, livro);				
				emailService.notificarLivroParaPessoas(Notificacao.LIVRO_NOVO, livro);
				result.include("msgLojaAdm", "O livro <i>" + livro.getTitulo() + "</i> foi cadastrado com sucesso.");
			}			
			result.forwardTo(LojaController.class).lojaAdmin();
		} catch (CadastroException cadastroException) {
			cadastroException.printStackTrace();
			result.include("msgErroLojaAdm", "Erro Durante cadastramento do livro '" + livro.getTitulo() + "'. Verifique se o livro foi cadastrado com sucesso.<br/>Mensagem de Erro: " + cadastroException.getMensagem() + ".");
			result.redirectTo(LojaController.class).lojaAdmin();
		} catch (EmailException emailException){
			emailException.printStackTrace();
			result.include("msgErroLojaAdm", "N&atilde;o foi poss&iacute;vel notificar clientes por email referente ao cadastramento do livro '" + livro.getTitulo() + "'.<br/>Mensagem de Erro: " + emailException.getMensagem() + ".");
			result.redirectTo(LojaController.class).lojaAdmin();
		}
	}
	
	@Restrito
	@Post("/livro/adm/atualizar")
	public void atualizarLivro(UploadedFile novaImagemLivro, String dataPostagem, Livro livro, boolean removerImagemLivroEdt){ 
		try {			
			if(validacaoService.atualizarLivro(novaImagemLivro, livro, result)){
				livroService.atualizar(novaImagemLivro, dataPostagem, livro, removerImagemLivroEdt);				
				emailService.notificarLivroParaPessoas(Notificacao.LIVRO_ATUALIZADO, livro);
				result.include("msgLojaAdm", "O livro <i>" + livro.getTitulo() + "</i> foi atualizado com sucesso.");				
			}
			
			result.forwardTo(LojaController.class).lojaAdmin();
		} catch (CadastroException cadastroException) {
			cadastroException.printStackTrace();
			result.include("msgErroLojaAdm", "Erro Durante a atualiza&ccedil;&atilde;o do cadastro do livro '" + livro.getTitulo() + "'. Verifique se o livro foi atualizado com sucesso.<br/>Mensagem de Erro: " + cadastroException.toString() + ".");
			result.redirectTo(LojaController.class).lojaAdmin();
		} catch (EmailException emailException) {
			emailException.printStackTrace();
			result.include("msgErroLojaAdm", "N&atilde;o foi poss&iacute;vel notificar clientes por email referente a atualiza&ccedil;&atilde;o do livro '" + livro.getTitulo() + "'.<br/>Mensagem de Erro: " + emailException.getMensagem() + ".");
			result.redirectTo(LojaController.class).lojaAdmin();
		}		
	}
	
	@Restrito
	@Get("/livro/adm/busca")
	public void buscarLivros(String param){		
		List<Livro> livrosSolicitados = livroRepository.listarPorAutorTitulo(param);
		result.include("livrosSolicitados", livrosSolicitados);
		result.include("flagBuscarLivro", true);
		result.include("labelResultadoConsultaLivro", "Total de " + livrosSolicitados.size() + " ocorr&ecirc;ncia(s) para a pesquisa: <b>" + param + "</b>");
		if(livrosSolicitados.size() == 0) result.include("buscaSemResultado", "0 ocorr&ecirc;ncia(s) para a pesquisa: <b>" + param + "</b>");
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
	@Get("/livro/adm/remover/{uuid}")
	public void removerLivro(String uuid){		
		try {
			livroService.removerLivro(uuid);
			result.include("msgLojaAdm", "O livro foi removido com sucesso.");				
			result.redirectTo(LojaController.class).lojaAdmin();
		} catch (Exception e) {
			e.printStackTrace();
			result.include("msgErroLojaAdm", "Erro Durante a remo&ccedil;&atilde;o do livro.<br/>Mensagem de Erro: " + e.getMessage() + ".");
			result.redirectTo(LojaController.class).lojaAdmin();
		}
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
	
	/**
	 * Recebe a requisicao de leitura do link de email e redireciona para blog cliente.
	 * @param uuid
	 */
	@Get("/loja/cliente/livro/{uuid}")
	public void lerTextoNaIntegra(String uuid){
		Livro livro = livroRepository.obterPorUuid(uuid);
		result.include("livro", livro);
		result.include("flagRequestLivroEmail", true);
		result.redirectTo(LojaController.class).lojaCliente();
	}
	
	@Get("/loja/visualizador/{uuid}")
	public File downloadImagemLivro(String uuid){
		return livroService.visualizarImagemLivro(uuid);
	}

	private void retornarJson(String mensagem) {
		result.use(json()).withoutRoot().from(mensagem).serialize();
	}	

}
