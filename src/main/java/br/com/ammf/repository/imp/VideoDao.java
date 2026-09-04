package br.com.ammf.repository.imp;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import br.com.ammf.exception.ErroAplicacao;
import br.com.ammf.exception.Excecao;
import br.com.ammf.model.Video;
import br.com.ammf.repository.VideoRepository;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class VideoDao implements VideoRepository{
	
private final Session session;
	
	public VideoDao(Session session){
		this.session = session;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Video> obterVideosAtivos() {
		try{
			Criteria criteria = session.createCriteria(Video.class);
			criteria.add(Restrictions.eq("ativo", true));
			criteria.addOrder(Order.desc("id"));
			return criteria.list();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Video> listarTodosDescrecente() {
		try{
			Criteria criteria = session.createCriteria(Video.class);
			criteria.addOrder(Order.desc("id"));
			return criteria.list();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

	@Override
	public void salvar(Video video) {
		try {
			Transaction transaction = session.beginTransaction();
			session.save(video);			
			transaction.commit();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}	
		
	}

	@Override
	public Video obterPorId(long id) {
		try{
			Criteria criteria = session.createCriteria(Video.class);
			criteria.add(Restrictions.eq("id", id));
			return (Video) criteria.uniqueResult();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

	@Override
	public void excluir(Video video) {
		try {
			Transaction transaction = session.beginTransaction();
			session.delete(video);			
			transaction.commit();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}	
	}

}
