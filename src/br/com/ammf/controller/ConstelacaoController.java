package br.com.ammf.controller;

import java.util.List;

import br.com.ammf.exception.ErroAplicacao;
import br.com.ammf.exception.Excecao;
import br.com.ammf.interceptor.Restrito;
import br.com.ammf.model.Evento;
import br.com.ammf.model.Participante;
import br.com.ammf.model.TipoEvento;
import br.com.ammf.repository.ConstelacaoRepository;
import br.com.ammf.service.ValidacaoService;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class ConstelacaoController {
	
	private Result result;
	private ValidacaoService validacaoService;
	private ConstelacaoRepository constelacaoRepository;

	public ConstelacaoController(
			Result result,
			ValidacaoService validacaoService,
			ConstelacaoRepository constelacaoRepository) {
		this.result = result;
		this.validacaoService = validacaoService;
		this.constelacaoRepository = constelacaoRepository;
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
		
		result.include("evento", evento);		
		result.include("flagGerenciarConstelacao", true);
		result.include("constelacaoMensagemCadastroSucesso", "<b>" + participante.getNome() + "</b> incluído com sucesso!");
		result.forwardTo(this).constelacaoAdmin();
	}
	
	
	@Restrito
	@Post("/constelacao/participante/confirmarEditar")
	public void confirmarEditarParticipante(Participante participante){
		constelacaoRepository.atualizar(participante);		
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
	
	@Get("/constelacao/cliente")
	public void constelacaoCliente(){
		
	}

}
