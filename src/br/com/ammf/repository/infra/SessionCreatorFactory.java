package br.com.ammf.repository.infra;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

import br.com.caelum.vraptor.ioc.ApplicationScoped;
import br.com.caelum.vraptor.ioc.Component;
import br.com.caelum.vraptor.ioc.ComponentFactory;

@Component
@ApplicationScoped
public class SessionCreatorFactory implements ComponentFactory<SessionFactory>{

	private SessionFactory factory;
	
	@PostConstruct
	public void abrirConexao(){
		AnnotationConfiguration configuration = new AnnotationConfiguration();
		factory = configuration.buildSessionFactory();
	}	
	
	
	public SessionFactory getInstance() {		
		return this.factory;
	}
	
	@PreDestroy
	public void fecharConexao(){
		this.factory.close();
	}

}
