package br.com.ammf.repository.imp;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import br.com.ammf.model.Depoimento;
import br.com.ammf.model.Local;
import br.com.ammf.model.Status;
import br.com.ammf.model.Texto;
import br.com.ammf.repository.DepoimentoRepository;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class DepoimentoDao implements DepoimentoRepository {

	private final Session session;
	
	public DepoimentoDao(Session session){
		this.session = session;
	}
	
	@Override
	public void cadastrar(Depoimento depoimento) {
		Transaction transaction = session.beginTransaction();
		depoimento.setStatus(Status.PENDENTE);
		session.save(depoimento);
		transaction.commit();		
	}
	
	@Override
	public void confirmar(String uuid) {
		Criteria criteria = session.createCriteria(Depoimento.class);
		criteria.add(Restrictions.eq("uuid", uuid));
		Depoimento depoimento = (Depoimento) criteria.uniqueResult();
		depoimento.setStatus(Status.CONFIRMADO);
		Transaction transaction = session.beginTransaction();
		session.update(depoimento);
		transaction.commit();		
	}
	
	@Override
	public void deletar(String uuid) {
		Criteria criteria = session.createCriteria(Depoimento.class);
		criteria.add(Restrictions.eq("uuid", uuid));
		Depoimento depoimento = (Depoimento) criteria.uniqueResult();
		Transaction transaction = session.beginTransaction();
		session.delete(depoimento);
		transaction.commit();		
	}
	
	@Override
	public List<Depoimento> listarTodos() {
		return session.createCriteria(Depoimento.class).list();
	}

	@Override
	public List<Depoimento> listarTodos(Status status) {
		Criteria criteria = session.createCriteria(Depoimento.class);
		criteria.add(Restrictions.eq("status", status));
		criteria.addOrder(Order.desc("postagem"));
		return criteria.list();
	}

	@Override
	public List<Depoimento> listarPorNomeEEmail(String paramConsulta) {
		Criteria criteria = session.createCriteria(Depoimento.class);
		criteria.add(Restrictions.or(
				Restrictions.like("autor", "%" + paramConsulta + "%"), 
				Restrictions.like("email", "%" + paramConsulta + "%")));		
		return criteria.list();
	}

	@Override
	public int getTotalDepoimentosCadastrados() {
		return session.createCriteria(Depoimento.class).list().size();
	}

	@Override
	public int getTotalDepoimentosConfirmados() {
		Criteria criteria = session.createCriteria(Depoimento.class);
		criteria.add(Restrictions.eq("status", Status.CONFIRMADO));
		return criteria.list().size();
	}

	@Override
	public int getTotalDepoimentosPendentes() {
		Criteria criteria = session.createCriteria(Depoimento.class);
		criteria.add(Restrictions.eq("status", Status.PENDENTE));
		return criteria.list().size();
	}		
}
