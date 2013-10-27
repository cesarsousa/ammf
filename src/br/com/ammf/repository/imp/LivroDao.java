package br.com.ammf.repository.imp;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import br.com.ammf.exception.ErroAplicacao;
import br.com.ammf.exception.Excecao;
import br.com.ammf.model.Categoria;
import br.com.ammf.model.Livro;
import br.com.ammf.repository.LivroRepository;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class LivroDao implements LivroRepository {

	private final Session session;
	
	public LivroDao(Session session){
		this.session = session;
	}

	@Override
	public void cadastrar(Livro livro) {
		try {
			Transaction transaction = session.beginTransaction();
			session.save(livro);			
			transaction.commit();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}				
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Livro> listar(){
		try{
			Criteria criteria = session.createCriteria(Livro.class);
			return criteria.list();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}
	}

	@Override
	public void atualizar(Livro livro) {
		try {
			Transaction transaction = session.beginTransaction();
			session.update(livro);
			transaction.commit();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}				
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Livro> listarPorAutorTitulo(String param) {
		try {
			Criteria criteria = session.createCriteria(Livro.class);
			criteria.add(Restrictions.or(
					Restrictions.like("autor", "%" + param + "%"), 
					Restrictions.like("titulo", "%" + param + "%")));		
			return criteria.list();			
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}		
	}

	@Override
	public Livro obterPorUuid(String uuid) {
		try {
			Criteria criteria = session.createCriteria(Livro.class);
			criteria.add(Restrictions.eq("uuid", uuid));
			return (Livro) criteria.uniqueResult();
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}		
	}

	@Override
	public void cadastrarCategoria(Categoria categoria) {
		try {
			session.save(categoria);
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}		
	}

	@Override
	public String remover(String uuid) {
		try {
			String caminhoDaImagem = null;
			Criteria criteria = session.createCriteria(Livro.class);
			criteria.add(Restrictions.eq("uuid", uuid));
			Livro livro = (Livro) criteria.uniqueResult();
			
			if(livro.getImagem() != null){
				caminhoDaImagem = livro.getImagem().getCaminho();
			}			
			
			session.delete(livro);
			return caminhoDaImagem;
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}		
	}

}
