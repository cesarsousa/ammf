package br.com.ammf.repository.imp;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.hibernate.criterion.SimpleExpression;

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
	public List<Participante> buscarPorNome(String parametro, String parametroEvento) {
		try {
			Criteria criteria = session.createCriteria(Participante.class, "p");
			if(parametroEvento != null) {
				
				String[] valores = parametroEvento.split(Pattern.quote("."));
				
				criteria.createAlias("p.evento", "e");
				
				if(valores.length == 1) {
					criteria.add(Restrictions.like("e.data", "%" + parametroEvento + "%"));	
				}else if(valores.length == 2) {
					SimpleExpression param1 = Restrictions.like("e.data", "%" + valores[0] + "%");
					SimpleExpression param2 = Restrictions.like("e.data", "%" + valores[1] + "%");
					criteria.add(Restrictions.and(param1, param2));	
				}else {
					return new ArrayList<Participante>();
				}
			}
			if(parametro != null) {
				criteria.add(Restrictions.like("nome", "%" + parametro + "%"));	
			}
			criteria.addOrder(Order.desc("id"));
			return criteria.list();
		} catch (Exception e) {
			 throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

}
