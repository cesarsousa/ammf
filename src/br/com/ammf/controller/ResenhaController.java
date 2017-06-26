package br.com.ammf.controller;

import static br.com.caelum.vraptor.view.Results.json;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import br.com.ammf.exception.CadastroException;
import br.com.ammf.exception.EmailException;
import br.com.ammf.exception.ErroAplicacao;
import br.com.ammf.exception.Excecao;
import br.com.ammf.interceptor.Restrito;
import br.com.ammf.model.Categoria;
import br.com.ammf.model.Comentario;
import br.com.ammf.model.Local;
import br.com.ammf.model.Notificacao;
import br.com.ammf.model.Paragrafo;
import br.com.ammf.model.Resenha;
import br.com.ammf.model.Status;
import br.com.ammf.model.Texto;
import br.com.ammf.model.TipoCategoria;
import br.com.ammf.repository.CategoriaRepository;
import br.com.ammf.repository.ComentarioRepository;
import br.com.ammf.repository.ResenhaRepository;
import br.com.ammf.service.EmailService;
import br.com.ammf.service.IndexService;
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
	private ComentarioRepository comentarioRepository;
	private ValidacaoService validacaoService;
	private ResenhaService resenhaService;
	private EmailService emailService;
	private IndexService indexService;
	
	public ResenhaController(
			Result result, 
			ResenhaRepository resenhaRepository,
			CategoriaRepository categoriaRepository,
			ComentarioRepository comentarioRepository,
			ValidacaoService validacaoService,
			ResenhaService resenhaService,
			EmailService emailService,
			IndexService indexService) {
		this.result = result;
		this.resenhaRepository = resenhaRepository;
		this.categoriaRepository = categoriaRepository;
		this.comentarioRepository = comentarioRepository;
		this.validacaoService = validacaoService;
		this.resenhaService = resenhaService;
		this.emailService = emailService;
		this.indexService = indexService;
	}	
	
	@Restrito
	@Get("/menu/resenha")
	public void resenhaAdmin(){}
	
	@Restrito
	@Post("/resenha/nova")
	public void cadastrarResenha(UploadedFile imagemResenha, Resenha resenha){
		try {
			if(validacaoService.novaResenha(imagemResenha, resenha, result)){			
				resenha.setPredefinida(false);
				resenhaService.cadastrar(imagemResenha, resenha);
				result.include("resenhaMensagemSucesso", "Resenha cadastrada com sucesso");
				emailService.notificarResenhaParaPessoas(Notificacao.RESENHA_NOVA, resenha);				
			}
			result.forwardTo(this).resenhaAdmin();			
		} catch (CadastroException e) {
			result.include("resenhaMensagemErro", "Erro Durante cadastramento da resenha '" + resenha.getTitulo() + "'. Verifique se a resenha foi cadastrado com sucesso.<br/>Mensagem de Erro: " + e.getMensagem() + ".");
			result.redirectTo(this).resenhaAdmin();
		} catch (EmailException e) {
			new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName() + " | " + e.getMensagem()));
			result.include("resenhaMensagemErro", "N&atilde;o foi poss&iacute;vel enviar emails de notifica&ccedil;&atilde;o da atualiza&ccedil;&atilde;o da resenha " + resenha.getTitulo() + ". ERRO: " + e.getMessage());
			result.redirectTo(this).resenhaAdmin();
		}		
	}
	
	@Restrito
	@Post("/resenha/nova/predefinida")
	public void cadastrarResenhaPredefinida(UploadedFile imagemResenhaPredefinida, Resenha resenha){
		try {
			resenha.setDescricao("Insira a descrição");
			if(validacaoService.novaResenha(imagemResenhaPredefinida, resenha, result)){			
				resenha.setPredefinida(true);
				resenhaService.cadastrar(imagemResenhaPredefinida, resenha);
				emailService.notificarResenhaPredefinidaParaAdmin(resenha);
				result.include("resenhaMensagemSucesso", "Resenha cadastrada com sucesso");			
			}
			result.forwardTo(this).resenhaAdmin();			
		} catch (CadastroException e) {
			result.include("resenhaMensagemErro", "Erro Durante cadastramento da resenha '" + resenha.getTitulo() + "'. Verifique se a resenha foi cadastrado com sucesso.<br/>Mensagem de Erro: " + e.getMensagem() + ".");
			result.redirectTo(this).resenhaAdmin();
		} catch (EmailException e) {
			new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName() + " | " + e.getMensagem()));
			result.include("resenhaMensagemErro", "N&atilde;o foi poss&iacute;vel enviar emails de notifica&ccedil;&atilde;o da predefinição da resenha " + resenha.getTitulo() + ". ERRO: " + e.getMensagem());
			result.redirectTo(this).resenhaAdmin();
		}	
	}
	
	@Restrito
	@Get("/resenha/notificar/predefinida/{uuid}")
	public void notificarAdminResenhaPredefinida(String uuid){
		Resenha resenha = resenhaRepository.obterPorUuid(uuid);
		try {
			if(resenha.isPredefinida()){
				emailService.notificarResenhaPredefinidaParaAdmin(resenha);
				result.include("resenhaMensagemSucesso", "Notificação enviada com sucesso");
			}else{
				result.include("resenhaMensagemSucesso", "Esta resenha não esta predefinida");
			}
			result.forwardTo(this).resenhaAdmin();
		} catch (EmailException e) {
			new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName() + " | " + e.getMensagem()));
			result.include("resenhaMensagemErro", "N&atilde;o foi poss&iacute;vel enviar emails de notifica&ccedil;&atilde;o da predefinição da resenha " + resenha.getTitulo() + ". ERRO: " + e.getMensagem());
			result.redirectTo(this).resenhaAdmin();
		}
	}
	
	@Restrito
	@Post("/resenha/atualizar")
	public void atualizar(UploadedFile novaImagemResenha, String dataPostagem, Resenha resenha, boolean removerImagemResenhaEdt, boolean notificarAlteracao){
		try {
			if(validacaoService.atualizarResenha(novaImagemResenha, resenha, result)){
				resenha.setPredefinida(false);
				resenhaService.atualizar(novaImagemResenha, resenha, dataPostagem, removerImagemResenhaEdt);
				if(notificarAlteracao){
				 emailService.notificarResenhaParaPessoas(Notificacao.RESENHA_ATUALIZADA, resenha);
				}
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
			new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName() + " | " + e.getMensagem()));
			result.include("resenhaMensagemErro", "N&atilde;o foi poss&iacute;vel enviar emails de notifica&ccedil;&atilde;o da atualiza&ccedil;&atilde;o da resenha " + resenha.getTitulo() + ". ERRO: " + e.getMensagem());
			result.redirectTo(this).resenhaAdmin();
		}		
	}
	
	@Post("/resenha/atualizar/predefinida")
	public void atualizarResenhaPredefinida(Resenha resenha, boolean notificarAlteracao){
		
		try {
			Resenha resenhaAtual = resenhaRepository.obterPorUuid(resenha.getUuid());
			if(resenha.getDescricao().isEmpty()){
				result.include("resenhaMensagemErro", "Favor inserir a resenha");
				result.include("resenha", resenhaRepository.obterPorUuid(resenha.getUuid()));
				result.redirectTo(this).resenhaPredefinida();
			}else if (!resenhaAtual.isPredefinida()){
				result.include("resenhaMensagemErro", "Esta resenha não esta mais predefinida");
				result.include("resenha", resenhaRepository.obterPorUuid(resenha.getUuid()));
				result.redirectTo(this).resenhaPredefinida();
			}else {
				String descricao  = resenha.getDescricao();
				resenha = resenhaRepository.obterPorUuid(resenha.getUuid());
				resenha.setDescricao(descricao);
				resenha.setPredefinida(false);
				resenhaRepository.atualizar(resenha);
				result.include("resenhaMensagemSucesso", "Resenha Atualizada com sucesso");
				if(notificarAlteracao){
					 emailService.notificarResenhaParaPessoas(Notificacao.RESENHA_ATUALIZADA, resenha);
				}
				result.redirectTo(this).resenhaPredefinida();
			}	
		} catch (EmailException e) {
			new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName() + " | " + e.getMensagem()));
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
			result.include("flagBuscarResenhas", true);	
			result.include("flagListarResenhas", true);
			result.include("resenhas", resenhas);
		}
		
		result.redirectTo(this).resenhaAdmin();
	}
	
	@Restrito
	@Get("/resenha/listar")
	public void listarTodas(){
		List<Resenha> resenhas = resenhaRepository.listar(true);		
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
	@Get("/resenha/categorias/edicao")
	public void listaCategoriasParaEdicao(long id){
		List<Categoria> categoriasCadastradas =  categoriaRepository.listarPorTipo(TipoCategoria.Resenha);
		Categoria categoriaAtual = categoriaRepository.obterPor(id);
		List<Categoria> categorias = new ArrayList<Categoria>();
		if (categoriaAtual != null)  categorias.add(categoriaAtual);
		categorias.addAll(categoriasCadastradas);		
		result.use(json()).withoutRoot().from(categorias).serialize();
	}
	
	@Restrito
	@Post("/resenha/categoria/nova")
	public void cadastrarNovaCategoria(String categoria){		
		try {
			resenhaService.cadastrarCategoria(categoria);
			retornarJson("sucesso");
		} catch (Exception e) {
			retornarJson("erro");
		}		
	}
	
	@Restrito
	@Get("/resenha/comentarios/{status}")
	public void visualizarTodosOsComentarios(Status status){
		resenhaService.configurarVisualizacaoParaVisualizacaoComentarios(status, result);
		result.include("comentariosResenha", comentarioRepository.listar(status, Local.RESENHA));
		result.include("flagComentariosResenha", true);
		result.forwardTo(this).resenhaAdmin();
	}
	
	@Restrito
	@Get("/resenha/comentario/confirmar/{uuid}/{status}")
	public void confirmarComentario(String uuid, Status status){
		Comentario comentario = comentarioRepository.obterPor(uuid);
		comentario.setStatus(Status.CONFIRMADO);
		comentarioRepository.atualizar(comentario);
		result.forwardTo(this).visualizarTodosOsComentarios(status);
	}
	
	@Restrito
	@Get("/resenha/comentario/remover/{uuid}/{status}")
	public void removerComentario(String uuid, Status status){
		Comentario comentario = comentarioRepository.obterPor(uuid);
		comentarioRepository.deletar(comentario);
		result.forwardTo(this).visualizarTodosOsComentarios(status);
	}
	
	@Restrito
	@Get("/resenha/busca/view")
	public void buscarTexto(String uuid){		
		Resenha resenha = resenhaRepository.obterPorUuid(uuid);		
		result.use(json()).withoutRoot().from(resenha).exclude("id").serialize();		
	}	
	
	@Get("/resenha/editar/predefinida/{uuid}")
	public void editarResenhaPredefinida(String uuid){		
		Resenha resenha = resenhaRepository.obterPorUuid(uuid);		
		result.include("resenha", resenha);
		result.forwardTo(this).resenhaPredefinida();
	}
	
	public void resenhaPredefinida(){}
	
	@Get("/resenha/visualizador/{uuid}")
	public File downloadImagemResenha(String uuid){
		return resenhaService.visualizarImagemResenha(uuid);
	}
	
	private void retornarJson(String mensagem) {
		result.use(json()).withoutRoot().from(mensagem).serialize();
		
	}
	
	@Get("/resenha/cliente")
	public void resenhaCliente(){
		Resenha ultimaPublicacao = resenhaRepository.ultimaResenhaPublicada();
		List<Paragrafo> paragrafos = indexService.criarListaDeParagrafos(ultimaPublicacao);		
		List<Categoria> categoriasResenha = categoriaRepository.listarPorTipo(TipoCategoria.Resenha);
		result.include("ultimaPublicacao", ultimaPublicacao);
		result.include("paragrafos", paragrafos);
		result.include("categoriasResenha", categoriasResenha);
	}
		
	@Get("/resenha/cliente/listarTodas")
	public void listarTodasResenhasParaCliente(Long idCategoria){
		List<Resenha> resenhas;
		if(idCategoria == null){
			resenhas =  resenhaRepository.listar(false);
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
		Resenha resenha = resenhaRepository.obterPorUuid(uuid);
		if(resenha == null){
			result.redirectTo(IndexController.class).redirecionarParaPgErro(Local.RESENHA);
		}else{
			result.include("resenha", resenha);
			List<Paragrafo> paragrafosResenha = indexService.criarListaDeParagrafos(resenha);
			result.include("paragrafosResenha", paragrafosResenha);
			result.redirectTo(this).resenhaCliente();
		}
	}
		
	@Get("/resenha/cliente/texto")
	public void clienteVisualizarTexto(String uuid){		
		Resenha resenha = resenhaRepository.obterPorUuid(uuid);
		result.use(json()).withoutRoot().from(resenha).exclude("id").include("categoria").serialize();
	}
	
	@Get("/resenha/listar/categoria/{id}")
	public void listarResenhasPorCategoria(long id){
		listarTodasResenhasParaCliente(id);
	}
	
	@Post("/resenha/cliente/comentario/principal")
	public void clienteCadastraComentario(String uuidResenha, Comentario comentario){
		if(validacaoService.cadastrarComentario(comentario, Local.RESENHA, result)){
			Resenha resenha = resenhaRepository.obterPorUuid(uuidResenha);
			resenhaService.cadastrarComentario(uuidResenha, comentario);			
			try {
				emailService.notificarNovoComentarioParaAdmin(resenha, comentario);
			} catch (EmailException e) {
				throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
			}
			result.include("msgIndex", "Seu coment&aacute;rio foi recebido com sucesso e aguarde confirma&ccedil;&atilde;o para publica&ccedil;&atilde;o no site");
			result.redirectTo(IndexController.class).index();			
		}else{
			result.include("erroComentarioPrincipal", true);
			result.include("comentario", comentario);
			result.forwardTo(this).resenhaCliente();
		}		
	}
	
	@Post("/resenha/Cliente/comentar/viaemail")
	public void clienteCadastraComentarioViaEmailRequest(String uuidResenhaEmail, Comentario comentario){
		if(validacaoService.cadastrarComentario(comentario, Local.RESENHA, result)){
			Resenha resenha = resenhaRepository.obterPorUuid(uuidResenhaEmail);
			resenhaService.cadastrarComentario(uuidResenhaEmail, comentario);			
			try {
				emailService.notificarNovoComentarioParaAdmin(resenha, comentario);
			} catch (EmailException e) {
				throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
			}
			result.include("msgIndex", "Seu coment&aacute;rio foi recebido com sucesso e aguarde confirma&ccedil;&atilde;o para publica&ccedil;&atilde;o no site");
			result.redirectTo(IndexController.class).index();			
		}else{
			result.include("erroComentarioRequest", true);
			result.include("resenha", resenhaRepository.obterPorUuid(uuidResenhaEmail));
			result.forwardTo(this).resenhaCliente();
		}		
	}	
	
	@Get("/resenha/cliente/comentarios")
	public void obtercomentariosDeTexto(String uuid){
		Resenha resenha = resenhaRepository.obterPorUuid(uuid);
		List<Comentario> comentarios = resenha.getComentariosConfirmados();
		result.use(json()).from(comentarios).exclude("id", "status", "email").serialize();
	}
	
	@Post("/resenha/cliente/novo/comentario")
	public void clienteCadastraComentario(String uuidResenhaView, String comentarioNome, String comentarioEmail, String comentarioConteudo){
		String resultado = validacaoService.cadastrarComentario(uuidResenhaView, comentarioNome, comentarioEmail, comentarioConteudo);
		Resenha resenha = resenhaRepository.obterPorUuid(uuidResenhaView);
		if(resultado.equals("OK")){
			Comentario comentario = resenhaService.obterComentario(comentarioNome, comentarioEmail, comentarioConteudo, Local.RESENHA);
			resenhaService.cadastrarComentario(uuidResenhaView, comentario);
			try {
				emailService.notificarNovoComentarioParaAdmin(resenha, comentario);
			} catch (EmailException e) {
				throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
			}
		}
		
		result.use(json()).withoutRoot().from(resultado).serialize();
	}
}
