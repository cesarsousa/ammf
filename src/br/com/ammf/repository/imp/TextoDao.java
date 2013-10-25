package br.com.ammf.repository.imp;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
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
	public List<Texto> listar(Local local, String orderBy) {
		try {
			Criteria criteria = session.createCriteria(Texto.class);
			criteria.add(Restrictions.eq("local", local));
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
			Transaction transaction = session.beginTransaction();
			session.update(textoIndex);
			transaction.commit();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() +  " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

	@Override
	public void atualizarTextoPsicologia(Texto texto) {
		try {
			Texto textoPsicologia = getTextoPsicologia();
			textoPsicologia.setConteudo(texto.getConteudo());
			Transaction transaction = session.beginTransaction();
			session.update(textoPsicologia);
			transaction.commit();	
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() +  " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}
	
	@Override
	public void atualizarTextoEducacao(Texto texto) {
		try {
			Texto textoEducacao = getTextoEducacao();
			textoEducacao.setConteudo(texto.getConteudo());
			Transaction transaction = session.beginTransaction();
			session.update(textoEducacao);
			transaction.commit();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() +  " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

	@Override
	public void atualizarTextoCultura(Texto texto) {
		try {
			Texto textoCultura = getTextoCultura();
			textoCultura.setConteudo(texto.getConteudo());
			Transaction transaction = session.beginTransaction();
			session.update(textoCultura);
			transaction.commit();	
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() +  " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

	@Override
	public void atualizarTextoArtesOrientais(Texto texto) {
		try {
			Texto textoArtesOrientais = getTextoArtesOrientais();
			textoArtesOrientais.setConteudo(texto.getConteudo());
			Transaction transaction = session.beginTransaction();
			session.update(textoArtesOrientais);
			transaction.commit();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() +  " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}
	
	@Override
	public void atualizarTextoQuiron(Texto texto) {
		try {
			Texto textoQuiron = getTextoQuiron();
			textoQuiron.setConteudo(texto.getConteudo());
			Transaction transaction = session.beginTransaction();
			session.update(textoQuiron);
			transaction.commit();
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
			Transaction transaction = session.beginTransaction();
			session.delete(texto);
			transaction.commit();
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
			String sql = "select max(id) from Texto where local='BLOG'";
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

	
}
