package br.com.ammf.repository.imp;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import br.com.ammf.exception.ErroAplicacao;
import br.com.ammf.exception.Excecao;
import br.com.ammf.model.Video;
import br.com.ammf.repository.VideoRepository;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class VideoDao implements VideoRepository{
	
private final Session session;
	
	public VideoDao(Session session){
		this.session = session;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Video> obterVideosAtivos() {
		try{
			Criteria criteria = session.createCriteria(Video.class);
			criteria.add(Restrictions.eq("ativo", true));
			criteria.addOrder(Order.desc("id"));
			return criteria.list();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

}
