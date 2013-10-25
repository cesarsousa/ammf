package br.com.ammf.repository.imp;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import br.com.ammf.exception.ErroAplicacao;
import br.com.ammf.exception.Excecao;
import br.com.ammf.model.Categoria;
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
		try {
			session.save(resenha);
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() +  " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Texto> listar(String parametro) {
		try {
			Criteria criteria = session.createCriteria(Resenha.class);
			criteria.add(Restrictions.like("titulo", "%" + parametro + "%"));
			return criteria.list();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() +  " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Resenha> listar() {
		try {
			return session.createCriteria(Resenha.class).addOrder(Order.desc("postagem")).list();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() +  " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

	@Override
	public void deletar(Resenha resenha) {
		try {
			Transaction transaction = session.beginTransaction();
			session.delete(resenha);
			transaction.commit();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() +  " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

	@Override
	public Resenha obterPorUuid(String uuid) {
		try {
			Criteria criteria = session.createCriteria(Resenha.class);
			criteria.add(Restrictions.eq("uuid", uuid));
			return (Resenha) criteria.uniqueResult();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() +  " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

	@Override
	public void atualizar(Resenha resenha) {
		try {
			session.update(resenha);
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() +  " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

	@Override
	public void cadastrarCategoria(Categoria novaCategoria) {
		try {
			Transaction transaction = session.beginTransaction();
			session.save(novaCategoria);
			transaction.commit();			
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
		
	}

	@Override
	public List<Resenha> listarTop3() {
		try {			
			Criteria criteria = session.createCriteria(Resenha.class);
			criteria.addOrder(Order.desc("postagem"));
			criteria.setMaxResults(3);
			return criteria.list();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

	@Override
	public Resenha obterPor(String uuid) {
		try {			
			Criteria criteria = session.createCriteria(Resenha.class);
			criteria.add(Restrictions.eq("uuid", uuid));
			return (Resenha) criteria.uniqueResult();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

}
