package br.com.ammf.repository.imp;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import br.com.ammf.model.Local;
import br.com.ammf.model.Resenha;
import br.com.ammf.model.Texto;
import br.com.ammf.repository.ResenhaRepository;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class ResenhaDao implements ResenhaRepository {
	
	private final Session session;
	
	public ResenhaDao(Session session){
		this.session = session;
	}

	@Override
	public void cadastrar(Resenha resenha) {
		Transaction transaction = session.beginTransaction();
		session.save(resenha);
		transaction.commit();
	}

	@Override
	public List<Texto> listar(String parametro) {
		Criteria criteria = session.createCriteria(Resenha.class);
		criteria.add(Restrictions.like("titulo", "%" + parametro + "%"));
		/*criteria.add(Restrictions.eq("local", Local.BLOG));*/
		return criteria.list();
	}

	@Override
	public List<Texto> listar() {
		return session.createCriteria(Resenha.class).list();
	}

	@Override
	public void deletar(Resenha resenha) {
		Transaction transaction = session.beginTransaction();
		session.delete(resenha);
		transaction.commit();		
	}

	@Override
	public Resenha obterPorUuid(String uuid) {
		Criteria criteria = session.createCriteria(Resenha.class);
		criteria.add(Restrictions.eq("uuid", uuid));
		return (Resenha) criteria.uniqueResult();
	}

	@Override
	public void atualizar(Resenha resenha) {
		Transaction transaction = session.beginTransaction();
		session.update(resenha);
		transaction.commit();		
	}

}
