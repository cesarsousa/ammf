package br.com.ammf.service;

import br.com.ammf.model.Comentario;
import br.com.ammf.model.Local;
import br.com.ammf.model.Status;
import br.com.ammf.model.Texto;
import br.com.caelum.vraptor.Result;

public interface BlogService {

	void cadastrarTexto(Texto texto);

	Texto atualizarTexto(Texto texto);

	void cadastrarComentario(String uuidTexto, Comentario comentario);
	
	Comentario obterComentario(String comentarioNome, String comentarioEmail, String comentarioConteudo, Local local);

	void configurarVisualizacaoParaVisualizacaoComentarios(Status status, Result result);

}
