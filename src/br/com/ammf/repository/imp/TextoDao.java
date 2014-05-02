package br.com.ammf.repository.imp;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import br.com.ammf.exception.ErroAplicacao;
import br.com.ammf.exception.Excecao;
import br.com.ammf.model.Local;
import br.com.ammf.model.Texto;
import br.com.ammf.repository.TextoRepository;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class TextoDao implements TextoRepository{
	
	private final Session session;
	
	public TextoDao(Session session){
		this.session =  session;
	}

	@Override
	public void cadastrar(Texto texto) {
		try {			
			session.save(texto);			
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() +  " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Texto> listar(Local local, String orderBy, boolean travado) {
		try {
			Criteria criteria = session.createCriteria(Texto.class);
			criteria.add(Restrictions.eq("local", local));
			if(travado) criteria.add(Restrictions.eq("confirmado", true));
			criteria.addOrder(Order.desc(orderBy));
			return criteria.list();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() +  " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object[]> listarTitulos() {
		try {
			String sql = "select t.titulo, t.postagem, t.uuid from Texto t";
			Query query = session.createQuery(sql);
			return query.list();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() +  " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

	@Override
	public Texto obterPor(String uuid) {
		try {
			Criteria criteria = session.createCriteria(Texto.class);
			criteria.add(Restrictions.eq("uuid", uuid));
			return (Texto) criteria.uniqueResult();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() +  " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

	@Override
	public Texto getTextoIndex() {
		try {
			Criteria criteria = session.createCriteria(Texto.class);
			criteria.add(Restrictions.eq("local", Local.INDEX));
			return (Texto) criteria.uniqueResult();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() +  " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}
	
	@Override
	public Texto getTextoPsicologia() {
		try {
			Criteria criteria = session.createCriteria(Texto.class);
			criteria.add(Restrictions.eq("local", Local.PSICOLOGIA));
			return (Texto) criteria.uniqueResult();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() +  " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}
	
	@Override
	public Texto getTextoCliente(Local local) {
		try {
			Criteria criteria = session.createCriteria(Texto.class);
			criteria.add(Restrictions.eq("local", local));
			criteria.add(Restrictions.eq("confirmado", true));
			return (Texto) criteria.uniqueResult();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() +  " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}
	
	@Override
	public Texto getTextoEducacao() {
		try {
			Criteria criteria = session.createCriteria(Texto.class);
			criteria.add(Restrictions.eq("local", Local.EDUCACAO));
			return (Texto) criteria.uniqueResult();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() +  " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}
	
	@Override
	public Texto getTextoCultura() {
		try {
			Criteria criteria = session.createCriteria(Texto.class);
			criteria.add(Restrictions.eq("local", Local.CULTURA));
			return (Texto) criteria.uniqueResult();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() +  " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

	@Override
	public Texto getTextoArtesOrientais() {
		try {
			Criteria criteria = session.createCriteria(Texto.class);
			criteria.add(Restrictions.eq("local", Local.ARTESORIENTAIS));
			return (Texto) criteria.uniqueResult();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() +  " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}
	
	@Override
	public Texto getTextoQuiron() {
		try {
			Criteria criteria = session.createCriteria(Texto.class);
			criteria.add(Restrictions.eq("local", Local.QUIRON));
			return (Texto) criteria.uniqueResult();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() +  " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}	

	@Override
	public void atualizarTextoIndex(Texto texto) {
		try {
			Texto textoIndex = getTextoIndex();
			textoIndex.setAutor(texto.getAutor());
			textoIndex.setConteudo(texto.getConteudo());		
			session.update(textoIndex);
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() +  " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

	@Override
	public void atualizarTextoPsicologia(Texto texto) {
		try {
			Texto textoPsicologia = getTextoPsicologia();
			textoPsicologia.setConteudo(texto.getConteudo());
			textoPsicologia.setConfirmado(true);
			session.update(textoPsicologia);
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() +  " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}
	
	@Override
	public void atualizarTextoEducacao(Texto texto) {
		try {
			Texto textoEducacao = getTextoEducacao();
			textoEducacao.setConteudo(texto.getConteudo());
			textoEducacao.setConfirmado(true);
			session.update(textoEducacao);
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() +  " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

	@Override
	public void atualizarTextoCultura(Texto texto) {
		try {
			Texto textoCultura = getTextoCultura();
			textoCultura.setConteudo(texto.getConteudo());
			textoCultura.setConfirmado(true);
			session.update(textoCultura);
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() +  " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

	@Override
	public void atualizarTextoArtesOrientais(Texto texto) {
		try {
			Texto textoArtesOrientais = getTextoArtesOrientais();
			textoArtesOrientais.setConteudo(texto.getConteudo());
			textoArtesOrientais.setConfirmado(true);
			session.update(textoArtesOrientais);
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() +  " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}
	
	@Override
	public void atualizarTextoQuiron(Texto texto) {
		try {
			Texto textoQuiron = getTextoQuiron();
			textoQuiron.setConteudo(texto.getConteudo());
			textoQuiron.setConfirmado(true);
			session.update(textoQuiron);
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() +  " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}	

	@SuppressWarnings("unchecked")
	@Override
	public List<Texto> listarTitulos(String titulo) {
		try {
			Criteria criteria = session.createCriteria(Texto.class);
			criteria.add(Restrictions.like("titulo", "%" + titulo + "%"));
			criteria.add(Restrictions.eq("local", Local.BLOG));
			return criteria.list();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() +  " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}
	
	@Override
	public void deletar(String uuid) {
		try {
			Criteria criteria = session.createCriteria(Texto.class);
			criteria.add(Restrictions.eq("uuid", uuid));
			Texto texto = (Texto) criteria.uniqueResult();
			texto.setConfirmado(true);
			session.delete(texto);
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() +  " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}	

	@Override
	public long obterId(String uuid) {
		try {
			Criteria criteria = session.createCriteria(Texto.class);
			criteria.add(Restrictions.eq("uuid", uuid));
			Texto texto = (Texto) criteria.uniqueResult();
			return texto.getId();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() +  " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

	@Override
	public void atualizar(Texto texto) {
		try {
			session.update(texto);			
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() +  " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

	@Override
	public Texto obterUltimaPublicacao() {
		try {
			String sql = "select max(id) from Texto where local='BLOG' and confirmado is true";
			Query query = session.createQuery(sql);
			Long id = (Long) query.uniqueResult();
			Criteria criteria = session.createCriteria(Texto.class);
			criteria.add(Restrictions.eq("id", id));
			Texto texto = (Texto) criteria.uniqueResult();
			return texto;
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() +  " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

	@Override
	public Texto obterConfirmadoPor(String uuid) {
		try {
			Criteria criteria = session.createCriteria(Texto.class);
			criteria.add(Restrictions.eq("uuid", uuid));
			criteria.add(Restrictions.eq("confirmado", true));
			Texto texto = (Texto) criteria.uniqueResult();
			return texto;
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() +  " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}
	
}
