package br.com.ammf.repository.imp;

import org.hibernate.Session;
import org.hibernate.Transaction;

import br.com.ammf.model.Resenha;
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

}
