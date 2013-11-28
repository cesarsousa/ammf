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
import br.com.ammf.repository.PessoaRepository;
import br.com.ammf.service.EmailService;
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
				
		boolean validado = validacaoService.pessoa(true, pessoa, result);
		if(validado){			
			try {
				pessoaService.cadastrarComoAdm(pessoa);
				emailService.notificarNovoCadastroFeitoPeloAdm(pessoa);
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
	@Get("/pessoa/remover/{uuid}/{destino}")
	public void removerPessoa(String uuid, String destino){
		Pessoa pessoa = pessoaRepository.obterPeloUuid(uuid);		
		pessoaRepository.remover(pessoa);
		result.include("msgCadastro", "Cadastro de '<b>" + pessoa.getNome() + "</b>' removido com sucesso.");
		result.include("flagVisualizarPessoas", true);
		
		if(destino.equals("OK")){
			result.redirectTo(this).listarPessoasConfirmadas();
		}else if(destino.equals("NOK")){
			result.redirectTo(this).listarPessoasPendentes();
		}else if(destino.equals("ALL")){
			result.redirectTo(this).listarPessoas();
		}else{
			result.redirectTo(this).cadastroAdmin();
		}
	}
	
	@Restrito
	@Get("/pessoa/confirmar/{uuid}/{destino}")
	public void confirmarPessoa(String uuid, String destino){
		Pessoa pessoa = pessoaRepository.obterPeloUuid(uuid);
		try {					
			pessoaRepository.confirmar(pessoa);
			emailService.enviarSolicitacaoParaConfirmacaoCadastro(pessoa);			
			result.include("msgCadastro", "Cadastro de '<b>" + pessoa.getNome() + "</b>' confirmado com sucesso.");
			result.include("flagVisualizarPessoas", true);

			if(destino.equals("OK")){
				result.redirectTo(this).listarPessoasConfirmadas();
			}else if(destino.equals("NOK")){
				result.redirectTo(this).listarPessoasPendentes();
			}else if(destino.equals("ALL")){
				result.redirectTo(this).listarPessoas();
			}else{
				result.redirectTo(this).cadastroAdmin();
			}	
			
		} catch (EmailException e) {
			e.printStackTrace();
			redirecionarParaMenuAdm("mensagemErro", "N&atilde;o foi poss&iacute;vel enviar o email de solicita&ccedil;&atilde;o de confirma&ccedil;&atilde;o para " + pessoa.getNome() + " referente ao cadastro<br/>Mensagem de Erro: " + e.getMensagem() + ".");
		}
	}
	
	@Restrito
	@Get("/pessoa/notificar/{uuid}/{destino}")
	public void notificarPessoa(String uuid, String destino){
		Pessoa pessoa = pessoaRepository.obterPeloUuid(uuid);
		try {						
			emailService.enviarSolicitacaoParaConfirmacaoCadastro(pessoa);
			pessoa.setSituacao(Situacao.INATIVO_NOTIFICADO);
			pessoaRepository.atualizar(pessoa);
			result.include("msgCadastro", "Notifica&ccedil;&atilde;o com solicita&ccedil;&atilde;o de confirma&ccedil;&atilde;o de cadastro reenviado para '<b>" + pessoa.getNome() + "</b>.");
			result.include("flagVisualizarPessoas", true);
			
			if(destino.equals("OK")){
				result.redirectTo(this).listarPessoasConfirmadas();
			}else if(destino.equals("NOK")){
				result.redirectTo(this).listarPessoasPendentes();
			}else if(destino.equals("ALL")){
				result.redirectTo(this).listarPessoas();
			}else{
				result.redirectTo(this).cadastroAdmin();
			}	
		} catch (EmailException e) {
			e.printStackTrace();
			redirecionarParaMenuAdm("mensagemErro", "N&atilde;o foi poss&iacute;vel reenviar o email de solicita&ccedil;&atilde;o de confirma&ccedil;&atilde;o para " + pessoa.getNome() + " referente ao cadastro<br/>Mensagem de Erro: " + e.getMensagem() + ".");
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
	public void cadastrarCliente(Pessoa pessoa, boolean aceiteCadastro){
		boolean validado = validacaoService.pessoa(aceiteCadastro, pessoa, result);
		if(validado){
			try {				
				pessoaService.cadastrarComoCliente(pessoa);
				emailService.notificarNovoCadastroFeitoPeloCliente(pessoa);				
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
	
	@Get("/pessoa/removerAssinaturaEmail/{uuid}")
	public void removerAssinaturaEmail(String uuid){		
		Pessoa pessoa = pessoaRepository.obterPeloUuid(uuid);
		if(pessoa == null){
			result.include("pessoaInvalida", true);
		}else{
			result.include("pessoa", pessoa);
		}		
	}
	
	@Get("/pessoa/confirmaRemocao/email/")
	public void confirmarRemocaoEmail(String uuid){
		Pessoa pessoa = pessoaRepository.obterPeloUuid(uuid);
		pessoaRepository.remover(pessoa);		
		result.redirectTo(this).removerAssinaturaEmail(uuid);		
	}
	
	@Get("/pessoa/ativar/email/{uuid}")
	public void ativarAssinaturaEmail(String uuid){		
		Pessoa pessoa = pessoaRepository.obterPeloUuid(uuid);
		pessoaRepository.ativar(pessoa);
		result.redirectTo(IndexController.class).site();
	}
	
	@Get("/pessoa/cadastro/esclarecimento")
	public void esclarecimentoDeCadastro(String email){
		Pessoa pessoa = pessoaRepository.obterPeloEmail(email);
		if(pessoa == null){
			result.include("emailEmBranco", "O email <b>" + email + "</b> n&atilde;o consta em nossa base de dados.");
			result.redirectTo(PessoaController.class).cadastroCliente();
		}else{
			try {
				emailService.enviarEsclarecimentoSobreCadastro(pessoa);
				result.include("msgIndex", "Uma mensagem foi enviada para <b>" + email + "</b> contendo as informa&ccedil;&otilde;es sobre o cadastramento do email.");
				result.redirectTo(IndexController.class).index();
			} catch (EmailException e) {
				result.include("msgErroIndex", "Ocorreu um erro interno com nosso provedor de email. N&atilde;o foi poss&iacute;vel enviar a mensagem solicitada para <b>" + email + "</b>.<br/>Por favor tente novamente dentro de alguns minutos. Grato pela aten&ccedil;o e desculpem-nos o transtorno.");
				result.redirectTo(IndexController.class).index();
			}			
		}		
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
