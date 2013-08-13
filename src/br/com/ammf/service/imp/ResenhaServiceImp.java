package br.com.ammf.service.imp;

import br.com.ammf.model.Resenha;
import br.com.ammf.repository.ResenhaRepository;
import br.com.ammf.service.ResenhaService;
import br.com.ammf.utils.DataUtils;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class ResenhaServiceImp implements ResenhaService {
	
	private ResenhaRepository resenhaRepository;
	
	public ResenhaServiceImp(ResenhaRepository resenhaRepository){
		this.resenhaRepository = resenhaRepository;
	}

	@Override
	public void cadastrar(Resenha resenha) {
		resenha.setPostagem(DataUtils.getDateNow());
		resenhaRepository.cadastrar(resenha);		
	}
	
	

}
