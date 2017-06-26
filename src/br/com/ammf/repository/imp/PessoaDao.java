package br.com.ammf.repository.imp;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import br.com.ammf.exception.ErroAplicacao;
import br.com.ammf.exception.Excecao;
import br.com.ammf.model.Pessoa;
import br.com.ammf.model.Situacao;
import br.com.ammf.model.Status;
import br.com.ammf.repository.PessoaRepository;
import br.com.ammf.utils.DataUtils;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class PessoaDao implements PessoaRepository {
	
	private final Session session;
	
	public PessoaDao(Session session){
		this.session = session;
	}

	@Override
	public void cadastrar(Pessoa pessoa) {
		try {
			session.save(pessoa);
		} catch (Exception e) {
			 throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Pessoa> listar() {
		try {
			Criteria criteria = session.createCriteria(Pessoa.class);
			return criteria.list();
		} catch (Exception e) {
			 throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Pessoa> listarPorNomeEmail(String paramConsulta) {		
		try {
			Criteria criteria = session.createCriteria(Pessoa.class);
			criteria.add(Restrictions.or(
					Restrictions.like("nome", "%" + paramConsulta + "%"), 
					Restrictions.like("email", "%" + paramConsulta + "%")));		
			return criteria.list();
		} catch (Exception e) {
			 throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Pessoa> listarPorStatus(Status status) {
		try {
			Criteria criteria = session.createCriteria(Pessoa.class);
			criteria.add(Restrictions.eq("status", status));
			return criteria.list();
		} catch (Exception e) {
			 throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Pessoa> listarPorStatus(Status status, Situacao situacao) {
		try {
			Criteria criteria = session.createCriteria(Pessoa.class);
			criteria.add(Restrictions.eq("status", status));
			criteria.add(Restrictions.eq("situacao", situacao));
			return criteria.list();
		} catch (Exception e) {
			 throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> listarEmails() {
		try {
			Query query =session.createQuery("select p.email from Pessoa p");          
		    List<String> emails = query.list();
		    return emails;
		} catch (Exception e) {
			 throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

	@Override
	public void remover(Pessoa pessoa, Situacao situacao) {
		try {
			pessoa.setDataExclusao(DataUtils.getDateNow());
			pessoa.setSituacao(situacao);
			session.update(pessoa);
		} catch (Exception e) {
			 throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}
	
	@Override
	public void confirmar(Pessoa pessoa) {
		try {
			pessoa.setStatus(Status.CONFIRMADO);
			pessoa.setSituacao(Situacao.ATIVO);
			session.update(pessoa);
		} catch (Exception e) {
			 throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}
	
	@Override
	public void ativar(Pessoa pessoa) {
		try {
			pessoa.setSituacao(Situacao.ATIVO);
			session.update(pessoa);
		} catch (Exception e) {
			 throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}
	
	@Override
	public void atualizar(Pessoa pessoa) {
		try {
			session.update(pessoa);
		} catch (Exception e) {
			 throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}	

	@Override
	public Pessoa obterPeloUuid(String uuid) {
		try {
			Criteria criteria = session.createCriteria(Pessoa.class);
			criteria.add(Restrictions.eq("uuid", uuid));
			return (Pessoa) criteria.uniqueResult();	
		} catch (Exception e) {
			 throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}
	
	@Override
	public Pessoa obterPeloEmail(String email) {
		try {
			Criteria criteria = session.createCriteria(Pessoa.class);
			criteria.add(Restrictions.eq("email", email));
			return (Pessoa) criteria.uniqueResult();
		} catch (Exception e) {
			 throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

	@Override
	public boolean jaEstaCadastrada(String email) {
		try {
			Criteria criteria = session.createCriteria(Pessoa.class);
			criteria.add(Restrictions.eq("email", email));
			Pessoa pessoa = (Pessoa) criteria.uniqueResult();
			return pessoa == null ? false : true;
		} catch (Exception e) {
			 throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}
	
	@Override
	public boolean jaFoiRemovida(String email) {
		try {
			Criteria criteria = session.createCriteria(Pessoa.class);
			criteria.add(Restrictions.eq("email", email));
			criteria.add(Restrictions.ne("situacao", Situacao.ATIVO));
			Pessoa pessoa = (Pessoa) criteria.uniqueResult();
			return pessoa == null ? false : true;
		} catch (Exception e) {
			 throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

	@Override
	public int totalCadastrosPendentes() {
		try {
			Criteria criteria = session.createCriteria(Pessoa.class);
			criteria.add(Restrictions.eq("status", Status.PENDENTE));
			return criteria.list().size();
		} catch (Exception e) {
			 throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

	@Override
	/**
	 * Listagem utilizada para retorno via JSON 
	 */
	public List<Pessoa> obter(long id) {
		try {
			Criteria criteria = session.createCriteria(Pessoa.class);
			criteria.add(Restrictions.eq("id", id));
			Pessoa pessoa = (Pessoa) criteria.uniqueResult();
			List<Pessoa> pessoas = new ArrayList<Pessoa>();
			if(pessoa != null){
				pessoas.add(pessoa);
			}
			return pessoas;
		} catch (Exception e) {
			 throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

}
