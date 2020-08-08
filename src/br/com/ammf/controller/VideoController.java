package br.com.ammf.controller;

import java.util.List;

import br.com.ammf.interceptor.Restrito;
import br.com.ammf.model.Video;
import br.com.ammf.repository.VideoRepository;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class VideoController {
	
	private Result result;
	private VideoRepository videoRepository;	
	
	public VideoController(
			Result result, 
			VideoRepository videoRepository) {
		super();
		this.result = result;
		this.videoRepository = videoRepository;
	}

	@Restrito
	@Get("/menu/video")
	public void videoAdmin(){
		List<Video> videos = videoRepository.listarTodosDescrecente();
		result.include("videos", videos);
	}
	
	@Restrito
	@Post("/video/novo")
	public void videoAdmin(Video video){
		videoRepository.salvaOuAtualiza(video);
		result.forwardTo(this).videoAdmin();
	}

}
