package br.com.ammf.utils;

import javax.enterprise.context.RequestScoped;
import javax.enterprise.inject.Disposes;
import javax.enterprise.inject.Produces;

import org.hibernate.Session;

public class HibernateSessionProducer {

	@Produces
	@RequestScoped
	public Session createSession() {
		return HibernateUtil.getSession();
	}

	public void closeSession(@Disposes Session session) {
		if (session.isOpen()) {
			session.close();
		}
	}

}
