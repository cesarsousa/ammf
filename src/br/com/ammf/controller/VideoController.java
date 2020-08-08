package br.com.ammf.controller;

import java.util.List;

import br.com.ammf.exception.EmailException;
import br.com.ammf.exception.ErroAplicacao;
import br.com.ammf.exception.Excecao;
import br.com.ammf.interceptor.Restrito;
import br.com.ammf.model.Video;
import br.com.ammf.repository.VideoRepository;
import br.com.ammf.service.EmailService;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class VideoController {
	
	private Result result;
	private VideoRepository videoRepository;
	private EmailService emailService;
	
	public VideoController(
			Result result, 
			VideoRepository videoRepository,
			EmailService emailService) {
		super();
		this.result = result;
		this.videoRepository = videoRepository;
		this.emailService = emailService;
	}

	@Restrito
	@Get("/menu/video")
	public void videoAdmin(){
		List<Video> videos = videoRepository.listarTodosDescrecente();
		result.include("videos", videos);
	}
	
	@Restrito
	@Post("/video/novo")
	public void videoAdmin(Video video) {
		try {
			String titulo = video.getTitulo();
			String conteudo = video.getSrc();
			videoRepository.salvar(video);
			emailService.notificarVideoParaPessoas(titulo, conteudo);
			result.forwardTo(this).videoAdmin();
		} catch (EmailException e) {
			new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName() + " | " + e.getMensagem()));
			result.include("mensagem", "Vídeo cadastrado com sucesso!");			
			redirecionarParaMenuAdm("mensagemErro", "N&atilde;o foi poss&iacute;vel enviar os emails de notifica&ccedil;&atilde;o para os clientes referente a atualiza&ccedil;&atilde;o do vídeo.<br/>Mensagem de Erro: " + e.getMensagem() + ".");
		}	
	}
	
	@Restrito
	@Get("/video/excluir/{id}")
	public void excluir(long id){
		Video video = videoRepository.obterPorId(id);
		videoRepository.excluir(video);
		result.forwardTo(this).videoAdmin();
	}

	private void redirecionarParaMenuAdm(String nomeMensagem, String mensagem) {
		result.include(nomeMensagem, mensagem);
		result.forwardTo(MenuController.class).menu();
	}

}
