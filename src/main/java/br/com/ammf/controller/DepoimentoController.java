package br.com.ammf.controller;

import java.util.List;

import br.com.ammf.exception.EmailException;
import br.com.ammf.exception.ErroAplicacao;
import br.com.ammf.exception.Excecao;
import br.com.ammf.interceptor.Restrito;
import br.com.ammf.model.Depoimento;
import br.com.ammf.model.Status;
import br.com.ammf.repository.DepoimentoRepository;
import br.com.ammf.service.EmailService;
import br.com.ammf.service.PessoaService;
import br.com.ammf.service.ValidacaoService;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class DepoimentoController {
	
	private Result result;
	private DepoimentoRepository depoimentoRepository;
	private ValidacaoService validacaoService;
	private EmailService emailService;
	
	public DepoimentoController(
			Result result,
			DepoimentoRepository depoimentoRepository,
			ValidacaoService validacaoService,
			PessoaService pessoaService,
			EmailService emailService){
		this.result = result;
		this.depoimentoRepository = depoimentoRepository;
		this.validacaoService = validacaoService;
		this.emailService = emailService;
	}
	
	@Get("/cliente/depoimentos")
	public void depoimentoCliente(){
		List<Depoimento> depoimentos = depoimentoRepository.listarTodos(Status.CONFIRMADO);
		result.include("depoimentos", depoimentos);		
	}
	
	@Post("/cliente/novoDepoimento")
	public void cadastrarNovoDepoimento(Depoimento depoimento){		
		boolean validado = validacaoService.depoimento(depoimento, result);		
		if(validado){
			depoimentoRepository.cadastrar(depoimento);
			try {
				emailService.notificarNovoDepoimentoParaAdmin(depoimento);
			} catch (EmailException e) {
				throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
			}
			result.include("msgDepoimento", depoimento.getAutor().toUpperCase() + " seu depoimento foi recebido com sucesso, por&eacute;m aguarda confirma&ccedil;&atilde;o");
		}else{
			result.include("msgErroDepoimento", true);
		}		
		result.forwardTo(this).depoimentoCliente();
	}
	
	@Restrito
	@Get("/menu/depoimentos")
	public void depoimentoAdmin(){		
		result.include("totalDepoimentosCadastrados", depoimentoRepository.getTotalDepoimentosCadastrados());
		result.include("totalDepoimentosExibidos", depoimentoRepository.getTotalDepoimentosConfirmados());
		result.include("totalDepoimentosPendentes", depoimentoRepository.getTotalDepoimentosPendentes());
	}	
	
	@Restrito
	@Get("/menu/depoimentos/confirmar/{uuid}/{destino}")
	public void confirmarDepoimento(String uuid, String destino){
		depoimentoRepository.confirmar(uuid);		
		result.include("msgDepoimento", "Depoimento confirmado com sucesso");
		if(destino.equals("OK")){
			result.redirectTo(this).visualizarTodosOsDepoimentosConfirmados();
		}else if(destino.equals("NOK")){
			result.redirectTo(this).visualizarTodosOsDepoimentosPendentesConfirmacao();
		}else if(destino.equals("ALL")){
			result.redirectTo(this).visualizarTodosOsDepoimentosCadastrados();
		}else{
			result.redirectTo(this).depoimentoAdmin();
		}		
	}
	
	@Restrito
	@Get("/menu/depoimentos/excluir/{uuid}/{destino}")
	public void excluirDepoimento(String uuid, String destino){
		depoimentoRepository.deletar(uuid);
		result.include("msgDepoimento", "Depoimento exclu&iacute;do com sucesso");
		if(destino.equals("OK")){
			result.redirectTo(this).visualizarTodosOsDepoimentosConfirmados();
		}else if(destino.equals("NOK")){
			result.redirectTo(this).visualizarTodosOsDepoimentosPendentesConfirmacao();
		}else if(destino.equals("ALL")){
			result.redirectTo(this).visualizarTodosOsDepoimentosCadastrados();
		}else{
			result.redirectTo(this).depoimentoAdmin();
		}	
	}
	
	@Restrito
	@Get("/menu/busca/depoimento")
	public void listarDepoimentos(String paramConsulta){
		List<Depoimento> depoimentos = depoimentoRepository.listarPorNomeEEmail(paramConsulta);
		result.include("depoimentosSolicitados", depoimentos);
		result.include("backgroundTitulo", "corCinza");		
		result.include("labelResultadoConsulta", depoimentos.size() + " ocorr&ecirc;ncia(s) para a pesquisa: <b>" + paramConsulta + "</b>");
		result.include("tituloDepoimentosSolicitados", "Visualiza&ccedil;&atilde;o de todos os depoimentos de <b>"+ paramConsulta + "</b>");
		result.include("flagMostrarBusca", true);		
		result.include("isDepoimentosCadastrados", true);
		if(depoimentos.size() > 0) result.include("depoimentosRequest", true);
		result.redirectTo(this).depoimentoAdmin();
		/*result.use(json()).withoutRoot().from(depoimentos).exclude("id").serialize();*/		
	}
	
	@Restrito
	@Get("/adm/depoimentos/cadastrados")
	public void visualizarTodosOsDepoimentosCadastrados(){
		List<Depoimento> depoimentos = depoimentoRepository.listarTodos();
		result.include("depoimentosSolicitados", depoimentos);
		result.include("backgroundTitulo", "corCinza");
		/*result.use(json()).withoutRoot().from(depoimentos).exclude("id").serialize();*/
		result.include("tituloDepoimentosSolicitados", "Visualiza&ccedil;&atilde;o de todos os depoimentos cadastrados");
		result.include("isDepoimentosCadastrados", true);
		result.include("depoimentosRequest", true);
		result.redirectTo(this).depoimentoAdmin();	
	}
	
	@Restrito
	@Get("/adm/depoimentos/confirmados")
	public void visualizarTodosOsDepoimentosConfirmados(){
		List<Depoimento> depoimentos = depoimentoRepository.listarTodos(Status.CONFIRMADO);
		result.include("depoimentosSolicitados", depoimentos);
		result.include("backgroundTitulo", "corVerde");
		result.include("tituloDepoimentosSolicitados", "Visualiza&ccedil;&atilde;o de todos os depoimentos confirmados");
		result.include("isDepoimentosConfirmados", true);
		result.include("depoimentosRequest", true);
		result.redirectTo(this).depoimentoAdmin();	
	}
	
	@Restrito
	@Get("/adm/depoimentos/pendentes")
	public void visualizarTodosOsDepoimentosPendentesConfirmacao(){
		List<Depoimento> depoimentos = depoimentoRepository.listarTodos(Status.PENDENTE);
		result.include("depoimentosSolicitados", depoimentos);
		result.include("backgroundTitulo", "corVermelho");
		result.include("tituloDepoimentosSolicitados", "Visualiza&ccedil;&atilde;o dos depoimentos pendentes confirma&ccedil;&atilde;o");
		result.include("isDepoimentosPendentes", true);
		result.include("depoimentosRequest", true);
		result.redirectTo(this).depoimentoAdmin();	
	}	
}
