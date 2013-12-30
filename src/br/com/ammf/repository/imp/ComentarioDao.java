package br.com.ammf.repository.imp;

import org.hibernate.Session;

import br.com.ammf.exception.ErroAplicacao;
import br.com.ammf.exception.Excecao;
import br.com.ammf.model.Comentario;
import br.com.ammf.repository.ComentarioRepository;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class ComentarioDao implements ComentarioRepository{
	
private final Session session;
	
	public ComentarioDao(Session session){
		this.session = session;
	}

	@Override
	public void cadastrar(Comentario comentario) {
		try {
			session.save(comentario);
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}		
	}

}
