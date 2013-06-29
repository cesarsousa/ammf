package br.com.ammf.controller;

import static br.com.caelum.vraptor.view.Results.json;

import java.util.ArrayList;
import java.util.List;

import br.com.ammf.exception.DBException;
import br.com.ammf.exception.EmailException;
import br.com.ammf.interceptor.Restrito;
import br.com.ammf.model.Pessoa;
import br.com.ammf.model.Situacao;
import br.com.ammf.model.Status;
import br.com.ammf.model.Texto;
import br.com.ammf.repository.PessoaRepository;
import br.com.ammf.repository.TextoRepository;
import br.com.ammf.service.EmailService;
import br.com.ammf.service.MenuService;
import br.com.ammf.service.PessoaService;
import br.com.ammf.service.ValidacaoService;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class PessoaController {
	
	private Result result;
	private PessoaRepository pessoaRepository;	
	private ValidacaoService validacaoService;
	private PessoaService pessoaService;
	private EmailService emailService;
	
	public PessoaController(
			Result result, 
			PessoaRepository pessoaRepository,			
			ValidacaoService validacaoService,
			PessoaService pessoaService,
			EmailService emailService){
		this.result = result;
		this.pessoaRepository = pessoaRepository;		
		this.validacaoService = validacaoService;
		this.pessoaService = pessoaService;
		this.emailService = emailService;
	}
	
	@Restrito
	@Get("/menu/cadastro")
	public void cadastroAdmin(){}
	
	@Restrito
	@Post("/menu/cadastrar")
	public void cadastrar(Pessoa pessoa){
				
		boolean validado = validacaoService.pessoa(pessoa, result);
		if(validado){			
			try {
				pessoaService.cadastrarComoAdm(pessoa);
				emailService.notificacarNovoCadastroFeitoPeloAdm(pessoa);
				redirecionarParaMenuAdm("mensagemMenuSecundario", "O cadastro de " + pessoa.getNome() + " foi realizado com sucesso");
			} catch (EmailException e) {				
				e.printStackTrace();
				redirecionarParaMenuAdm("mensagemErro", "N&atilde;o foi poss&iacute;vel enviar o email de notifica&ccedil;&atilde;o para " + pessoa.getNome() + " referente ao cadastro<br/>Mensagem de Erro: " + e.getMensagem() + ".");
			} 		
		}else{
			result.include("flagCadastroPessoaVazio", true);
			redirecionarParaCadastroAdmin();
		}		
	}
	
	
	@Restrito
	@Get("/pessoa/listar")
	public void listarPessoas(){
		List<Pessoa> pessoas = pessoaRepository.listar();
		result.include("pessoasSolicitadas", pessoas);
		result.include("tituloPessoasSolicitadas", pessoas.size() + " Pessoas Cadastradas");
		result.include("isPessoasCadastradas", true);
		result.include("cssCorFonte", "corCinza");
		result.include("visualizarPessoas", true);
		/*result.use(json()).withoutRoot().from(pessoas).exclude("id").serialize();*/
		result.redirectTo(this).cadastroAdmin();
	}
	
	@Restrito
	@Get("/pessoa/confirmadas")
	public void listarPessoasConfirmadas(){
		List<Pessoa> pessoas = pessoaRepository.listarPorStatus(Status.CONFIRMADO);
		result.include("pessoasSolicitadas", pessoas);
		result.include("tituloPessoasSolicitadas", pessoas.size() + " Pessoas Confirmadas");
		result.include("isPessoasConfirmadas", true);
		result.include("cssCorFonte", "corVerde");
		result.include("visualizarPessoas", true);
		/*result.use(json()).withoutRoot().from(pessoas).exclude("id").serialize();*/
		result.redirectTo(this).cadastroAdmin();
	}
	
	@Restrito
	@Get("/pessoa/pendentes")
	public void listarPessoasPendentes(){
		List<Pessoa> pessoas = pessoaRepository.listarPorStatus(Status.PENDENTE);
		result.include("pessoasSolicitadas", pessoas);
		result.include("tituloPessoasSolicitadas", pessoas.size() + " Pessoas Pendentes Confirma&ccedil;&atilde;o");
		result.include("isPessoasPendentes", true);
		result.include("cssCorFonte", "corVermelho");
		result.include("visualizarPessoas", true);
		/*result.use(json()).withoutRoot().from(pessoas).exclude("id").serialize();*/
		result.redirectTo(this).cadastroAdmin();
	}
	
	@Restrito
	@Get("/pessoa/remover/{uuid}")
	public void removerPessoa(String uuid){
		Pessoa pessoa = pessoaRepository.obter(uuid);		
		pessoaRepository.remover(pessoa);
		result.include("msgCadastro", "Cadastro de '<b>" + pessoa.getNome() + "</b>' removido com sucesso.");
		result.redirectTo(this).cadastroAdmin();		
	}
	
	@Restrito
	@Get("/pessoa/confirmar/{uuid}")
	public void confirmarPessoa(String uuid){
		Pessoa pessoa = pessoaRepository.obter(uuid);
		try {					
			pessoaRepository.confirmar(pessoa);
			emailService.enviarSolicitacaoParaConfirmacaoCadastro(pessoa);			
			result.include("msgCadastro", "Cadastro de '<b>" + pessoa.getNome() + "</b>' confirmado com sucesso.");
			result.redirectTo(this).cadastroAdmin();
			
		} catch (EmailException e) {
			e.printStackTrace();
			redirecionarParaMenuAdm("mensagemErro", "N&atilde;o foi poss&iacute;vel enviar o email de solicita&ccedil;&atilde;o de confirma&ccedil;&atilde;o para " + pessoa.getNome() + " referente ao cadastro<br/>Mensagem de Erro: " + e.getMensagem() + ".");
		}
	}
		
	@Restrito
	@Get("/pessoa/consulta")
	public void consultar(String paramConsulta){
		List<Pessoa> pessoas = new ArrayList<Pessoa>();
		if(pessoaService.ehCodigo(paramConsulta)){
			pessoas = pessoaRepository.obter(Long.parseLong(paramConsulta));
		}else{
			pessoas = pessoaRepository.listarPorNomeEmail(paramConsulta);		
		}		
		result.use(json()).withoutRoot().from(pessoas).serialize();		
	}
	
	@Get("/cliente/cadastro")
	public void cadastroCliente(){}
	
	@Post("/cliente/cadastrar")
	public void cadastrarCliente(Pessoa pessoa){
		boolean validado = validacaoService.pessoa(pessoa, result);
		if(validado){
			try {				
				pessoaService.cadastrarComoCliente(pessoa);
				emailService.notificacarNovoCadastroFeitoPeloCliente(pessoa);				
				redirecionarParaIndex(pessoa);
			} catch (DBException e) {
				e.printStackTrace();
				result.include("msgErroCadastro", "Opps! Ocorreu um erro inexperado, infelizmente n&atilde;o foi poss&iacute;vel realizar o seu cadastro.<br/>Por favor tente novamente mais tarde.");
				redirecionarParaCadastroCliente();
			} catch (EmailException e) {				
				e.printStackTrace();
				redirecionarParaIndex(pessoa);
			}
		}else{			
			redirecionarParaCadastroCliente();
		}
	}
	
	@Get("/pessoa/remover/email/{uuid}")
	public void removerAssinaturaEmail(String uuid){		
		Pessoa pessoa = pessoaRepository.obter(uuid);
		if(pessoa == null){
			result.include("pessoaInvalida", true);
		}else{
			result.include("pessoa", pessoa);
		}		
	}
	
	@Get("/pessoa/confirmaRemocao/email/")
	public void confirmarRemocaoEmail(String uuid){
		Pessoa pessoa = pessoaRepository.obter(uuid);
		pessoaRepository.remover(pessoa);		
		result.redirectTo(this).removerAssinaturaEmail(uuid);		
	}
	
	@Get("/pessoa/ativar/email/{uuid}")
	public void ativarAssinaturaEmail(String uuid){		
		Pessoa pessoa = pessoaRepository.obter(uuid);
		pessoaRepository.ativar(pessoa);
		result.redirectTo(IndexController.class).site();
	}	

	private void redirecionarParaIndex(Pessoa pessoa) {
		result.include("msgIndex", "<b>" + pessoa.getNome() + "</b>, seu cadastro foi recebido com sucesso.<br/>Aguarde que em breve voc&ecirc; receber&aacute; uma confirma&ccedil;&atilde;o por email.");
		result.redirectTo(IndexController.class).index();		
	}

	private void redirecionarParaCadastroCliente() {
		result.redirectTo(this).cadastroCliente();		
	}
	
	private void redirecionarParaCadastroAdmin() {
		result.redirectTo(this).cadastroAdmin();		
	}
	
	private void redirecionarParaMenuAdm(String nomeMensagem, String mensagem) {
		result.include(nomeMensagem, mensagem);
		result.forwardTo(MenuController.class).menu();
	}
}
