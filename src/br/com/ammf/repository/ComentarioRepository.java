package br.com.ammf.repository;

import java.util.List;

import br.com.ammf.model.Comentario;
import br.com.ammf.model.Status;

public interface ComentarioRepository {

	void cadastrar(Comentario comentario);
	
	void atualizar(Comentario comentario);
	
	void deletar(Comentario comentario);

	int getTotalComentariosBlogPendentes();

	List<Comentario> listar(Status status);

	Comentario obterPor(String uuid);	

}
