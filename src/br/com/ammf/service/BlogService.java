package br.com.ammf.service;

import br.com.ammf.model.Comentario;
import br.com.ammf.model.Texto;

public interface BlogService {

	void cadastrarTexto(Texto texto);

	Texto atualizarTexto(Texto texto);

	void cadastrarComentario(String uuidTexto, Comentario comentario);

}
