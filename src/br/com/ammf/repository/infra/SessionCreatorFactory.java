package br.com.ammf.repository.infra;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

import br.com.caelum.vraptor.ioc.Component;
import br.com.caelum.vraptor.ioc.ComponentFactory;

//@Component
public class SessionCreatorFactory implements ComponentFactory<SessionFactory>{
	
	public SessionFactory getInstance() {
		AnnotationConfiguration configuration = new AnnotationConfiguration();
		configuration.configure();

		SessionFactory factory = configuration.buildSessionFactory();
		return factory;
	}	
	

	/*// anotar a classe com @ApplicationScoped
	
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
	}*/

}
