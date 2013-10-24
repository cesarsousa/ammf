package br.com.ammf.repository.imp;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import br.com.ammf.exception.ErroAplicacao;
import br.com.ammf.exception.Excecao;
import br.com.ammf.model.Terapeuta;
import br.com.ammf.repository.TerapeutaRepository;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class TerapeutaDao implements TerapeutaRepository {
	
	private final Session session;
	
	public TerapeutaDao(Session session){
		this.session = session;
	}

	@Override
	public Terapeuta get() {
		try {
			Criteria criteria = session.createCriteria(Terapeuta.class);
			criteria.add(Restrictions.eq("id", 1L));
			return (Terapeuta) criteria.uniqueResult();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() +  " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}		
	}

	@Override
	public void atualizar(Terapeuta terapeuta) {
		try{
			Transaction transaction = session.beginTransaction();
			session.update(terapeuta);
			transaction.commit();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() +  " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}		
	}

}
