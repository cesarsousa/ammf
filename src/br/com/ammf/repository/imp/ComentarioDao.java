package br.com.ammf.repository.imp;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import br.com.ammf.exception.ErroAplicacao;
import br.com.ammf.exception.Excecao;
import br.com.ammf.model.Comentario;
import br.com.ammf.model.Status;
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
	
	@Override
	public void atualizar(Comentario comentario) {
		try {
			session.update(comentario);
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}	
		
	}

	@Override
	public void deletar(Comentario comentario) {
		try {
			session.delete(comentario);
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}	
		
	}

	@Override
	public int getTotalComentariosBlogPendentes() {
		try {
			Criteria criteria = session.createCriteria(Comentario.class);
			criteria.add(Restrictions.eq("status", Status.PENDENTE));
			return criteria.list().size();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Comentario> listar(Status status) {
		try {
			Criteria criteria = session.createCriteria(Comentario.class);
			if(status != Status.TODOS){
				criteria.add(Restrictions.eq("status", status));
			}			
			return criteria.list();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

	@Override
	public Comentario obterPor(String uuid) {
		try {
			Criteria criteria = session.createCriteria(Comentario.class);
			criteria.add(Restrictions.eq("uuid", uuid));
			return (Comentario) criteria.uniqueResult();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}	

}
