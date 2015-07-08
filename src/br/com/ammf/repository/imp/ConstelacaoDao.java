package br.com.ammf.repository.imp;

import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import br.com.ammf.exception.ErroAplicacao;
import br.com.ammf.exception.Excecao;
import br.com.ammf.model.Constelacao;
import br.com.ammf.model.Evento;
import br.com.ammf.model.TipoEvento;
import br.com.ammf.repository.ConstelacaoRepository;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class ConstelacaoDao implements ConstelacaoRepository{
	
private Session session;
	
	public ConstelacaoDao(Session session){
		this.session = session;
	}

	@Override
	public void salvarAtualizar(Constelacao constelacao) {
		
		try {
			Constelacao textosConstelacao  = get();
			if(textosConstelacao == null){
				textosConstelacao = new Constelacao();
			}
			textosConstelacao.setTextoInicial(constelacao.getTextoInicial());
			textosConstelacao.setFormaPagamento(constelacao.getFormaPagamento());
			textosConstelacao.setTextoFinal(constelacao.getTextoFinal());
			textosConstelacao.setData(constelacao.getData());
			textosConstelacao.setLocalizacao(constelacao.getLocalizacao());
			textosConstelacao.setInformacao(constelacao.getInformacao());
			textosConstelacao.setDadosPessoais(constelacao.getDadosPessoais());
			session.saveOrUpdate(textosConstelacao);
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() +  " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
			
	}

	@Override
	public Constelacao get() {
		try {
			Criteria criteria = session.createCriteria(Constelacao.class);
			Constelacao constelacao = (Constelacao) criteria.uniqueResult();
			if(constelacao == null) return new Constelacao();			
			return constelacao;
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

	@Override
	public void cadastrar(Evento evento) {
		try {
			evento.setTipoEvento(TipoEvento.CONSTELACAO);
			evento.setPostagem(new Date());
			session.save(evento);
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Evento> listar(TipoEvento tipoEvento) {
		try {
			Criteria criteria = session.createCriteria(Evento.class);
			criteria.add(Restrictions.eq("tipoEvento", TipoEvento.CONSTELACAO));
			criteria.addOrder(Order.desc("id"));
			return criteria.list();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

}
