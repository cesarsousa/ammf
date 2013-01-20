package br.com.ammf.repository.imp;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import br.com.ammf.exception.DBException;
import br.com.ammf.model.Pessoa;
import br.com.ammf.model.Status;
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

	@Override
	public List<Pessoa> listarPorNomeEmail(String paramConsulta) {		
		Criteria criteria = session.createCriteria(Pessoa.class);
		criteria.add(Restrictions.or(
				Restrictions.like("nome", "%" + paramConsulta + "%"), 
				Restrictions.like("email", "%" + paramConsulta + "%")));		
		return criteria.list();
	}

	@Override
	public List<Pessoa> listarPorStatus(Status status) {
		Criteria criteria = session.createCriteria(Pessoa.class);
		criteria.add(Restrictions.eq("status", status));
		return criteria.list();
	}

	@Override
	public List<String> listarEmails() {
		 Query query =session.createQuery("select p.email from Pessoa p");          
	     List<String> emails = query.list();
	     return emails;		
	}

	@Override
	public void remover(Pessoa pessoa) {
		Transaction transaction = session.beginTransaction();		
		session.delete(pessoa);
		transaction.commit();		
	}

	@Override
	public Pessoa obter(String uuid) {
		Criteria criteria = session.createCriteria(Pessoa.class);
		criteria.add(Restrictions.eq("uuid", uuid));
		return (Pessoa) criteria.uniqueResult();		
	}

	@Override
	public boolean jaEstaCadastrada(String email) {
		Criteria criteria = session.createCriteria(Pessoa.class);
		criteria.add(Restrictions.eq("email", email));
		Pessoa pessoa = (Pessoa) criteria.uniqueResult();
		return pessoa == null ? false : true;
	}

}
