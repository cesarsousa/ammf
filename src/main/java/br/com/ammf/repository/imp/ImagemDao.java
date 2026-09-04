package br.com.ammf.repository.imp;

import org.hibernate.Session;

import br.com.ammf.exception.ErroAplicacao;
import br.com.ammf.exception.Excecao;
import br.com.ammf.model.Imagem;
import br.com.ammf.repository.ImagemRepository;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class ImagemDao implements ImagemRepository {
	
	private Session session;
	
	public ImagemDao(Session session){
		this.session = session;
	}

	@Override
	public void remover(Imagem imagem) {
		try {
			session.delete(imagem);
		} catch (Exception e) {
			throw new ErroAplicacao(new Excecao(this.getClass().getSimpleName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName(), e));
		}		
	}

}
