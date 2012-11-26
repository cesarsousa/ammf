package br.com.ammf.repository.infra;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import br.com.caelum.vraptor.ioc.Component;
import br.com.caelum.vraptor.ioc.ComponentFactory;

@Component
public class SessionCreator implements ComponentFactory<Session>{
	
	private final SessionFactory factory;
	
	public SessionCreator(SessionFactory factory){
		this.factory = factory;
	}

	public Session getInstance() {
		return factory.openSession();
	}

}