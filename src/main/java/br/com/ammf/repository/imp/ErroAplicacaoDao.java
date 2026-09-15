package br.com.ammf.repository.imp;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;

import br.com.ammf.model.LogAplicacao;
import br.com.ammf.repository.ErroAplicacaoRepository;

import javax.inject.Inject;

public class ErroAplicacaoDao implements ErroAplicacaoRepository {

	private Session session;

	@Inject
	public ErroAplicacaoDao(Session session){
		this.session = session;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<LogAplicacao> listar() {
		Criteria criteria = session.createCriteria(LogAplicacao.class);
		criteria.addOrder(Order.desc("id"));
		return criteria.list();
	}
}
