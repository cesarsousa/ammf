package br.com.ammf.interceptor;

import javax.inject.Inject;

import org.hibernate.Session;
import org.hibernate.Transaction;

import br.com.caelum.vraptor.AroundCall;
import br.com.caelum.vraptor.Intercepts;
import br.com.caelum.vraptor.interceptor.SimpleInterceptorStack;

/**
 * Substitui o HibernateTransactionInterceptor do modulo vraptor-hibernate (removido do pom.xml):
 * abre uma transacao por request e comita/desfaz ao final, mesmo comportamento que o
 * HibernateCustomProvider do VRaptor3 dava implicitamente.
 */
@Intercepts
public class HibernateTransactionInterceptor {

	private final Session session;

	protected HibernateTransactionInterceptor() {
		this.session = null;
	}

	@Inject
	public HibernateTransactionInterceptor(Session session) {
		this.session = session;
	}

	@AroundCall
	public void intercept(SimpleInterceptorStack stack) {
		Transaction transaction = session.beginTransaction();
		try {
			stack.next();
			if (transaction.isActive()) {
				transaction.commit();
			}
		} catch (RuntimeException e) {
			if (transaction.isActive()) {
				transaction.rollback();
			}
			throw e;
		}
	}

}
