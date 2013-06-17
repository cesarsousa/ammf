package br.com.ammf.repository.imp;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

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
		Transaction transaction = session.beginTransaction();
		session.save(texto);
		transaction.commit();		
	}

	@Override
	public List<Texto> listar(Local local, String orderBy) {
		Criteria criteria = session.createCriteria(Texto.class);
		criteria.add(Restrictions.eq("local", local));
		criteria.addOrder(Order.desc(orderBy));
		return criteria.list();
	}

	@Override
	public List<Object[]> listarTitulos() {
		String sql = "select t.titulo, t.postagem, t.uuid from Texto t";
		Query query = session.createQuery(sql);
		return query.list();
	}

	@Override
	public Texto obterPor(String uuid) {
		Criteria criteria = session.createCriteria(Texto.class);
		criteria.add(Restrictions.eq("uuid", uuid));
		return (Texto) criteria.uniqueResult();
	}

	@Override
	public Texto getTextoIndex() {
		Criteria criteria = session.createCriteria(Texto.class);
		criteria.add(Restrictions.eq("local", Local.INDEX));
		return (Texto) criteria.uniqueResult();
	}
	
	@Override
	public Texto getTextoPsicologia() {
		Criteria criteria = session.createCriteria(Texto.class);
		criteria.add(Restrictions.eq("local", Local.PSICOLOGIA));
		return (Texto) criteria.uniqueResult();
	}
	
	@Override
	public Texto getTextoEducacao() {
		Criteria criteria = session.createCriteria(Texto.class);
		criteria.add(Restrictions.eq("local", Local.EDUCACAO));
		return (Texto) criteria.uniqueResult();
	}
	
	@Override
	public Texto getTextoCultura() {
		Criteria criteria = session.createCriteria(Texto.class);
		criteria.add(Restrictions.eq("local", Local.CULTURA));
		return (Texto) criteria.uniqueResult();
	}

	@Override
	public Texto getTextoArtesOrientais() {
		Criteria criteria = session.createCriteria(Texto.class);
		criteria.add(Restrictions.eq("local", Local.ARTESORIENTAIS));
		return (Texto) criteria.uniqueResult();
	}

	@Override
	public void atualizarTextoIndex(Texto texto) {
		Texto textoIndex = getTextoIndex();
		textoIndex.setAutor(texto.getAutor());
		textoIndex.setConteudo(texto.getConteudo());		
		Transaction transaction = session.beginTransaction();
		session.update(textoIndex);
		transaction.commit();	
	}

	@Override
	public void atualizarTextoPsicologia(Texto texto) {
		Texto textoPsicologia = getTextoPsicologia();
		textoPsicologia.setConteudo(texto.getConteudo());
		Transaction transaction = session.beginTransaction();
		session.update(textoPsicologia);
		transaction.commit();		
	}
	
	@Override
	public void atualizarTextoEducacao(Texto texto) {
		Texto textoEducacao = getTextoEducacao();
		textoEducacao.setConteudo(texto.getConteudo());
		Transaction transaction = session.beginTransaction();
		session.update(textoEducacao);
		transaction.commit();		
	}

	@Override
	public void atualizarTextoCultura(Texto texto) {
		Texto textoCultura = getTextoCultura();
		textoCultura.setConteudo(texto.getConteudo());
		Transaction transaction = session.beginTransaction();
		session.update(textoCultura);
		transaction.commit();		
	}

	@Override
	public void atualizarTextoArtesOrientais(Texto texto) {
		Texto textoArtesOrientais = getTextoArtesOrientais();
		textoArtesOrientais.setConteudo(texto.getConteudo());
		Transaction transaction = session.beginTransaction();
		session.update(textoArtesOrientais);
		transaction.commit();		
	}

	@Override
	public List<Texto> listarTitulos(String titulo) {
		Criteria criteria = session.createCriteria(Texto.class);
		criteria.add(Restrictions.like("titulo", "%" + titulo + "%"));
		criteria.add(Restrictions.eq("local", Local.BLOG));
		return criteria.list();
	}
	
	@Override
	public void deletar(String uuid) {
		Criteria criteria = session.createCriteria(Texto.class);
		criteria.add(Restrictions.eq("uuid", uuid));
		Texto texto = (Texto) criteria.uniqueResult();
		texto.setConfirmado(true);
		Transaction transaction = session.beginTransaction();
		session.delete(texto);
		transaction.commit();		
	}	

	@Override
	public long obterId(String uuid) {
		Criteria criteria = session.createCriteria(Texto.class);
		criteria.add(Restrictions.eq("uuid", uuid));
		Texto texto = (Texto) criteria.uniqueResult();
		return texto.getId();
	}

	@Override
	public void atualizar(Texto texto) {
		Transaction transaction = session.beginTransaction();
		session.update(texto);
		transaction.commit();		
	}

	@Override
	public Texto obterUuidUltimaPublicacao() {
		String sql = "select max(id) from Texto";
		Query query = session.createQuery(sql);
		Long id = (Long) query.uniqueResult();
		Criteria criteria = session.createCriteria(Texto.class);
		criteria.add(Restrictions.eq("id", id));
		Texto texto = (Texto) criteria.uniqueResult();
		return texto;
	}
}
