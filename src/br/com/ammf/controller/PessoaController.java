package br.com.ammf.controller;

import static br.com.caelum.vraptor.view.Results.json;

import java.util.List;

import br.com.ammf.exception.DBException;
import br.com.ammf.exception.EmailException;
import br.com.ammf.interceptor.Restrito;
import br.com.ammf.model.Pessoa;
import br.com.ammf.model.Status;
import br.com.ammf.model.Texto;
import br.com.ammf.repository.PessoaRepository;
import br.com.ammf.repository.TextoRepository;
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
	private MenuService menuService;
	private ValidacaoService validacaoService;
	private PessoaService pessoaService;
	
	public PessoaController(
			Result result, 
			PessoaRepository pessoaRepository,
			MenuService menuService,
			ValidacaoService validacaoService,
			PessoaService pessoaService){
		this.result = result;
		this.pessoaRepository = pessoaRepository;
		this.menuService = menuService;
		this.validacaoService = validacaoService;
		this.pessoaService = pessoaService;
	}
	
	@Restrito
	@Get("/menu/cadastro")
	public void cadastro(){}
	
	@Restrito
	@Post("/menu/cadastrar")
	public void cadastrar(Pessoa pessoa){
				
		boolean validado = validacaoService.pessoa(pessoa, result);
		if(validado){			
			try {
				menuService.cadastrar(pessoa);
				menuService.enviarEmailNotificacaoCadastro(pessoa);
				redirecionarParaMenuAdm("mensagemMenuSecundario", "O cadastro de " + pessoa.getNome() + " foi realizado com sucesso");
			} catch (EmailException e) {				
				e.printStackTrace();
				redirecionarParaMenuAdm("mensagemErro", "N&atilde;o foi poss&iacute;vel enviar o email de notifica&ccedil;&atilde;o para " + pessoa.getNome() + " referente ao cadastro<br/>Mensagem de Erro: " + e.getMensagem() + ". Verifique em sua <b>Configura&ccedil;&otilde;es da Conta</b> os seus dados de cadastro.");
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
		result.use(json()).withoutRoot().from(pessoas).exclude("id").serialize();
	}
	
	@Restrito
	@Get("/pessoa/confirmadas")
	public void listarPessoasConfirmadas(){
		List<Pessoa> pessoas = pessoaRepository.listarPorStatus(Status.CONFIRMADO);
		result.use(json()).withoutRoot().from(pessoas).exclude("id").serialize();
	}
	
	@Restrito
	@Get("/pessoa/pendentes")
	public void listarPessoasPendentes(){
		List<Pessoa> pessoas = pessoaRepository.listarPorStatus(Status.PENDENTE);
		result.use(json()).withoutRoot().from(pessoas).exclude("id").serialize();
	}	
	
	@Get("/remover/email/{uuid}")
	public void removerAssinaturaEmail(String uuid){
		
		
		//TODO remover assinatura do cliente via email
		System.out.println(".........remover assinatura de email de uuid: " + uuid);
	}
	
	@Restrito
	@Get("/pessoa/remover/{uuid}")
	public void removerPessoa(String uuid){
		Pessoa pessoa = pessoaRepository.obter(uuid);		
		pessoaRepository.remover(pessoa);
		result.include("msgCadastro", "Cadastro de '<b>" + pessoa.getNome() + "</b>' removido com sucesso.");
		result.redirectTo(this).cadastro();		
	}
	
	@Restrito
	@Get("/pessoa/confirmar/{uuid}")
	public void confirmarPessoa(String uuid){
		Pessoa pessoa = pessoaRepository.obter(uuid);		
		pessoaRepository.confirmar(pessoa);
		result.include("msgCadastro", "Cadastro de '<b>" + pessoa.getNome() + "</b>' confirmado com sucesso.");
		result.redirectTo(this).cadastro();
		//TODO adicionar logica de envio de email no servidor e no cliente (tela aguarde). 
	}
		
	@Restrito
	@Get("/pessoa/consulta")
	public void consultar(String paramConsulta){
		List<Pessoa> pessoas = pessoaRepository.listarPorNomeEmail(paramConsulta);		
		result.use(json()).withoutRoot().from(pessoas).exclude("id").serialize();		
	}	
	
	@Get("/cliente/cadastro")
	public void cadastroCliente(){}
	
	@Post("/cliente/cadastrar")
	public void cadastrarCliente(Pessoa pessoa){
		boolean validado = validacaoService.pessoa(pessoa, result);
		if(validado){
			try {				
				pessoaService.cadastrar(pessoa);
				pessoaService.notificarCadastroPelocliente(pessoa);
				redirecionarParaIndex(pessoa);
			} catch (DBException e) {
				e.printStackTrace();
				result.include("msgErroCadastro", "Opps! Ocorreu um erro inexperado, infelizmente não foi possível realizar o seu cadastro.<br/>Por favor tente novamente mais tarde.");
				redirecionarParaCadastroCliente();
			} catch (EmailException e) {				
				e.printStackTrace();
				redirecionarParaIndex(pessoa);
			}
		}else{			
			redirecionarParaCadastroCliente();
		}
	}

	private void redirecionarParaIndex(Pessoa pessoa) {
		result.include("msgIndex", "<b>" + pessoa.getNome() + "</b>, seu cadastro foi recebido com sucesso.<br/>Aguarde que em breve você receberá uma confirmação por email.");
		result.redirectTo(IndexController.class).index();		
	}

	private void redirecionarParaCadastroCliente() {
		result.redirectTo(this).cadastroCliente();		
	}
	
	private void redirecionarParaCadastroAdmin() {
		result.redirectTo(this).cadastro();		
	}
	
	private void redirecionarParaMenuAdm(String nomeMensagem, String mensagem) {
		result.include(nomeMensagem, mensagem);
		result.forwardTo(MenuController.class).menu();
	}
}
