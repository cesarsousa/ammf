package br.com.ammf.service.imp;

import java.text.ParseException;
import java.util.Date;

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

	@Override
	public void atualizar(Resenha resenha, String dataPostagem) throws ParseException {
		Date postagem = DataUtils.getDate(dataPostagem);
		resenha.setPostagem(postagem);
		resenhaRepository.atualizar(resenha);
		
	}
	
	

}