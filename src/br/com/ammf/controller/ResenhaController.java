package br.com.ammf.controller;

import static br.com.caelum.vraptor.view.Results.json;

import java.io.File;
import java.util.List;

import br.com.ammf.exception.CadastroException;
import br.com.ammf.exception.EmailException;
import br.com.ammf.interceptor.Restrito;
import br.com.ammf.model.Categoria;
import br.com.ammf.model.Notificacao;
import br.com.ammf.model.Resenha;
import br.com.ammf.model.Texto;
import br.com.ammf.model.TipoCategoria;
import br.com.ammf.repository.CategoriaRepository;
import br.com.ammf.repository.ResenhaRepository;
import br.com.ammf.service.EmailService;
import br.com.ammf.service.ResenhaService;
import br.com.ammf.service.ValidacaoService;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;

@Resource
public class ResenhaController {
		
	private Result result;
	private ResenhaRepository resenhaRepository;
	private CategoriaRepository categoriaRepository;
	private ValidacaoService validacaoService;
	private ResenhaService resenhaService;
	private EmailService emailService;
	
	public ResenhaController(
			Result result, 
			ResenhaRepository resenhaRepository,
			CategoriaRepository categoriaRepository,
			ValidacaoService validacaoService,
			ResenhaService resenhaService,
			EmailService emailService) {
		this.result = result;
		this.resenhaRepository = resenhaRepository;
		this.categoriaRepository = categoriaRepository;
		this.validacaoService = validacaoService;
		this.resenhaService = resenhaService;
		this.emailService = emailService;
	}	
	
	@Restrito
	@Get("/menu/resenha")
	public void resenhaAdmin(){}
	
	@Restrito
	@Post("/resenha/nova")
	public void cadastrarResenha(UploadedFile imagemResenha, Resenha resenha){
		try {
			if(validacaoService.novaResenha(imagemResenha, resenha, result)){			
				resenhaService.cadastrar(imagemResenha, resenha);				
				emailService.notificarResenhaParaPessoas(Notificacao.RESENHA_NOVA, resenha);
				result.include("resenhaMensagemSucesso", "Resenha cadastrada com sucesso");
			}
			result.forwardTo(this).resenhaAdmin();			
		} catch (CadastroException e) {
			result.include("resenhaMensagemErro", "Erro Durante cadastramento da resenha '" + resenha.getTitulo() + "'. Verifique se a resenha foi cadastrado com sucesso.<br/>Mensagem de Erro: " + e.getMensagem() + ".");
			result.redirectTo(this).resenhaAdmin();
		} catch (EmailException e) {
			result.include("resenhaMensagemErro", "N&atilde;o foi poss&iacute;vel enviar emails de notifica&ccedil;&atilde;o da atualiza&ccedil;&atilde;o da resenha " + resenha.getTitulo() + ". ERRO: " + e.getMessage());
			result.redirectTo(this).resenhaAdmin();
		}		
	}
	
	@Restrito
	@Post("/resenha/atualizar")
	public void atualizar(UploadedFile novaImagemResenha, String dataPostagem, Resenha resenha, boolean removerImagemResenhaEdt){
		try {
			if(validacaoService.atualizarResenha(novaImagemResenha, resenha, result)){
				resenhaService.atualizar(novaImagemResenha, resenha, dataPostagem, removerImagemResenhaEdt);
				emailService.notificarResenhaParaPessoas(Notificacao.RESENHA_ATUALIZADA, resenha);
				result.include("resenhaMensagemSucesso", "Resenha atualizada com sucesso");
			}else{
				result.include("resenhaErroAtualizarCadastro", true);
				result.include("resenhaEditarCadastro", true);
			}
			result.forwardTo(this).resenhaAdmin();			
		} catch (CadastroException e) {
			result.include("resenhaMensagemErro", "N&atilde;o foi poss&iacute;vel efetuar a atualiza&ccedil;&atilde;o da resenha " + resenha.getTitulo() + ". ERRO: " + e.getMensagem());
			result.redirectTo(this).resenhaAdmin();
		} catch (EmailException e) {
			result.include("resenhaMensagemErro", "N&atilde;o foi poss&iacute;vel enviar emails de notifica&ccedil;&atilde;o da atualiza&ccedil;&atilde;o da resenha " + resenha.getTitulo() + ". ERRO: " + e.getMensagem());
			result.redirectTo(this).resenhaAdmin();
		}		
	}
	
