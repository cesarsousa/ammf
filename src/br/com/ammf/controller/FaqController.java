package br.com.ammf.controller;

import java.util.List;

import br.com.ammf.exception.DBException;
import br.com.ammf.exception.EmailException;
import br.com.ammf.exception.ErroAplicacao;
import br.com.ammf.exception.Excecao;
import br.com.ammf.interceptor.Restrito;
import br.com.ammf.model.Depoimento;
import br.com.ammf.model.Faq;
import br.com.ammf.model.Status;
import br.com.ammf.repository.FaqRepository;
import br.com.ammf.service.EmailService;
import br.com.ammf.service.ValidacaoService;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class FaqController {
	
	private Result result;
	private ValidacaoService validacaoService;
	private FaqRepository faqRepositoty;
	private EmailService emailService;
	
	public FaqController(
			Result result, 
			ValidacaoService validacaoService,
			FaqRepository faqRepositoty,
			EmailService emailService){
		this.result = result;
		this.validacaoService = validacaoService;
		this.faqRepositoty = faqRepositoty;
		this.emailService = emailService;
	}
	
	@Restrito
	@Get("/menu/faq")
	public void faqAdmin(){}
	
	@Restrito
	@Get("/adm/faq/todas")
	public void visualizarTodosAsFaqs(){
		List<Faq> faqs = null;
		setFaqsToView(faqs, "corCinza", "Visualiza&ccedil;&atilde;o de todas as perguntas cadastradas", "isFaqTodas");	
	}
	
	@Restrito
	@Get("/adm/faq/respondidas")
	public void visualizarTodosAsFaqsRespondidas(){
		List<Faq> faqs = null;
		setFaqsToView(faqs, "corVerde", "Visualiza&ccedil;&atilde;o de todas as perguntas respondidas", "isFaqRespondidas");	
	}
	
	@Restrito
	@Get("/adm/faq/pendentes")
	public void visualizarTodosAsFaqsNaoRespondidas(){
		List<Faq> faqs = null;
		setFaqsToView(faqs, "corVermelho", "Visualiza&ccedil;&atilde;o de todas as perguntas não respondidas", "isFaqNaoRespondidas");	
	}

	private void setFaqsToView(List<Faq> faqs, String backgroundTitulo, String tituloFaq, String flagIcone) {
		result.include("faqs", faqs);
		result.include("backgroundTitulo", backgroundTitulo);
		result.include("tituloFaqsSolicitadas", tituloFaq);
		result.include(flagIcone, true);
		result.redirectTo(this).faqAdmin();
	}	
	
	@Get("/cliente/faq")
	public void faqCliente(){
				
	}
	
	@Post("/cliente/faq/pergunta")
	public void novaPergunta(Faq faq){
		try {
			boolean validado = validacaoService.cadastrarFaq(faq, result);
			if(validado){
				faqRepositoty.cadastrar(faq);
				emailService.notificarNovaFaqParaAdmin(faq);
				result.include("msgSucessoFaq", faq.getNome() + "<br/>Sua pergunta foi registrada com sucesso.<br/>Aguarde que em breve voc&ecirc; ser&aacute; notificado pelo seu email da resposta.");
			}
			result.redirectTo(this).faqCliente();
		} catch (DBException dbException) {
			result.include("msgErroFaq", "Erro! N&atilde;o foi poss&iacute;vel regsitrar sua pergunta, por favor tente novamente dentro de alguns instantes.<br/>Atenciosamente site Quiron.");
			result.redirectTo(this).faqCliente();
		} catch (EmailException e) {
			new ErroAplicacao(new Excecao("Notificacao de email novo FAQ: tabela faq: ID: " + faq.getId(), e));
			result.include("msgSucessoFaq", faq.getNome() + "<br/>Sua pergunta foi registrada com sucesso.<br/>Aguarde que em breve voc&ecirc; ser&aacute; notificado pelo seu email da resposta.");
			result.redirectTo(this).faqCliente();
		}
		
	}
	
	

}
