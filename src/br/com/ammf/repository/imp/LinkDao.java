package br.com.ammf.repository.imp;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import br.com.ammf.exception.ErroAplicacao;
import br.com.ammf.exception.Excecao;
import br.com.ammf.model.Link;
import br.com.ammf.repository.LinkRepository;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class LinkDao implements LinkRepository {
	
private final Session session;
	
	public LinkDao(Session session){
		this.session = session;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Link> listar() {
		try {
			Criteria criteria = session.createCriteria(Link.class);
			criteria.addOrder(Order.desc("postagem"));
			return criteria.list();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

	@Override
	public void cadastrar(Link link) {
		try {
			session.save(link);
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}		
	}

	@Override
	public void remover(String uuid) {
		try {
			Criteria criteria = session.createCriteria(Link.class);
			criteria.add(Restrictions.eq("uuid", uuid));
			Link link = (Link) criteria.uniqueResult();
			session.delete(link);
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}	

}
