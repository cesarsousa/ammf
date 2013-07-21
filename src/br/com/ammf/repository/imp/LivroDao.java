package br.com.ammf.repository.imp;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;

import br.com.ammf.model.Livro;
import br.com.ammf.repository.LivroRepository;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class LivroDao implements LivroRepository {

	private final Session session;
	
	public LivroDao(Session session){
		this.session = session;
	}

	@Override
	public void cadastrar(Livro livro) {
		Transaction transaction = session.beginTransaction();
		session.save(livro);
		transaction.commit();		
	}

	@Override
	public List<Livro> listar() {
		Criteria criteria = session.createCriteria(Livro.class);
		return criteria.list();
	}

	@Override
	public void atualizar(Livro livro) {
		Transaction transaction = session.beginTransaction();
		session.update(livro);
		transaction.commit();		
	}	
}
