package br.com.ammf.repository.imp;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import br.com.ammf.exception.ErroAplicacao;
import br.com.ammf.exception.Excecao;
import br.com.ammf.model.Participante;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class ParticipanteDao implements ParticipanteRepository {
	
private final Session session;
	
	public ParticipanteDao(Session session){
		this.session = session;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Participante> buscarPorNome(String parametro) {
		try {
			Criteria criteria = session.createCriteria(Participante.class);
			criteria.add(Restrictions.like("nome", "%" + parametro + "%"));	
			criteria.addOrder(Order.desc("id"));
			return criteria.list();
		} catch (Exception e) {
			 throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

}
