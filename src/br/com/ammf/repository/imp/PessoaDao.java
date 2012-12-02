package br.com.ammf.repository.imp;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;

import br.com.ammf.exception.DBException;
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
	public void cadastrar(Pessoa pessoa) throws DBException {
		try{			
			Transaction transaction = session.beginTransaction();
			session.save(pessoa);
			transaction.commit();		
		}catch (Exception e) {
			throw new DBException("(PessoaDao) - cadastrar", e);
		}				
	}

	@Override
	public List<Pessoa> listar() {
		Criteria criteria = session.createCriteria(Pessoa.class);
		return criteria.list();
	}

}
