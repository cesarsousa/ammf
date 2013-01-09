package br.com.ammf.repository.imp;


import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

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
		Transaction transaction = session.beginTransaction();
		session.save(usuario);
		transaction.commit();
	}

	@Override
	public Usuario autenticar(String login, String senha) {
		Criteria criteria = session.createCriteria(Usuario.class);
		criteria.add(Restrictions.eq("login", login)).add(Restrictions.eq("senha", senha));
		return (Usuario) criteria.uniqueResult();
	}

	@Override
	public void atualizar(Usuario usuario) {		
		
		System.out.println("usuario");
		System.out.println(usuario.getUuid());
		
		// TODO atualizar usuario e tratar exceções.
		
	}

}
