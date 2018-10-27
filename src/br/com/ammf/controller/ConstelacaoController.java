package br.com.ammf.controller;

import java.util.List;

import br.com.ammf.exception.EmailException;
import br.com.ammf.exception.ErroAplicacao;
import br.com.ammf.exception.Excecao;
import br.com.ammf.interceptor.Restrito;
import br.com.ammf.model.Constelacao;
import br.com.ammf.model.Evento;
import br.com.ammf.model.Participante;
import br.com.ammf.model.Pessoa;
import br.com.ammf.model.SessaoCliente;
import br.com.ammf.model.SessaoUsuario;
import br.com.ammf.model.TipoEvento;
import br.com.ammf.repository.ConstelacaoRepository;
import br.com.ammf.repository.PessoaRepository;
import br.com.ammf.service.EmailService;
import br.com.ammf.service.IndexService;
import br.com.ammf.service.MenuService;
import br.com.ammf.service.PessoaService;
import br.com.ammf.service.ValidacaoService;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class ConstelacaoController {
	
	private Result result;
	private SessaoCliente sessaoCliente;
	private MenuService menuService;
	private SessaoUsuario sessaoUsuario;
	private ValidacaoService validacaoService;	
	private EmailService emailService;
	private IndexService indexService;
	private PessoaService pessoaService;
	private ConstelacaoRepository constelacaoRepository;
	private PessoaRepository pessoaRepository;

	public ConstelacaoController(
			Result result,
			MenuService menuService,
			SessaoUsuario sessaoUsuario,
			SessaoCliente sessaoCliente,
			IndexService indexService,
			EmailService emailService,
			ValidacaoService validacaoService,
			PessoaService pessoaService,
			ConstelacaoRepository constelacaoRepository,
			PessoaRepository pessoaRepository) {
		this.result = result;
		this.menuService = menuService;
		this.sessaoUsuario = sessaoUsuario;
		this.sessaoCliente = sessaoCliente;
		this.indexService = indexService;
		this.emailService = emailService;
		this.validacaoService = validacaoService;
		this.pessoaService = pessoaService;
		this.constelacaoRepository = constelacaoRepository;
		this.pessoaRepository = pessoaRepository;
	}
	
	@Restrito
	@Get("/menu/constelacao")
	public void constelacaoAdmin(){
		List<Evento> eventos = constelacaoRepository.listar(TipoEvento.CONSTELACAO);
		result.include("eventos", eventos);
	}
	
	@Restrito
	@Post("/constelacao/cadastrar")
	public void cadastrar(Evento evento){
		try {
			boolean validado = validacaoService.cadastrarEvento(evento, result);		
						
			if(validado){
				constelacaoRepository.cadastrar(evento);			
				result.include("constelacaoMensagemSucesso", "Constelação cadastrada com sucesso");
			}else{
				result.include("evento", evento);
				result.include("flagLinkConstelacaoCadastro", true);
			}
			
			result.forwardTo(this).constelacaoAdmin();
		}  catch (Exception emailException){
			new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName() + " | " + emailException.getMessage()));
			result.include("linkMensagemErro", "N&atilde;o foi poss&iacute;vel notificar clientes por email referente ao cadastramento do link.<br/>Mensagem de Erro: " + emailException.getMessage() + ".");
			result.forwardTo(this).constelacaoAdmin();
		}
	}
	
	@Restrito
	@Get("/constelacao/listar")
	public void listarConstelacao(){
		List<Evento> eventos = constelacaoRepository.listar(TipoEvento.CONSTELACAO);
		result.include("eventos", eventos);
		result.include("flagListagemConstelacao", true);
		result.forwardTo(this).constelacaoAdmin();
	}
	
	@Restrito
	@Get("/constelacao/remover/{id}")
	public void removerConstelacao(long id){
		Evento evento = constelacaoRepository.obter(id);		
		constelacaoRepository.remover(evento);
		result.include("constelacaoMensagemSucesso", "Constelação removida com sucesso");
		result.forwardTo(this).constelacaoAdmin();
	}
	
	@Restrito
	@Post("/constelacao/participante/cadastrar")
	public void cadastrarParticipanteConstelacao(Participante participante){
		
		constelacaoRepository.cadastrar(participante);		
		Evento evento = constelacaoRepository.obter(participante.getEvento().getId());
		
		StringBuilder mensagemRetorno = new StringBuilder();		
		boolean emailCadastrado = pessoaRepository.jaEstaCadastrada(participante.getEmail());
		if(!emailCadastrado){
			try {
				Pessoa pessoa = pessoaService.obterPessoa(participante);
				pessoaService.cadastrarComoAdm(pessoa);
				emailService.notificarNovoCadastroFeitoPeloAdm(pessoa);
			} catch (EmailException e) {				
				new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName() + " | " + e.getMensagem()));
				mensagemRetorno.append("N&atilde;o foi poss&iacute;vel enviar o email de notifica&ccedil;&atilde;o para " + participante.getEmail() + " referente ao cadastro<br/>");
			}
		}
		
		result.include("evento", evento);		
		result.include("flagGerenciarConstelacao", true);
		mensagemRetorno.append("<b>" + participante.getNome() + "</b> incluído com sucesso!");
		result.include("constelacaoMensagemCadastroSucesso", mensagemRetorno.toString());
		result.forwardTo(this).constelacaoAdmin();
	}
	
	
	@Restrito
	@Post("/constelacao/participante/confirmarEditar")
	public void confirmarEditarParticipante(Participante participante){
		constelacaoRepository.atualizar(participante);
		
		StringBuilder mensagemRetorno = new StringBuilder();
		boolean emailCadastrado = pessoaRepository.jaEstaCadastrada(participante.getEmail());
		if(!emailCadastrado){
			try {
				Pessoa pessoa = pessoaService.obterPessoa(participante);
				pessoaService.cadastrarComoAdm(pessoa);
				emailService.notificarNovoCadastroFeitoPeloAdm(pessoa);
			} catch (EmailException e) {				
				new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName() + " | " + e.getMensagem()));
				mensagemRetorno.append("N&atilde;o foi poss&iacute;vel enviar o email de notifica&ccedil;&atilde;o para " + participante.getEmail() + " referente ao cadastro<br/>");
			}
		}
		
		result.redirectTo(this).gerenciarConstelacao(participante.getEvento().getId());		
	}
	
	
	@Restrito
	@Get("/constelacao/participante/alterar/{idParticipante}/{idEvento}")
	public void editarParticipante(int idParticipante, int idEvento){
		Participante participante = constelacaoRepository.obterParticipante(idParticipante);
		result.include("participante", participante);
		result.include("idEvento", idEvento);
		result.include("flagEditarParticipante", true);
		result.redirectTo(this).gerenciarConstelacao(idEvento);
	}
	
	@Restrito
	@Get("/constelacao/participante/remover/{idParticipante}/{idEvento}")
	public void removerParticipante(int idParticipante, int idEvento){
		Participante participante = constelacaoRepository.obterParticipante(idParticipante);
		constelacaoRepository.remover(participante);
		result.redirectTo(this).gerenciarConstelacao(idEvento);
	}
	
	@Restrito
	@Get("/constelacao/gerenciar/{id}")
	public void gerenciarConstelacao(long id){
		Evento evento = constelacaoRepository.obter(id);
		
		result.include("evento", evento);
		result.include("flagGerenciarConstelacao", true);
		result.forwardTo(this).constelacaoAdmin();
	}
	
	@Restrito
	@Get("/constelacao/relatorio/email/{id}")
	public void enviarRelatorioConstelacaoPorEmail(long id){
		try {
			Evento evento = constelacaoRepository.obter(id);
			emailService.enviarRelatorioConstelacao(evento);
			result.include("constelacaoMensagemSucesso", "Relatório da constelação enviado com sucesso");
			result.forwardTo(this).constelacaoAdmin();
		} catch (EmailException e) {
			new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName() + " | " + e.getMensagem()));
			result.include("constelacaoMensagemErro", "Erro no envio do relatório:" + e.getMensagem());			
			result.forwardTo(this).constelacaoAdmin();
		}		
	}
	
	@Get("/constelacao/cliente")
	public void constelacaoCliente(){
		try {
			sessaoCliente = indexService.atualizar(sessaoCliente);
			indexService.atualizarNews(result);			
		} catch (Exception e) {
			result.include("msgErro", e.getMessage());
			result.redirectTo(IndexController.class).erro();
		}
		
	}
	
	@Get("/constelacao/niteroi/atualizacao")
	public void constelacaoAtualizacao(){}
	
	@Restrito
	@Post("/constelacao/niteroi/atualizar")
	public void atualizarTextoConstelacao(Constelacao constelacao, boolean constelacaoEnviarEmail, String emailAdicional){
		try {
			constelacaoRepository.salvarAtualizar(constelacao);
			if(constelacaoEnviarEmail){
				emailService.notificarConstelacaoParaPessoas(constelacao);
			}
			if(emailAdicional != null){
				emailService.notificarConstelacaoParaEmail(constelacao, emailAdicional);
			}
						
			redirecionar("mensagem", "Textos sobre constela&ccedil;&otilde;es atualizados com sucesso");	
		} catch (EmailException e) {
			new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName() + " | " + e.getMensagem()));
			result.include("mensagem", "Textos sobre Constela&ccedil;&atilde;o atualizados com sucesso");			
			redirecionar("mensagemErro", "N&atilde;o foi poss&iacute;vel enviar os emails de notifica&ccedil;&atilde;o para os clientes referente a atualiza&ccedil;&atilde;o do texto sobre Constela&ccedil;&atilde;o.<br/>Mensagem de Erro: " + e.getMensagem() + ".");
		}			
	}
	
	private void redirecionar(String nomeMensagem, String mensagem) {
		
		sessaoUsuario = menuService.atualizar(sessaoUsuario);		
		
		result.include(nomeMensagem, mensagem);
		result.redirectTo(this).constelacaoAtualizacao();
	}	

}
