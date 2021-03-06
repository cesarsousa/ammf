package br.com.ammf.repository.imp;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
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
	public List<Resenha> listar(boolean predefinida) {
		try {
			Criteria criteria = session.createCriteria(Resenha.class);
            if (!predefinida) {
            	criteria.add(Restrictions.eq("predefinida", predefinida));
			}
			criteria.addOrder(Order.desc("postagem"));
			//criteria.setMaxResults(20);
			return criteria.list();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() +  " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

	@Override
	public void deletar(Resenha resenha) {
		try {
			session.delete(resenha);
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
			session.save(novaCategoria);
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
		
	}

	@Override
	public Resenha ultimaResenhaPublicada() {
		try {			
			Criteria criteria = session.createCriteria(Resenha.class);
			criteria.add(Restrictions.eq("predefinida", false));
			criteria.addOrder(Order.desc("postagem"));
			criteria.setMaxResults(1);
			return (Resenha) criteria.uniqueResult();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Resenha> listarPorCategorias(Long idCategoria) {
		try {			
			Criteria criteria = session.createCriteria(Resenha.class);
			criteria.add(Restrictions.eq("categoria.id", idCategoria));
			criteria.add(Restrictions.eq("predefinida", false));
			criteria.addOrder(Order.desc("postagem"));
			return criteria.list();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
		
	}

	@Override
	public Resenha obterUltimaPublicacao() {
		try {
			String sql = "select max(id) from Resenha where predefinida = 0";
			Query query = session.createQuery(sql);
			Long id = (Long) query.uniqueResult();
			Criteria criteria = session.createCriteria(Resenha.class);
			criteria.add(Restrictions.eq("id", id));
			Resenha resenha = (Resenha) criteria.uniqueResult();
			return resenha;
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() +  " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

	@Override
	public int getTotalResenhasPredefinidas() {
		try {			
			Criteria criteria = session.createCriteria(Resenha.class);
			criteria.add(Restrictions.eq("predefinida", true));
			return criteria.list().size();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

}
