package br.com.ammf.controller;

import static br.com.caelum.vraptor.view.Results.json;

import java.util.List;

import javax.swing.JOptionPane;

import com.sun.org.apache.xalan.internal.xsltc.compiler.sym;

import br.com.ammf.interceptor.Restrito;
import br.com.ammf.model.Depoimento;
import br.com.ammf.model.Status;
import br.com.ammf.repository.DepoimentoRepository;
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
	
	public DepoimentoController(
			Result result,
			DepoimentoRepository depoimentoRepository,
			ValidacaoService validacaoService,
			PessoaService pessoaService){
		this.result = result;
		this.depoimentoRepository = depoimentoRepository;
		this.validacaoService = validacaoService;
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
	@Get("/menu/depoimentos/confirmar/{uuid}")
	public void confirmarDepoimento(String uuid){
		depoimentoRepository.confirmar(uuid);		
		result.include("msgDepoimento", "Depoimento confirmado com sucesso");
		result.redirectTo(this).depoimentoAdmin();
	}
	
	@Restrito
	@Get("/menu/depoimentos/excluir/{uuid}")
	public void excluirDepoimento(String uuid){
		depoimentoRepository.deletar(uuid);
		result.include("msgDepoimento", "Depoimento exclu&iacute;do com sucesso");
		result.redirectTo(this).depoimentoAdmin();
	}
	
	@Restrito
	@Get("/menu/busca/depoimento")
	public void listarDepoimentos(String paramConsulta){
		List<Depoimento> depoimentos = depoimentoRepository.listarPorNomeEEmail(paramConsulta);
		result.include("depoimentosSolicitados", depoimentos);
		result.include("labelResultadoConsulta", depoimentos.size() + " resultados para a busca '<b>" + paramConsulta + "</b>'");
		result.include("tituloDepoimentosSolicitados", "<h2>Visualiza&ccedil;&atilde;o de todos os depoimentos de <b>"+ paramConsulta + "</b></h2>");
		result.include("flagMostrarBusca", true);
		result.redirectTo(this).depoimentoAdmin();
		/*result.use(json()).withoutRoot().from(depoimentos).exclude("id").serialize();*/		
	}
	
	@Restrito
	@Get("/adm/depoimentos/cadastrados")
	public void visualizarTodosOsDepoimentosCadastrados(){
		List<Depoimento> depoimentos = depoimentoRepository.listarTodos();
		result.include("depoimentosSolicitados", depoimentos);
		/*result.use(json()).withoutRoot().from(depoimentos).exclude("id").serialize();*/
		result.include("tituloDepoimentosSolicitados", "<h2>Visualiza&ccedil;&atilde;o de todos os depoimentos cadastrados</h2>");
		result.redirectTo(this).depoimentoAdmin();	
	}
	
	@Restrito
	@Get("/adm/depoimentos/confirmados")
	public void visualizarTodosOsDepoimentosConfirmados(){
		List<Depoimento> depoimentos = depoimentoRepository.listarTodos(Status.CONFIRMADO);
		result.include("depoimentosSolicitados", depoimentos);
		result.include("tituloDepoimentosSolicitados", "<h2>Visualiza&ccedil;&atilde;o de todos os depoimentos confirmados</h2>");
		result.redirectTo(this).depoimentoAdmin();	
	}
	
	@Restrito
	@Get("/adm/depoimentos/pendentes")
	public void visualizarTodosOsDepoimentosPendentesConfirmacao(){
		List<Depoimento> depoimentos = depoimentoRepository.listarTodos(Status.PENDENTE);
		result.include("depoimentosSolicitados", depoimentos);
		result.include("tituloDepoimentosSolicitados", "<h2>Visualiza&ccedil;&atilde;o dos depoimentos pendentes confirma&ccedil;&atilde;o</h2>");
		result.redirectTo(this).depoimentoAdmin();	
	}	
}
