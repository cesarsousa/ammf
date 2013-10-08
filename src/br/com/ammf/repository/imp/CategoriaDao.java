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
import br.com.ammf.model.TipoCategoria;
import br.com.ammf.repository.CategoriaRepository;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class CategoriaDao implements CategoriaRepository {
	
	private Session session;
	
	public CategoriaDao(Session session){
		this.session = session;
	}

	@Override
	public void salvar(Categoria categoria) {
		try {
			Transaction transaction = session.beginTransaction();
			session.save(categoria);
			transaction.commit();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Categoria> listarPorTipo(TipoCategoria tipoCategoria) {
		try {
			Criteria criteria = session.createCriteria(Categoria.class);
			criteria.add(Restrictions.eq("tipoCategoria", tipoCategoria));
			criteria.addOrder(Order.asc("descricao"));
			return criteria.list();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

	@Override
	public Categoria obterPor(long id) {
		try {
			Criteria criteria = session.createCriteria(Categoria.class);
			criteria.add(Restrictions.eq("id", id));
			return (Categoria) criteria.uniqueResult();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}
	
	

}
