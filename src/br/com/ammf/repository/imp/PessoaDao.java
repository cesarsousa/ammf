package br.com.ammf.repository.imp;

import org.hibernate.Session;
import org.hibernate.Transaction;

import br.com.ammf.model.Pessoa;
import br.com.ammf.repository.PessoaRepository;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class PessoaDao implements PessoaRepository {
	
	private final Session session;
	
	public PessoaDao(Session session){
		this.session = session;
	}

	@Override
	public void cadastrar(Pessoa pessoa) {
		Transaction transaction = session.beginTransaction();
		session.save(pessoa);
		transaction.commit();		
	}

}
