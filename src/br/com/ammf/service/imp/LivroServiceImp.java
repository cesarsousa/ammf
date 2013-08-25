package br.com.ammf.service.imp;

import java.io.FileNotFoundException;
import java.io.IOException;

import br.com.ammf.model.Livro;
import br.com.ammf.repository.LivroRepository;
import br.com.ammf.service.ImagemService;
import br.com.ammf.service.LivroService;
import br.com.ammf.utils.DataUtils;
import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class LivroServiceImp implements LivroService {
	
	private ImagemService imagemService;
	private LivroRepository livroRepository;

	public LivroServiceImp(ImagemService imagemService, LivroRepository livroRepository) {
		this.imagemService = imagemService;
		this.livroRepository = livroRepository;
	}



	@Override
	public void cadastrar(UploadedFile imagemLivro, Livro livro) throws FileNotFoundException, IOException {
		livro.setPostagem(DataUtils.getDateNow());
		if(imagemLivro != null){
			imagemService.salvarFotoLivro(imagemLivro, livro);
		}
		livroRepository.cadastrar(livro);
		
	}

}
