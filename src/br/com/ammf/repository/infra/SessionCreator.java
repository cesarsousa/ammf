package br.com.ammf.repository.infra;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import br.com.caelum.vraptor.ioc.Component;
import br.com.caelum.vraptor.ioc.ComponentFactory;

// @Component
public class SessionCreator implements ComponentFactory<Session>{
	
	private final SessionFactory factory;

	public SessionCreator(SessionFactory factory) {
		this.factory = factory;
	}

	public Session getInstance() {
		return factory.openSession();
	}
	
	
	
	/*private final SessionFactory factory;
	private Session session;
	
	public SessionCreator(SessionFactory factory){
		this.factory = factory;
	}
	
	@PostConstruct
	public void abrirSessao(){
		this.session = factory.openSession();
	}

	public Session getInstance() {
		return factory.openSession();
	}
	
	@PreDestroy
	public void fecharConexao(){
		this.session.close();
	}*/

}