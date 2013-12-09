package br.com.ammf.repository.imp;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import br.com.ammf.exception.ErroAplicacao;
import br.com.ammf.exception.Excecao;
import br.com.ammf.model.Depoimento;
import br.com.ammf.model.Status;
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
		try {
			depoimento.setStatus(Status.PENDENTE);
			session.save(depoimento);
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}
	
	@Override
	public void confirmar(String uuid) {
		try {
			Criteria criteria = session.createCriteria(Depoimento.class);
			criteria.add(Restrictions.eq("uuid", uuid));
			Depoimento depoimento = (Depoimento) criteria.uniqueResult();
			depoimento.setStatus(Status.CONFIRMADO);
			session.update(depoimento);
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}
	
	@Override
	public void deletar(String uuid) {
		try {
			Criteria criteria = session.createCriteria(Depoimento.class);
			criteria.add(Restrictions.eq("uuid", uuid));
			Depoimento depoimento = (Depoimento) criteria.uniqueResult();
			session.delete(depoimento);
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Depoimento> listarTodos() {
		try {
			return session.createCriteria(Depoimento.class).list();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Depoimento> listarTodos(Status status) {
		try {
			Criteria criteria = session.createCriteria(Depoimento.class);
			criteria.add(Restrictions.eq("status", status));
			criteria.addOrder(Order.desc("postagem"));
			return criteria.list();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Depoimento> listarPorNomeEEmail(String paramConsulta) {
		try {
			Criteria criteria = session.createCriteria(Depoimento.class);
			criteria.add(Restrictions.or(
					Restrictions.like("autor", "%" + paramConsulta + "%"), 
					Restrictions.like("email", "%" + paramConsulta + "%")));		
			return criteria.list();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

	@Override
	public int getTotalDepoimentosCadastrados() {
		try {
			return session.createCriteria(Depoimento.class).list().size();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

	@Override
	public int getTotalDepoimentosConfirmados() {
		try {
			Criteria criteria = session.createCriteria(Depoimento.class);
			criteria.add(Restrictions.eq("status", Status.CONFIRMADO));
			return criteria.list().size();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

	@Override
	public int getTotalDepoimentosPendentes() {
		try {
			Criteria criteria = session.createCriteria(Depoimento.class);
			criteria.add(Restrictions.eq("status", Status.PENDENTE));
			return criteria.list().size();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

	@Override
	public Depoimento obterUltimaPublicacao() {
		try {
			String sql = "select max(id) from Depoimento";
			Query query = session.createQuery(sql);
			Long id = (Long) query.uniqueResult();
			Criteria criteria = session.createCriteria(Depoimento.class);
			criteria.add(Restrictions.eq("id", id));
			Depoimento depoimento = (Depoimento) criteria.uniqueResult();
			return depoimento;
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() +  " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}		
}
