package br.com.ammf.repository.imp;


import org.hibernate.Session;
import org.hibernate.Transaction;

import br.com.ammf.model.Categoria;
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
		Transaction transaction = session.beginTransaction();
		session.save(categoria);
		transaction.commit();
	}
	
	

}
