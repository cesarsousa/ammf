package br.com.ammf.service.imp;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.commons.io.IOUtils;

import br.com.ammf.model.Livro;
import br.com.ammf.service.ImagemService;
import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class ImagemServiceImp implements ImagemService {

	@Override
	public void salvarFotoLivro(UploadedFile imagem, Livro livro) throws FileNotFoundException, IOException {
		String nomeImagemLivro = "livro" + livro.getId() + ".jpg";		
		IOUtils.copy(imagem.getFile(), new FileOutputStream(new File(nomeImagemLivro)));
		livro.setNomeImagem(nomeImagemLivro);
		
		
	}

}
