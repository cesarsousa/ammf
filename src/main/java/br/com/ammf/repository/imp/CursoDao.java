package br.com.ammf.repository.imp;

import org.hibernate.Criteria;
import org.hibernate.Session;

import br.com.ammf.exception.ErroAplicacao;
import br.com.ammf.exception.Excecao;
import br.com.ammf.model.Curso;
import br.com.ammf.model.LocalEvento;
import br.com.ammf.repository.CursoRepository;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class CursoDao implements CursoRepository{
	
	private final Session session;
	
	public CursoDao(Session session){
		this.session = session;
	}

	@Override
	public Curso get() {
		Criteria criteria = session.createCriteria(Curso.class);
		Curso curso = (Curso) criteria.uniqueResult();
		if(curso == null) return new Curso();
		return curso;
	}

	@Override
	public void salvarAtualizar(Curso curso) {
		
		try {
			Curso cNew  = get();
			if(cNew == null){
				cNew = new Curso();
			}
			cNew.setLocalEvento(LocalEvento.NITEROI);
			cNew.setNome(curso.getNome());
			cNew.setDescricao(curso.getDescricao());
			cNew.setFormaPagamento(curso.getFormaPagamento());
			cNew.setData(curso.getData());
			cNew.setLocalizacao(curso.getLocalizacao());
			cNew.setInformacao(curso.getInformacao());
			cNew.setDadosPessoais(curso.getDadosPessoais());
			cNew.setLinkMapa(curso.getLinkMapa());
			cNew.setLocalMapa(curso.getLocalMapa());
			session.saveOrUpdate(cNew);
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() +  " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}	
		
	}

}
