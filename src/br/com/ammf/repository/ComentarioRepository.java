package br.com.ammf.repository;

import java.util.List;

import br.com.ammf.model.Comentario;
import br.com.ammf.model.Local;
import br.com.ammf.model.Status;

public interface ComentarioRepository {

	void cadastrar(Comentario comentario);
	
	void atualizar(Comentario comentario);
	
	void deletar(Comentario comentario);	

	List<Comentario> listar(Status status, Local local);

	Comentario obterPor(String uuid);
	
	int getTotalComentariosPendentes(Local local);

}
