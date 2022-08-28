package br.com.ammf.controller;

import static br.com.caelum.vraptor.view.Results.json;

import java.util.List;

import br.com.ammf.dto.RelatorioEmailDto;
import br.com.ammf.exception.EmailException;
import br.com.ammf.exception.ErroAplicacao;
import br.com.ammf.exception.Excecao;
import br.com.ammf.interceptor.Restrito;
import br.com.ammf.model.Constelacao;
import br.com.ammf.model.Curso;
import br.com.ammf.model.Local;
import br.com.ammf.model.LocalEvento;
import br.com.ammf.model.LogAplicacao;
import br.com.ammf.model.Mensagem;
import br.com.ammf.model.Notificacao;
import br.com.ammf.model.Pessoa;
import br.com.ammf.model.SessaoUsuario;
import br.com.ammf.model.Texto;
import br.com.ammf.repository.ConstelacaoRepository;
import br.com.ammf.repository.CursoRepository;
import br.com.ammf.repository.ErroAplicacaoRepository;
import br.com.ammf.repository.TextoRepository;
import br.com.ammf.service.EmailService;
import br.com.ammf.service.MenuService;
import br.com.ammf.service.ValidacaoService;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class MenuController {
	
	private Result result;
	private MenuService menuService;
	private ValidacaoService validacaoService;
	private EmailService emailService;
	private SessaoUsuario sessaoUsuario;	
	private TextoRepository textoRepository;
	private ConstelacaoRepository constelacaoRepository;
	private ErroAplicacaoRepository erroAplicacaoRepository;
	private CursoRepository cursoRepository;
	
	public MenuController(
			Result result,
			MenuService menuService,
			ValidacaoService validacaoService,
			SessaoUsuario sessaoUsuario,
			EmailService emailService,
			TextoRepository textoRepository,			
			ConstelacaoRepository constelacaoRepository,
			ErroAplicacaoRepository erroAplicacaoRepository,
			CursoRepository cursoRepository){
		this.result = result;
		this.menuService = menuService;
		this.validacaoService = validacaoService;
		this.emailService = emailService;
		this.sessaoUsuario = sessaoUsuario;
		this.textoRepository = textoRepository;
		this.constelacaoRepository = constelacaoRepository;
		this.erroAplicacaoRepository = erroAplicacaoRepository;
		this.cursoRepository = cursoRepository;
	}
	
	@Restrito
	public void menu(){
		sessaoUsuario = menuService.atualizar(sessaoUsuario);		
	}
	
	@Path("/menu/adm")
	public void menuAdministrador(){
		result.redirectTo(this).menu();		
	}	
	
	@Restrito
	@Post("/menu/index/atualizar")
	public void atualizarFrasePrincipal(Texto texto){
		try {
			validacaoService.verificarCamposPreenchidos(texto, Local.INDEX, result);
			textoRepository.atualizarTextoIndex(texto);
			emailService.notificarTextoParaPessoas(Notificacao.TEXTO_ATUALIZADO, textoRepository.getTextoIndex());
			redirecionarParaMenuAdm("mensagem", "Texto da p&aacute;gina principal atualizado com sucesso");
		} catch (EmailException e) {
			new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName() + " | " + e.getMensagem()));
			result.include("mensagem", "Texto da p&aacute;gina principal atualizado com sucesso");			
			redirecionarParaMenuAdm("mensagemErro", "N&atilde;o foi poss&iacute;vel enviar os emails de notifica&ccedil;&atilde;o para os clientes referente a atualiza&ccedil;&atilde;o da frase principal.<br/>Mensagem de Erro: " + e.getMensagem() + ".");
		}				
	}
	
	@Restrito
	@Post("/menu/quiron/atualizar")
	public void atualizarTextoQuiron(Texto texto){
		try {
			validacaoService.verificarCamposPreenchidos(texto, Local.QUIRON, result);
			textoRepository.atualizarTextoQuiron(texto);
			emailService.notificarTextoParaPessoas(Notificacao.TEXTO_ATUALIZADO, textoRepository.getTextoQuiron());
			redirecionarParaMenuAdm("mensagem", "Texto sobre Quiron atualizado com sucesso");
		} catch (EmailException e) {
			new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName() + " | " + e.getMensagem()));
			result.include("mensagem", "Texto sobre Quiron atualizado com sucesso");			
			redirecionarParaMenuAdm("mensagemErro", "N&atilde;o foi poss&iacute;vel enviar os emails de notifica&ccedil;&atilde;o para os clientes referente a atualiza&ccedil;&atilde;o do texto sobre Quiron.<br/>Mensagem de Erro: " + e.getMensagem() + ".");
		}
	}
	
	@Restrito
	@Post("/menu/quiron/post")
	public void salvaAutomaticaTextoquiron(String texto){
		Texto textoSessao = sessaoUsuario.getTextoQuiron();
		textoSessao.setConteudo(texto);
		textoRepository.atualizar(textoSessao);
		sessaoUsuario.setTextoQuiron(textoSessao);		
		result.use(json()).withoutRoot().from(true).serialize();
	}
	
	@Restrito
	@Post("/menu/quiron/travar")
	public void travarTextoQuiron(){
		Texto textoSessao = sessaoUsuario.getTextoQuiron();
		textoSessao.setConfirmado(false);
		textoRepository.atualizar(textoSessao);
		sessaoUsuario.setTextoQuiron(textoSessao);		
		result.use(json()).withoutRoot().from(true).serialize();
	}
	
	@Restrito
	@Post("/menu/constelacao/atualizar")
	public void atualizarTextoConstelacao(Constelacao constelacao){
			constelacaoRepository.salvarAtualizar(constelacao);
			result.use(json()).withoutRoot().from("Contelação atualizada com sucesso").serialize();
	}
	
	@Restrito
	@Get("/menu/constelacao/notificar")
	public void notificarEmailConstelacao(String local, String email){
		try {
			Constelacao constelacao = constelacaoRepository.get("NITEROI".equals(local) ? LocalEvento.NITEROI : LocalEvento.BARRA);
			emailService.notificarConstelacaoParaEmail(constelacao, email);
			result.use(json()).withoutRoot().from("Contelação notificada com sucesso").serialize();
		} catch (EmailException e) {
			new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName() + " | " + e.getMensagem()));
		}
	}
	
	@Restrito
	@Get("/menu/constelacao/notificar/todos")
	public void notificarEmailConstelacao(String local){
		try {
			Constelacao constelacao = constelacaoRepository.get("NITEROI".equals(local) ? LocalEvento.NITEROI : LocalEvento.BARRA);
			RelatorioEmailDto pessoasNaoNotificadas = emailService.notificarConstelacaoParaPessoas(constelacao);
			result.use(json()).withoutRoot().from(pessoasNaoNotificadas).include("emailsNaoInformados").serialize();
		} catch (EmailException e) {
			new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName() + " | " + e.getMensagem()));
		}
	}
	
	@Restrito
	@Get("/menu/curso/notificar")
	public void notificarEmailCurso(String email){
		try {
			Curso curso = cursoRepository.get();
			if(curso.getId() == 0L ) {
				throw new IllegalStateException("Não há curso a ser informado!");
			}
			emailService.notificarCursoParaEmail(curso, email);
			result.use(json()).withoutRoot().from("Curso notificado com sucesso").serialize();
		} catch (EmailException e) {
			new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName() + " | " + e.getMessage()));
		}
	}
	
	@Restrito
	@Post("/menu/curso/atualizar")
	public void atualizarTextoCurso(Curso curso){
			cursoRepository.salvarAtualizar(curso);
			result.use(json()).withoutRoot().from("Contelação atualizada com sucesso").serialize();
	}
	
	@Restrito
	@Get("/menu/curso/notificar/todos")
	public void notificarEmailCursoTodos(){
		try {
			Curso curso = cursoRepository.get();
			if(curso.getId() == 0L ) {
				throw new IllegalStateException("Não há curso a ser informado!");
			}
			//RelatorioEmailDto pessoasNaoNotificadas = emailService.notificarCursoParaPessoas(curso);
			result.use(json()).withoutRoot().from(null).include("emailsNaoInformados").serialize();
			//} catch (EmailException e) {
		} catch (Exception e) {
			new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName() + " | " + e.getMessage()));
		}
	}
	
	@Restrito
	@Post("/menu/psicologia/atualizar")
	public void atualizarTextoPsicologia(Texto texto){				
		try {
			validacaoService.verificarCamposPreenchidos(texto, Local.PSICOLOGIA, result);
			textoRepository.atualizarTextoPsicologia(texto);
			emailService.notificarTextoParaPessoas(Notificacao.TEXTO_ATUALIZADO, textoRepository.getTextoPsicologia());
			redirecionarParaMenuAdm("mensagem", "Texto sobre psicologia atualizado com sucesso");
		} catch (EmailException e) {
			new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName() + " | " + e.getMensagem()));
			result.include("mensagem", "Texto sobre psicologia atualizado com sucesso");			
			redirecionarParaMenuAdm("mensagemErro", "N&atilde;o foi poss&iacute;vel enviar os emails de notifica&ccedil;&atilde;o para os clientes referente a atualiza&ccedil;&atilde;o do texto sobre Psicologia.<br/>Mensagem de Erro: " + e.getMensagem() + ".");
		}		
	}
	
	@Restrito
	@Post("/menu/Psicologia/post")
	public void salvaAutomaticaTextoPsicologia(String texto){
		Texto textoSessao = sessaoUsuario.getTextoPsicologia();
		textoSessao.setConteudo(texto);
		textoRepository.atualizar(textoSessao);
		sessaoUsuario.setTextoPsicologia(textoSessao);		
		result.use(json()).withoutRoot().from(true).serialize();
	}
	
	@Restrito
	@Post("/menu/psicologia/travar")
	public void travarTextoPsicologia(){
		Texto textoSessao = sessaoUsuario.getTextoPsicologia();
		textoSessao.setConfirmado(false);		
		textoRepository.atualizar(textoSessao);
		sessaoUsuario.setTextoPsicologia(textoSessao);		
		result.use(json()).withoutRoot().from(true).serialize();
	}
	
	@Restrito
	@Post("/menu/educacao/atualizar")
	public void atualizarTextoEducacao(Texto texto){				
		try {
			validacaoService.verificarCamposPreenchidos(texto, Local.EDUCACAO, result);
			textoRepository.atualizarTextoEducacao(texto);
			emailService.notificarTextoParaPessoas(Notificacao.TEXTO_ATUALIZADO, textoRepository.getTextoEducacao());
			redirecionarParaMenuAdm("mensagem", "Texto sobre Educa&ccedil;&atilde;o atualizado com sucesso");
		} catch (EmailException e) {
			new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName() + " | " + e.getMensagem()));
			result.include("mensagem", "Texto sobre Educa&ccedil;&atilde;o atualizado com sucesso");			
			redirecionarParaMenuAdm("mensagemErro", "N&atilde;o foi poss&iacute;vel enviar os emails de notifica&ccedil;&atilde;o para os clientes referente a atualiza&ccedil;&atilde;o do texto sobre Educa&ccedil;&atilde;o.<br/>Mensagem de Erro: " + e.getMensagem() + ".");
		}
	}
	
	@Restrito
	@Post("/menu/Educacao/post")
	public void salvaAutomaticaTextoEducacao(String texto){
		Texto textoSessao = sessaoUsuario.getTextoEducacao();
		textoSessao.setConteudo(texto);
		textoRepository.atualizar(textoSessao);
		sessaoUsuario.setTextoEducacao(textoSessao);		
		result.use(json()).withoutRoot().from(true).serialize();
	}
	
	@Restrito
	@Post("/menu/educacao/travar")
	public void travarTextoEducacao(){
		Texto textoSessao = sessaoUsuario.getTextoEducacao();
		textoSessao.setConfirmado(false);		
		textoRepository.atualizar(textoSessao);
		sessaoUsuario.setTextoEducacao(textoSessao);		
		result.use(json()).withoutRoot().from(true).serialize();
	}
	
	@Restrito
	@Post("/menu/cultura/atualizar")
	public void atualizarTextoCultura(Texto texto){		
		try {
			validacaoService.verificarCamposPreenchidos(texto, Local.CULTURA, result);		
			textoRepository.atualizarTextoCultura(texto);
			emailService.notificarTextoParaPessoas(Notificacao.TEXTO_ATUALIZADO, textoRepository.getTextoCultura());
			redirecionarParaMenuAdm("mensagem", "Texto sobre cultura atualizado com sucesso");
		} catch (EmailException e) {
			new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName() + " | " + e.getMensagem()));
			result.include("mensagem", "Texto sobre cultura atualizado com sucesso");			
			redirecionarParaMenuAdm("mensagemErro", "N&atilde;o foi poss&iacute;vel enviar os emails de notifica&ccedil;&atilde;o para os clientes referente a atualiza&ccedil;&atilde;o do texto sobre Cultura.<br/>Mensagem de Erro: " + e.getMensagem() + ".");
		}		
	}
	
	@Restrito
	@Post("/menu/Cultura/post")
	public void salvaAutomaticaTextoCultura(String texto){
		Texto textoSessao = sessaoUsuario.getTextoCultura();
		textoSessao.setConteudo(texto);
		textoRepository.atualizar(textoSessao);
		sessaoUsuario.setTextoCultura(textoSessao);		
		result.use(json()).withoutRoot().from(true).serialize();
	}
	
	@Restrito
	@Post("/menu/cultura/travar")
	public void travarTextoCultura(){
		Texto textoSessao = sessaoUsuario.getTextoCultura();
		textoSessao.setConfirmado(false);		
		textoRepository.atualizar(textoSessao);
		sessaoUsuario.setTextoCultura(textoSessao);		
		result.use(json()).withoutRoot().from(true).serialize();
	}
	
	@Restrito
	@Post("/menu/artesorientais/atualizar")
	public void atualizarTextoArtesOrientais(Texto texto){		
		try {
			validacaoService.verificarCamposPreenchidos(texto, Local.ARTESORIENTAIS, result);
			textoRepository.atualizarTextoArtesOrientais(texto);			
			emailService.notificarTextoParaPessoas(Notificacao.TEXTO_ATUALIZADO, textoRepository.getTextoArtesOrientais());
			redirecionarParaMenuAdm("mensagem", "Texto sobre artes orientais atualizado com sucesso");
		} catch (EmailException e) {
			new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName() + " | " + e.getMensagem()));
			result.include("mensagem", "Texto sobre artes orientais atualizado com sucesso");			
			redirecionarParaMenuAdm("mensagemErro", "N&atilde;o foi poss&iacute;vel enviar os emails de notifica&ccedil;&atilde;o para os clientes referente a atualiza&ccedil;&atilde;o do texto sobre Artes Orientais.<br/>Mensagem de Erro: " + e.getMensagem() + ".");
		}		
	}
	
	@Restrito
	@Post("/menu/Orientais/post")
	public void salvaAutomaticaTextoArtesOrientais(String texto){
		Texto textoSessao = sessaoUsuario.getTextoArtesOrientais();
		textoSessao.setConteudo(texto);
		textoRepository.atualizar(textoSessao);
		sessaoUsuario.setTextoArtesOrientais(textoSessao);		
		result.use(json()).withoutRoot().from(true).serialize();
	}
	
	@Restrito
	@Post("/menu/artesorientais/travar")
	public void travarTextoArtesOrientais(){
		Texto textoSessao = sessaoUsuario.getTextoArtesOrientais();
		textoSessao.setConfirmado(false);		
		textoRepository.atualizar(textoSessao);
		sessaoUsuario.setTextoArtesOrientais(textoSessao);		
		result.use(json()).withoutRoot().from(true).serialize();
	}
	
	@Restrito
	@Get("/menu/email")
	public void enviarEmail(){}
	
	@Restrito
	@Post("/menu/enviar/email")
	public void enviarEmail(boolean todosOsContatos, String email, String titulo, String conteudo){
		try {
						
			if(!todosOsContatos && (email == null || email.isEmpty())) {
				
				result.include("msgErroEmail", "Destinatário não selecionado");
				
			}else {
				
				Mensagem mensagem = new Mensagem(null, email, titulo, conteudo);
				
				boolean emailValido = false;
				if(email != null && !email.isEmpty()) {
					emailValido = validacaoService.ehEmailValido(mensagem.getEmail(), result);
					if(!emailValido) {
						result.include("email", email);
						result.include("titulo", titulo);
						result.include("conteudo", conteudo);
					}
				}
							
				if(emailValido || todosOsContatos){
					List<Pessoa> pessoasNaoNotificadas = emailService.enviarEmailParaClientes(mensagem, todosOsContatos);
					
					if(pessoasNaoNotificadas.isEmpty()) {
						result.include("msgSucessoEmail", "E-mail enviado com sucesso.");
					}else {
						result.include("pessoasNaoNotificadas", true);
						result.include("pessoas", pessoasNaoNotificadas);
					}
					
				}
			}
			
			result.redirectTo(this).enviarEmail();
			
			
		} catch (EmailException e) {
			new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName() + " | " + e.getMensagem()));
			result.include("msgErroIndex", "Ocorreu um erro interno com nosso provedor de email. N&atilde;o foi poss&iacute;vel enviar sua mensagem .<br/>Por favor tente novamente dentro de alguns minutos. Grato pela aten&ccedil;&atilde;o e desculpem-nos o transtorno.");
			result.redirectTo(IndexController.class).index();
		}		
	}
	
	@Restrito
	@Get("/menu/erroAplicacao")
	public void errosAplicacao(){
		List<LogAplicacao> errosAplicacao = erroAplicacaoRepository.listar();
		result.include("errosAplicacao", errosAplicacao);		
	}

	private void redirecionarParaMenuAdm(String nomeMensagem, String mensagem) {
		result.include(nomeMensagem, mensagem);
		result.forwardTo(this).menu();
	}	
}
