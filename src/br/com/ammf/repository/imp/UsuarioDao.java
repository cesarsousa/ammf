package br.com.ammf.repository.imp;


import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import br.com.ammf.exception.ErroAplicacao;
import br.com.ammf.exception.Excecao;
import br.com.ammf.model.Usuario;
import br.com.ammf.repository.UsuarioRepository;
import br.com.caelum.vraptor.ioc.Component;


@Component
public class UsuarioDao implements UsuarioRepository{
	
	private final Session session;
	
	public UsuarioDao(Session session){
		this.session =  session;
	}

	@Override
	public void salvar(Usuario usuario) {
		try {
			Transaction transaction = session.beginTransaction();
			session.save(usuario);
			transaction.commit();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() +  " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

	@Override
	public Usuario autenticar(String login, String senha) {
		try {
			Criteria criteria = session.createCriteria(Usuario.class);
			criteria.add(Restrictions.eq("login", login)).add(Restrictions.eq("senha", senha));
			return (Usuario) criteria.uniqueResult();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() +  " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

	@Override
	public void atualizar(Usuario usuario) {
		try {
			Transaction transaction = session.beginTransaction();
			session.update(usuario);
			transaction.commit();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() +  " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}
	
	@Override
	public long getId(String uuid) {
		try {
			Criteria criteria = session.createCriteria(Usuario.class);
			criteria.add(Restrictions.eq("uuid", uuid));
			Usuario usuario = (Usuario) criteria.uniqueResult();
			long id  = usuario.getId();
			return id;
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() +  " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

	@Override
	public Usuario obterAdministrador() {
		try {
			Criteria criteria = session.createCriteria(Usuario.class);
			criteria.add(Restrictions.eq("id", 1L));
			return (Usuario) criteria.uniqueResult();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() +  " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

}
