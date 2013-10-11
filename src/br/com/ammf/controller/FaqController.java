package br.com.ammf.controller;

import static br.com.caelum.vraptor.view.Results.json;

import java.util.List;

import br.com.ammf.exception.DBException;
import br.com.ammf.exception.EmailException;
import br.com.ammf.exception.ErroAplicacao;
import br.com.ammf.exception.Excecao;
import br.com.ammf.interceptor.Restrito;
import br.com.ammf.model.Faq;
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
		List<Faq> faqs = faqRepositoty.listar();
		setFaqsToView(faqs, "corCinza", "Visualiza&ccedil;&atilde;o de todas as perguntas cadastradas", "isFaqTodas", 1);	
	}
	
	@Restrito
	@Get("/adm/faq/respondidas")
	public void visualizarTodosAsFaqsRespondidas(){
		List<Faq> faqs = faqRepositoty.listarRespondidas();
		setFaqsToView(faqs, "corVerde", "Visualiza&ccedil;&atilde;o de todas as perguntas respondidas", "isFaqRespondidas", 2);	
	}
	
	@Restrito
	@Get("/adm/faq/pendentes")
	public void visualizarTodosAsFaqsNaoRespondidas(){
		List<Faq> faqs = faqRepositoty.listarNaoRespondiddas();
		setFaqsToView(faqs, "corVermelho", "Visualiza&ccedil;&atilde;o de todas as perguntas não respondidas", "isFaqNaoRespondidas", 3);	
	}

	private void setFaqsToView(List<Faq> faqs, String backgroundTitulo, String tituloFaq, String flagIcone, int flagRedirect) {
		result.include("faqs", faqs);
		result.include("backgroundTitulo", backgroundTitulo);
		result.include("tituloFaqsSolicitadas", tituloFaq);
		result.include(flagIcone, true);
		result.include("requestFaqs", true);
		result.include("flagRedirect", flagRedirect);
		result.redirectTo(this).faqAdmin();
	}
	
	@Restrito
	@Get("/adm/faq/editar")
	public void editarFaq(String uuid){
		Faq faq = faqRepositoty.obter(uuid);
		result.use(json()).withoutRoot().from(faq).exclude("id").serialize();
	}
	
	@Restrito
	@Post("/adm/faq/resposta")
	public void responderFaq(String uuid, String resposta){
		String resultado = "Pergunta respondida com sucesso";
		if(resposta == null || resposta.isEmpty()){
			resultado = "Erro! Digite a resposta da pergunta";
		}else{
			if(uuid.isEmpty()){
				resultado = "Erro! uuid não definido";
			}else{
				Faq faq = faqRepositoty.obter(uuid);
				if(faq.getRespondida()){
					resultado = "Aviso! A pergunta já foi respondida";
				}else{
					faq.setResposta(resposta);
					faqRepositoty.atualizar(faq);
					
					try {
						emailService.notificarRespostaFaqParaCliente(faq);
					} catch (EmailException emailException) {
						resultado = "Erro! Notificação por email para o cliente não enviada. Descrição do erro: " + emailException.getMessage();
						result.use(json()).from(resultado).serialize();
					}
					
					resultado = "Pergunta respondida com sucesso";
				}				
			}
		}
		result.use(json()).from(resultado).serialize();
	}
	
	@Restrito
	@Get("/adm/faq/excluir/{uuid}/{flagRedirect}")
	public void excluirFaq(String uuid, int flagRedirect){
		faqRepositoty.deletar(uuid);
		result.include("msgFaq", "Pergunta removida com sucesso");
		
		if(flagRedirect == 3){
			visualizarTodosAsFaqsNaoRespondidas();
		}else if (flagRedirect == 2){
			visualizarTodosAsFaqsRespondidas();
		}else{
			visualizarTodosAsFaqs();
		}
	}
	
	
	
	@Get("/cliente/faq")
	public void faqCliente(){
		List<Faq> faqs = faqRepositoty.listarRespondidas();
		result.include("faqs", faqs);
	}
	
	@Get("/cliente/faq/{uuid}")
	public void faqClienteLer(String uuid){
		Faq faq = faqRepositoty.obter(uuid);
		if(faq == null){
			result.include("faqRemovida", true);
		}else if(!faq.isPublica()){
			result.include("faqPrivada", true);
		}else{
			result.include("faq", faq);
		}
		
		result.include("faqEmailRequest", true);		
		result.redirectTo(this).faqCliente();
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
