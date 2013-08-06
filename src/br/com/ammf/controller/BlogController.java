package br.com.ammf.controller;

import static br.com.caelum.vraptor.view.Results.json;

import java.util.List;

import br.com.ammf.exception.EmailException;
import br.com.ammf.interceptor.Restrito;
import br.com.ammf.model.Local;
import br.com.ammf.model.Notificacao;
import br.com.ammf.model.Paragrafo;
import br.com.ammf.model.Texto;
import br.com.ammf.repository.TextoRepository;
import br.com.ammf.service.EmailService;
import br.com.ammf.service.IndexService;
import br.com.ammf.service.ValidacaoService;
import br.com.ammf.service.imp.IndexServiceImp;
import br.com.ammf.utils.DataUtils;
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
	private TextoRepository textoRepository;
	
	public BlogController(
			Result result, 
			IndexService indexService,
			ValidacaoService validacaoService,
			EmailService emailService,
			TextoRepository textoRepository){
		this.result = result;
		this.indexService = indexService;
		this.validacaoService = validacaoService;
		this.emailService = emailService;
		this.textoRepository = textoRepository;
	}
	
	@Restrito
	@Get("/blog/editar")
	public void blogAdmin(){}
	
	@Restrito
	@Post("/blog/novo")
	public void cadastrar(Texto texto){
		try {
			boolean validado = validacaoService.blog(texto, result);		
			if(validado){
				texto.setLocal(Local.BLOG);
				texto.setPostagem(DataUtils.getDateNow());		
				textoRepository.cadastrar(texto);
				emailService.notificarPessoas(Notificacao.TEXTO_NOVO, texto);
				result.include("blogMensagemSucesso", "O texto <i>" + texto.getTitulo() + "</i> foi cadastrado com sucesso.");
			}else{
				result.include("flagCadastrarBlogVazio", true);
				result.include("comErro", "Erro");
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
		result.include("flagTextosblog", true);
		result.redirectTo(this).blogAdmin();
	}
	
	@Restrito
	@Get("/blog/remover/{uuid}")
	public void removerTexto(String uuid){
		textoRepository.deletar(uuid);		
		result.include("blogMensagemSucesso", "O texto foi removido com sucesso.");
		result.redirectTo(this).blogAdmin();		
	}
	
	@Restrito
	@Post("/blog/atualiza")
	public void atualizarTexto(Texto texto){
		
		try {
			Texto textoOriginal = textoRepository.obterPor(texto.getUuid());
			textoOriginal.setAutor(texto.getAutor());
			textoOriginal.setTitulo(texto.getTitulo());
			textoOriginal.setConteudo(texto.getConteudo());
			textoRepository.atualizar(textoOriginal);		
			emailService.notificarPessoas(Notificacao.TEXTO_ATUALIZADO, textoOriginal);
			result.include("blogMensagemSucesso", "O texto '<i>" + texto.getTitulo() + "</i>' foi atualizado com sucesso");
			result.redirectTo(this).blogAdmin();			
		} catch (EmailException e) {
			result.include("blogMensagemSucesso", "O texto <i>" + texto.getTitulo() + "</i> foi atualizado com sucesso.");
			result.include("blogMensagemErro", "N&atilde;o foi poss&iacute;vel enviar os emails de notifica&ccedil;&atilde;o para os clientes referente a atualiza&ccedil;&atilde;o do texto '" + texto.getTitulo() + "'.<br/>Mensagem de Erro: " + e.getMensagem() + ".");
			result.redirectTo(this).blogAdmin();		
		}				
	}
	
	/**
	 * 
	 * @param emailRequest flag para indicar, se <b><code>true</code></b> que a requisicao foi disparada 
	 * pelo email, senao o texto sera carregado pela requisicao do browser
	 * @param texto texto, solicitado via email, a ser carregado.
	 */
	@Get("/blog/cliente")
	public void blogCliente(boolean emailRequest, Texto texto){
		List<Texto> textosBlog = textoRepository.listar(Local.BLOG, "postagem");
		Texto ultimaPublicacao = emailRequest ? texto : textoRepository.obterUuidUltimaPublicacao();			
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
		Texto texto = textoRepository.obterPor(uuid);
		System.out.println("data: " + texto.getDataFormatada());
		// flag para informar o jsp da resquisicao via email e configurar String de acordo.
		result.include("emailRequest", true);
		result.redirectTo(this).blogCliente(true, texto);		
	}
	
	@Get("/blog/cliente/texto")
	public void clienteVisualizarTexto(String uuid){		
		Texto texto = textoRepository.obterPor(uuid);
		result.use(json()).withoutRoot().from(texto).exclude("id", "local") .serialize();
	}

}