	@Restrito
	@Get("/resenha/busca")
	public void buscar(String parametro){
		List<Texto> resenhas = resenhaRepository.listar(parametro);		
		if(resenhas.isEmpty()){
			result.include("flagBuscarResenhas", true);			
			result.include("resultBuscarResenhas", "0 ocorr&ecirc;ncia(s) para a pesquisa: <b>" + parametro + "</b>");			
		}else{
			result.include("flagListarResenhas", true);
			result.include("resenhas", resenhas);
		}
		
		result.redirectTo(this).resenhaAdmin();
	}
	
	@Restrito
	@Get("/resenha/listar")
	public void listarTodas(){
		List<Resenha> resenhas = resenhaRepository.listar();		
		result.include("flagListarResenhas", true);
		result.include("resenhas", resenhas);
		result.redirectTo(this).resenhaAdmin();
	}
	
	@Restrito
	@Get("/resenha/remover/{uuid}")
	public void remover(String uuid){
		Resenha resenha = resenhaRepository.obterPorUuid(uuid);
		resenhaRepository.deletar(resenha);
		result.include("resenhaMensagemSucesso", "Resenha removida com sucesso");
		result.redirectTo(this).listarTodas();
	}
	
	@Restrito
	@Get("/resenha/editar/{uuid}")
	public void solicitarAtualizacao(String uuid){
		Resenha resenha = resenhaRepository.obterPorUuid(uuid);
		result.include("resenha", resenha);
		result.include("resenhaEditarCadastro", true);
		result.redirectTo(this).resenhaAdmin();
	}
	
	@Restrito
	@Get("/resenha/categorias")
	public void listaCategorias(){
		List<Categoria> categorias =  categoriaRepository.listarPorTipo(TipoCategoria.Resenha);
		result.use(json()).withoutRoot().from(categorias).serialize();
	}
	
	@Restrito
	@Post("/resenha/categoria/nova")
	public void cadastrarNovaCategoria(String categoria){		
		try {
			resenhaService.cadastrarCategoria(categoria);
			retornarJson("<div id=\"msgCadastrarCategoriaResenha\" class=\"msgBorderInterno msgSucesso t80 closeClick ponteiro\">Categoria adicionada com sucesso</div>");
		} catch (Exception e) {
			retornarJson("<div id=\"msgCadastrarCategoriaResenha\" class=\"msgBorderInterno msgErro t80 closeClick ponteiro\">Erro! N&atilde;o foi possivel cadastrar a categoria</div>");
		}		
	}
	
	@Get("/resenha/visualizador/{uuid}")
	public File downloadImagemResenha(String uuid){
		return resenhaService.visualizarImagemResenha(uuid);
	}
	
	private void retornarJson(String mensagem) {
		result.use(json()).withoutRoot().from(mensagem).serialize();
		
	}
	
	@Get("/resenha/cliente")
	public void resenhaCliente(){
		List<Resenha> resenhas = resenhaRepository.ultimaResenhaPublicada();
		List<Categoria> categoriasResenha = categoriaRepository.listarPorTipo(TipoCategoria.Resenha);
		result.include("resenhas", resenhas);
		result.include("categoriasResenha", categoriasResenha);
	}
		
	@Get("/resenha/cliente/listarTodas")
	public void listarTodasResenhasParaCliente(Long idCategoria){
		List<Resenha> resenhas;
		if(idCategoria == null){
			resenhas =  resenhaRepository.listar();
		}else{
			resenhas =  resenhaRepository.listarPorCategorias(idCategoria);
		}
		result.include("resenhasRequest", resenhas);
		result.include("flagResenhasRequest", true);
		result.redirectTo(this).resenhaCliente();		
	}
	
	
	/**
	 * Recebe a requisicao de leitura do link de email e redireciona para blog cliente.
	 * @param uuid
	 */
	@Get("/resenha/cliente/lertexto/{uuid}")
	public void lerTextoNaIntegra(String uuid){
		Resenha resenha = resenhaRepository.obterPor(uuid);
		result.include("resenha", resenha);		
		result.redirectTo(this).resenhaCliente();		
	}
		
	@Get("/resenha/cliente/texto")
	public void clienteVisualizarTexto(String uuid){		
		Resenha resenha = resenhaRepository.obterPor(uuid);
		result.use(json()).withoutRoot().from(resenha).exclude("id").include("categoria").serialize();
	}
	
	@Get("/resenha/listar/categoria/{id}")
	public void listarResenhasPorCategoria(long id){
		listarTodasResenhasParaCliente(id);
	}
}
