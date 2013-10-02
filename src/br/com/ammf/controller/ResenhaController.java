package br.com.ammf.controller;

import static br.com.caelum.vraptor.view.Results.json;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.swing.JOptionPane;

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
import br.com.ammf.utils.DataUtils;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

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
	public void cadastrarResenha(Resenha resenha){
		try {
			if(validacaoService.novaResenha(resenha, result)){			
				resenhaService.cadastrar(resenha);
				emailService.notificarResenhaParaPessoas(Notificacao.RESENHA_NOVA, resenha);
				result.include("resenhaMensagemSucesso", "Resenha cadastrada com sucesso");
			}
			result.redirectTo(this).resenhaAdmin();			
		} catch (EmailException e) {
			result.include("resenhaMensagemErro", "N&atilde;o foi poss&iacute;vel enviar emails de notifica&ccedil;&atilde;o da atualiza&ccedil;&atilde;o da resenha " + resenha.getTitulo() + ". ERRO: " + e.getMessage());
			result.redirectTo(this).resenhaAdmin();
		}		
	}
	
	@Restrito
	@Post("/resenha/atualizar")
	public void atualizar(String dataPostagem, Resenha resenha){
		try {
			if(validacaoService.atualizarResenha(resenha, result)){
				resenhaService.atualizar(resenha, dataPostagem);
				emailService.notificarResenhaParaPessoas(Notificacao.RESENHA_ATUALIZADA, resenha);
				result.include("resenhaMensagemSucesso", "Resenha atualizada com sucesso");
			}else{
				result.include("resenhaErroAtualizarCadastro", true);
				result.include("resenhaEditarCadastro", true);
			}
			result.redirectTo(this).resenhaAdmin();
		} catch (Exception e) {
			result.include("resenhaMensagemErro", "N&atilde;o foi poss&iacute;vel efetuar a atualiza&ccedil;&atilde;o da resenha " + resenha.getTitulo() + ". ERRO: " + e.getMessage());
			result.redirectTo(this).resenhaAdmin();
		}		
	}
	
	@Restrito
	@Get("/resenha/busca")
	public void buscar(String parametro){
		List<Texto> resenhas = resenhaRepository.listar(parametro);		
		if(resenhas.isEmpty()){
			result.include("flagBuscarResenhas", true);
			result.include("resultBuscarResenhas", "Sem resultados de resenha para a pesquisa '" + parametro + "'");			
		}else{
			result.include("flagListarResenhas", true);
			result.include("resenhas", resenhas);
		}
		
		result.redirectTo(this).resenhaAdmin();
	}
	
	@Restrito
	@Get("/resenha/listar")
	public void listar(){
		List<Texto> resenhas = resenhaRepository.listar();		
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
		result.redirectTo(this).resenhaAdmin();
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
	
	private void retornarJson(String mensagem) {
		result.use(json()).withoutRoot().from(mensagem).serialize();
		
	}
	
	
	
	
	
	
	
	
	
	
	
}
