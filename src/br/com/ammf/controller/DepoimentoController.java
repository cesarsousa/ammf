package br.com.ammf.controller;

import static br.com.caelum.vraptor.view.Results.json;

import java.util.List;

import br.com.ammf.interceptor.Restrito;
import br.com.ammf.model.Texto;
import br.com.ammf.repository.TextoRepository;
import br.com.ammf.service.PessoaService;
import br.com.ammf.service.ValidacaoService;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class DepoimentoController {
	
	private Result result;
	private TextoRepository textoRepository;
	private ValidacaoService validacaoService;
	private PessoaService pessoaService;
	
	public DepoimentoController(
			Result result,
			TextoRepository textoRepository,
			ValidacaoService validacaoService,
			PessoaService pessoaService){
		this.result = result;
		this.textoRepository = textoRepository;
		this.validacaoService = validacaoService;
		this.pessoaService = pessoaService;
	}
	
	@Get("/cliente/depoimentos")
	public void depoimentoCliente(){
		List<Texto> depoimentos = textoRepository.listarDepoimentos(true);
		result.include("depoimentos", depoimentos);		
	}
	
	@Post("/cliente/novoDepoimento")
	public void cadastrarNovoDepoimento(Texto texto){		
		boolean validado = validacaoService.depoimento(texto, result);		
		if(validado){
			pessoaService.cadastrarDepoimento(texto);
			result.include("msgDepoimento", texto.getAutor().toUpperCase() + " seu depoimento foi recebido com sucesso, por&eacute;m aguarda confirma&ccedil;&atilde;o");
		}else{
			result.include("msgErroDepoimento", true);
		}		
		result.forwardTo(this).depoimentoCliente();
	}
	
	@Restrito
	@Get("/menu/depoimentos")
	public void depoimentos(){		
		result.include("totalDepoimentosCadastrados", textoRepository.obterTotalDepoimentosCadastrados());
		result.include("totalDepoimentosExibidos", textoRepository.obterTotalDepoimentosConfirmados());
		result.include("totalDepoimentosPendentes", textoRepository.obterTotalDepoimentosPendentes());
	}	
	
	@Restrito
	@Get("/menu/depoimentos/confirmar/{uuid}")
	public void confirmarDepoimento(String uuid){
		textoRepository.confirmarDepoimento(uuid);		
		result.include("msgDepoimento", "Depoimento confirmado com sucesso");
		result.redirectTo(this).depoimentos();
	}
	
	@Restrito
	@Get("/menu/depoimentos/excluir/{uuid}")
	public void excluirDepoimento(String uuid){
		textoRepository.deletarDepoimento(uuid);
		result.include("msgDepoimento", "Depoimento exclu&iacute;do com sucesso");
		result.redirectTo(this).depoimentos();
	}
	
	@Restrito
	@Get("/menu/busca/depoimento")
	public void listarDepoimentos(String paramConsulta){		
		List<Texto> depoimentos = textoRepository.listarDepoimentosPorNomeEEmail(paramConsulta);		
		result.use(json()).withoutRoot().from(depoimentos).exclude("id").serialize();		
	}
	
	@Restrito
	@Get("/adm/depoimentos/cadastrados")
	public void visualizarTodosOsDepoimentosCadastrados(){
		List<Texto> depoimentos = textoRepository.listarDepoimentosTodos();
		result.include("depoimentosSolicitados", depoimentos);
		result.include("backgroundTitulo", "backAzul");
		result.include("msgTitulo", "Visualiza&ccedil;&atilde;o de todos os depoimentos cadastrados");
		result.redirectTo(this).depoimentos();	
	}
	
	@Restrito
	@Get("/adm/depoimentos/confirmados")
	public void visualizarTodosOsDepoimentosConfirmados(){
		List<Texto> depoimentos = textoRepository.listarDepoimentos(true);
		result.include("depoimentosSolicitados", depoimentos);
		result.include("backgroundTitulo", "backVerde");
		result.include("msgTitulo", "Visualiza&ccedil;&atilde;o de todos os depoimentos confirmados");
		result.redirectTo(this).depoimentos();	
	}
	
	@Restrito
	@Get("/adm/depoimentos/pendentes")
	public void visualizarTodosOsDepoimentosPendentesConfirmacao(){
		List<Texto> depoimentos = textoRepository.listarDepoimentos(false);
		result.include("depoimentosSolicitados", depoimentos);
		result.include("backgroundTitulo", "backVermelho");
		result.include("msgTitulo", "Visualiza&ccedil;&atilde;o dos depoimentos pendentes confirma&ccedil;&atilde;o");
		result.redirectTo(this).depoimentos();	
	}
	
	
	
	
	
}
