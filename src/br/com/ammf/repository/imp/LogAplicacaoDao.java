package br.com.ammf.repository.imp;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;

import br.com.ammf.exception.ErroAplicacao;
import br.com.ammf.model.LogAplicacao;
import br.com.ammf.repository.LogAplicacaoRepository;
import br.com.ammf.utils.HibernateUtil;

public class LogAplicacaoDao implements LogAplicacaoRepository {
	static Logger logger = Logger.getLogger(LogAplicacaoDao.class);
	
	private final Session session;
	
	public LogAplicacaoDao() {
		session = HibernateUtil.getSession();
	}

	@Override
	public void salvar(LogAplicacao logAplicacao) throws ErroAplicacao {
		Transaction transaction = session.beginTransaction();

		try {
			session.save(logAplicacao);
			session.flush();
			transaction.commit();

		} catch (Exception e) {
			logger.error("Erro ao salvar informação do log no Banco de Dados: " + logAplicacao.toString());
		} finally {
			session.close();
		}		
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<LogAplicacao> listar() {
		Criteria criteria = session.createCriteria(LogAplicacao.class);
		criteria.addOrder(Order.desc("id"));
		return criteria.list();
	}

}
