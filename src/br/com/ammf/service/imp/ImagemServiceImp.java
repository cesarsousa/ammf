package br.com.ammf.service.imp;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import org.apache.commons.io.IOUtils;

import br.com.ammf.model.Livro;
import br.com.ammf.repository.LivroRepository;
import br.com.ammf.service.ImagemService;
import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class ImagemServiceImp implements ImagemService {
	
	//String caminhoImagens = context.getRealPath("/WEB-INF/livro") + nomeLivro;
	private final String PASTA_IMAGEM_LIVRO = "C:/Users/cesarsousa/Documents/GitHub/ammf/WebContent/livro/";
	
	private LivroRepository livroRepository;
	
	public ImagemServiceImp(LivroRepository livroRepository){
		this.livroRepository = livroRepository;
	}

	@Override
	public void salvarFotoLivro(UploadedFile imagem, Livro livro) throws FileNotFoundException, IOException {
		/*String nomeImagemLivro = "livro" + livro.getId() + ".jpg";		
		IOUtils.copy(imagem.getFile(), new FileOutputStream(new File(nomeImagemLivro)));
		livro.setNomeImagem(nomeImagemLivro);*/
		
		if(imagem != null){		
			
			String nomeLivro = "livro" + livro.getId() + ".jpg";			
			String caminhoImagens = PASTA_IMAGEM_LIVRO + nomeLivro;
			
			File file = new File(caminhoImagens);
			InputStream i = imagem.getFile();

			OutputStream outputStream = new FileOutputStream(file);
			int var;
			while ((var = i.read()) != -1) {
				outputStream.write(var);
			}
			i.close();
			outputStream.close();			
			
			livro.setNomeImagem(nomeLivro);
			livroRepository.atualizar(livro);		
		}
		
		
	}

}
