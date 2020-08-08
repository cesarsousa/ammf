package br.com.ammf.repository;

import java.util.List;

import br.com.ammf.model.Video;

public interface VideoRepository {

	List<Video> obterVideosAtivos();

	List<Video> listarTodosDescrecente();

	void salvaOuAtualiza(Video video);

}
