package br.com.ammf.controller;

import static br.com.caelum.vraptor.view.Results.json;

import java.util.List;

import br.com.ammf.exception.EmailException;
import br.com.ammf.exception.ErroAplicacao;
import br.com.ammf.exception.Excecao;
import br.com.ammf.interceptor.Restrito;
import br.com.ammf.model.Comentario;
import br.com.ammf.model.Local;
import br.com.ammf.model.Notificacao;
import br.com.ammf.model.Paragrafo;
import br.com.ammf.model.Status;
import br.com.ammf.model.Texto;
import br.com.ammf.repository.ComentarioRepository;
import br.com.ammf.repository.TextoRepository;
import br.com.ammf.service.BlogService;
import br.com.ammf.service.EmailService;
import br.com.ammf.service.IndexService;
import br.com.ammf.service.ValidacaoService;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class BlogController {
	
	private Result result;
	private IndexService indexService;
	private ValidacaoService validacaoService;
	private EmailService emailService;
	private BlogService blogService;
	private TextoRepository textoRepository;
	private ComentarioRepository comentarioRepository;	
	
	public BlogController(
			Result result, 
			IndexService indexService,
			ValidacaoService validacaoService,
			EmailService emailService,
			BlogService blogService,
			TextoRepository textoRepository,
			ComentarioRepository comentarioRepository){
		this.result = result;
		this.indexService = indexService;
		this.validacaoService = validacaoService;
		this.emailService = emailService;
		this.blogService = blogService;
		this.textoRepository = textoRepository;
		this.comentarioRepository = comentarioRepository;
	}
	
	@Restrito
	@Get("/menu/blog")
	public void blogAdmin(){}
	
	@Restrito
	@Post("/blog/novo")
	public void cadastrar(Texto texto){
		try {
			if(validacaoService.blog(texto, result)){
				blogService.cadastrarTexto(texto);
				emailService.notificarTextoParaPessoas(Notificacao.TEXTO_NOVO, texto);
				result.include("blogMensagemSucesso", "O texto <i>" + texto.getTitulo() + "</i> foi cadastrado com sucesso.");
			}else{
				result.include("flagCadastrarBlogVazio", true);
			}			
			result.redirectTo(this).blogAdmin();			
		} catch (EmailException e) {
			result.include("blogMensagemSucesso", "O texto <i>" + texto.getTitulo() + "</i> foi cadastrado com sucesso.");
			result.include("blogMensagemErro", "N&atilde;o foi poss&iacute;vel enviar os emails de notifica&ccedil;&atilde;o para os clientes referente ao cadastro do texto '" + texto.getTitulo() + "'.<br/>Mensagem de Erro: " + e.getMensagem() + ".");
			result.redirectTo(this).blogAdmin();		
		}	
	}
	
	@Restrito
	@Get("/blog/busca/texto")
	public void listarTextos(String paramConsulta){		
		List<Texto> textos = textoRepository.listarTitulos(paramConsulta);		
		result.use(json()).withoutRoot().from(textos).exclude("id", "autor", "local").serialize();		
	}
	
	@Restrito
	@Get("/blog/busca/texto/view")
	public void buscarTexto(String uuid){		
		Texto texto = textoRepository.obterPor(uuid);		
		result.use(json()).withoutRoot().from(texto).exclude("id", "autor", "local").serialize();		
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
		List<Texto> textosBlog = textoRepository.listar(Local.BLOG, "postagem", false);
		result.include("textosBlog", textosBlog);
		result.include("flagTextosblog", true);
		result.redirectTo(this).blogAdmin();
	}
	
	@Restrito
	@Get("/blog/remover/{uuid}")
	public void removerTexto(String uuid){
		textoRepository.deletar(uuid);		
		result.include("blogMensagemSucesso", "O texto foi removido com sucesso.");		
		result.redirectTo(this).listarTodos();		
	}
	
	@Restrito
	@Get("/blog/editar/{uuid}")
	public void buscarParaEditarTexto(String uuid){
		Texto texto = textoRepository.obterPor(uuid);		
		result.include("texto", texto);
		result.include("flagAbrirEdicaoTexto", true);
		result.redirectTo(this).blogAdmin();		
	}
	
	@Restrito
	@Post("/blog/atualiza")
	public void atualizarTexto(Texto texto){		
		try {
			Texto textoOriginal = blogService.atualizarTexto(texto);		
			emailService.notificarTextoParaPessoas(Notificacao.TEXTO_ATUALIZADO, textoOriginal);
			result.include("blogMensagemSucesso", "O texto '<i>" + texto.getTitulo() + "</i>' foi atualizado com sucesso");
			result.redirectTo(this).blogAdmin();			
		} catch (EmailException e) {
			result.include("blogMensagemSucesso", "O texto <i>" + texto.getTitulo() + "</i> foi atualizado com sucesso.");
			result.include("blogMensagemErro", "N&atilde;o foi poss&iacute;vel enviar os emails de notifica&ccedil;&atilde;o para os clientes referente a atualiza&ccedil;&atilde;o do texto '" + texto.getTitulo() + "'.<br/>Mensagem de Erro: " + e.getMensagem() + ".");
			result.redirectTo(this).blogAdmin();		
		}				
	}
	
	@Restrito
	@Post("/blog/travar/{uuid}")
	public void travarTextoParaEdicao(String uuid){
		Texto texto = textoRepository.obterPor(uuid);
		texto.setConfirmado(false);
		textoRepository.atualizar(texto);		
		result.use(json()).withoutRoot().from(true).serialize();
	}
	
	@Restrito
	@Post("/blog/salvaAutomativa/{uuid}")
	public void salvaAutomatica(String uuid, String texto){
		Texto textoSolicitado = textoRepository.obterPor(uuid);
		textoSolicitado.setConteudo(texto);
		textoRepository.atualizar(textoSolicitado);		
		result.use(json()).withoutRoot().from(true).serialize();
	}
	
	@Restrito
	@Get("/blog/comentarios/{status}")
	public void visualizarTodosOsComentarios(Status status){
		blogService.configurarVisualizacaoParaVisualizacaoComentarios(status, result);
		result.include("comentariosBlog", comentarioRepository.listar(status, Local.BLOG));
		result.include("flagComentariosBlog", true);
		result.forwardTo(this).blogAdmin();
	}
	
	@Restrito
	@Get("/blog/comentario/confirmar/{uuid}/{status}")
	public void confirmarComentario(String uuid, Status status){
		Comentario comentario = comentarioRepository.obterPor(uuid);
		comentario.setStatus(Status.CONFIRMADO);
		comentarioRepository.atualizar(comentario);
		result.forwardTo(this).visualizarTodosOsComentarios(status);
	}
	
	@Restrito
	@Get("/blog/comentario/remover/{uuid}/{status}")
	public void removerComentario(String uuid, Status status){
		Comentario comentario = comentarioRepository.obterPor(uuid);
		comentarioRepository.deletar(comentario);
		result.forwardTo(this).visualizarTodosOsComentarios(status);
	}
	
	/**
	 * 
	 * @param emailRequest flag para indicar, se <b><code>true</code></b> que a requisicao foi disparada 
	 * pelo email, senao o texto sera carregado pela requisicao do browser
	 * @param texto texto, solicitado via email, a ser carregado.
	 */
	@Get("/blog/cliente")
	public void blogCliente(boolean emailRequest, Texto texto){
		List<Texto> textosBlog = textoRepository.listar(Local.BLOG, "postagem", true);
		Texto ultimaPublicacao = emailRequest ? texto : textoRepository.obterUltimaPublicacao();			
		List<Paragrafo> paragrafos = indexService.criarListaDeParagrafos(ultimaPublicacao);		
		result.include("ultimaPublicacao", ultimaPublicacao);
		result.include("paragrafos", paragrafos);
		result.include("textosBlog", textosBlog);		
	}

	/**
	 * Recebe a requisicao de leitura do link de email e redireciona para blog cliente.
	 * @param uuid
	 */
	@Get("/blog/cliente/lertexto/{uuid}")
	public void lerTextoNaIntegra(String uuid){
		Texto texto = textoRepository.obterConfirmadoPor(uuid);
		if(texto == null){
			result.redirectTo(IndexController.class).redirecionarParaPgErro(Local.BLOG);
		}else{
			// flag para informar o jsp da resquisicao via email e configurar String de acordo.
			result.include("emailRequest", true);
			result.redirectTo(this).blogCliente(true, texto);		
		}		
	}
	
	@Get("/blog/cliente/texto")
	public void clienteVisualizarTexto(String uuid){		
		Texto texto = textoRepository.obterPor(uuid);
		result.use(json()).withoutRoot().from(texto).exclude("id", "local").serialize();
	}
	
	@Post("/blog/cliente/comentario")
	public void clienteCadastraComentario(String uuidTextoBlog, String comentarioNome, String comentarioEmail, String comentarioConteudo){
		String resultado = validacaoService.cadastrarComentario(uuidTextoBlog, comentarioNome, comentarioEmail, comentarioConteudo);
		Texto texto = textoRepository.obterPor(uuidTextoBlog);
		if(resultado.equals("OK")){
			Comentario comentario = blogService.obterComentario(comentarioNome, comentarioEmail, comentarioConteudo, Local.BLOG);
			blogService.cadastrarComentario(uuidTextoBlog, comentario);
			try {
				emailService.notificarNovoComentarioParaAdmin(texto, comentario);
			} catch (EmailException e) {
				throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
			}
		}
		
		result.use(json()).withoutRoot().from(resultado).serialize();
	}
	
	@Post("/blog/cliente/comentario/principal")
	public void clienteCadastraComentario(String uuidTexto, Comentario comentario){
		if(validacaoService.cadastrarComentario(comentario, Local.BLOG, result)){
			Texto texto = textoRepository.obterPor(uuidTexto);
			blogService.cadastrarComentario(uuidTexto, comentario);
			try {
				emailService.notificarNovoComentarioParaAdmin(texto, comentario);
			} catch (EmailException e) {
				throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
			}
			result.include("msgIndex", "Seu coment&aacute;rio foi recebido com sucesso e aguarde confirma&ccedil;&atilde;o para publica&ccedil;&atilde;o no site");
			result.redirectTo(IndexController.class).index();			
		}else{
			result.include("erroComentarioPrincipal", true);
			result.include("comentario", comentario);
			result.forwardTo(this).blogCliente(false, null);
		}		
	}
	
	@Get("/blog/cliente/texto/comentarios")
	public void obtercomentariosDeTexto(String uuid){
		Texto texto = textoRepository.obterPor(uuid);
		List<Comentario> comentarios = texto.getComentariosConfirmados();
		result.use(json()).from(comentarios).exclude("id", "status", "email").serialize();
	}
			
		
	

}
