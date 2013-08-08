package br.com.ammf.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import br.com.ammf.interceptor.Restrito;
import br.com.ammf.model.Livro;
import br.com.ammf.repository.LivroRepository;
import br.com.ammf.service.ImagemService;
import br.com.ammf.service.ValidacaoService;
import br.com.ammf.utils.DataUtils;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;

@Resource
public class LivroController {	

	private Result result;
	private ValidacaoService validacaoService;
	private ImagemService imagemService;
	private LivroRepository livroRepository;
	
	public LivroController(
			Result result, 
			ValidacaoService validacaoService,
			ImagemService imagemService,
			LivroRepository livroRepository){
		this.result = result;
		this.validacaoService = validacaoService;
		this.imagemService = imagemService;
		this.livroRepository = livroRepository;
	}
	
	@Restrito
	@Post("/livro/adm/cadastrar")
	public void cadastrarLivro(UploadedFile imagemLivro, Livro livro){
		try {
			boolean validado = validacaoService.cadastrarLivro(imagemLivro, livro, result);		
			
			if(validado){			
				livro.setPostagem(DataUtils.getDateNow());
				if(imagemLivro != null){
					imagemService.salvarFotoLivro(imagemLivro, livro);
				}
				livroRepository.cadastrar(livro);
				
				// notificar clientes cliente e adm.
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
	public void atualizarLivro(UploadedFile novaImagemLivro, String dataPostagem, Livro livro){ 
		try {
			
			boolean validado = validacaoService.atualizarLivro(novaImagemLivro, livro, result);
			
			if(validado){
				if(novaImagemLivro != null){
					imagemService.atualizarFotoLivro(novaImagemLivro, livro);
				}				
				Date postagem = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").parse(dataPostagem);
				livro.setPostagem(postagem);
				livroRepository.atualizar(livro);
				
				// notificar clientes cliente e adm.
				result.include("msgLojaAdm", "O livro <i>" + livro.getTitulo() + "</i> foi atualizado com sucesso.");				
			}
			
			result.forwardTo(LojaController.class).lojaAdmin();
		} catch (Exception e) { // TODO trocar email exception verificar exeção de salvar arquivos
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
}
