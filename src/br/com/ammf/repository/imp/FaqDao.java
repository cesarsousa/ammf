package br.com.ammf.repository.imp;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import br.com.ammf.exception.DBException;
import br.com.ammf.exception.ErroAplicacao;
import br.com.ammf.exception.Excecao;
import br.com.ammf.model.Faq;
import br.com.ammf.repository.FaqRepository;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class FaqDao implements FaqRepository{
	
	private Session session;
	
	public FaqDao(Session session){
		this.session = session;
	}

	@Override
	public void cadastrar(Faq faq) throws DBException {
		try {
			Transaction transaction = session.beginTransaction();
			session.save(faq);
			transaction.commit();
		} catch (Exception e) {
			new ErroAplicacao(new Excecao(this.getClass().getSimpleName() +  " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
			throw new DBException(this.getClass().getSimpleName(), e);
		}		
	}

	@Override
	public int totalPerguntasSemRespostas() {
		try {
			Criteria criteria = session.createCriteria(Faq.class);
			criteria.add(Restrictions.isNull("resposta"));
			return criteria.list().size();			
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() +  " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}		
	}

	@Override
	public List<Faq> listar() {
		try {
			Criteria criteria = session.createCriteria(Faq.class);
			criteria.addOrder(Order.desc("postagem"));
			return criteria.list();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() +  " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

	@Override
	public List<Faq> listarRespondidas() {
		try {
			Criteria criteria = session.createCriteria(Faq.class);
			criteria.add(Restrictions.isNotNull("resposta"));
			criteria.addOrder(Order.desc("postagem"));
			return criteria.list();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() +  " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

	@Override
	public List<Faq> listarNaoRespondiddas() {
		try {
			Criteria criteria = session.createCriteria(Faq.class);
			criteria.add(Restrictions.isNull("resposta"));
			criteria.addOrder(Order.desc("postagem"));
			return criteria.list();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() +  " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}
	
	@Override
	public List<Faq> listarRespondidasParaCliente() {
		try {
			Criteria criteria = session.createCriteria(Faq.class);
			criteria.add(Restrictions.isNotNull("resposta"));
			criteria.add(Restrictions.eq("publica", true));
			criteria.addOrder(Order.desc("postagem"));
			return criteria.list();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() +  " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}	

	@Override
	public Faq obter(String uuid) {
		try {
			Criteria criteria = session.createCriteria(Faq.class);
			criteria.add(Restrictions.eq("uuid", uuid));
			return (Faq) criteria.uniqueResult();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() +  " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

	@Override
	public void atualizar(Faq faq) {
		try {
			Transaction transaction = session.beginTransaction();
			session.update(faq);
			transaction.commit();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() +  " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}	
		
	}

	@Override
	public void deletar(String uuid) {
		try {
			Criteria criteria = session.createCriteria(Faq.class);
			criteria.add(Restrictions.eq("uuid", uuid));
			Faq faq = (Faq) criteria.uniqueResult();
			Transaction transaction = session.beginTransaction();
			session.delete(faq);
			transaction.commit();	
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
		
	}

	

}
