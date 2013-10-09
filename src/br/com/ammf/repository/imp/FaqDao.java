package br.com.ammf.repository.imp;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import br.com.ammf.exception.DBException;
import br.com.ammf.exception.ErroAplicacao;
import br.com.ammf.exception.Excecao;
import br.com.ammf.model.Faq;
import br.com.ammf.repository.FaqRepository;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class FaqDao implements FaqRepository{
	
	private Session session;
	
	public FaqDao(Session session){
		this.session = session;
	}

	@Override
	public void cadastrar(Faq faq) throws DBException {
		try {
			Transaction transaction = session.beginTransaction();
			session.save(faq);
			transaction.commit();
		} catch (Exception e) {
			new ErroAplicacao(new Excecao(this.getClass().getSimpleName() +  " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
			throw new DBException(this.getClass().getSimpleName(), e);
		}		
	}

	@Override
	public int totalPerguntasSemRespostas() {
		Criteria criteria = session.createCriteria(Faq.class);
		criteria.add(Restrictions.isNull("resposta"));
		return criteria.list().size();
	}	

}
