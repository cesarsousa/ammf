package br.com.ammf.service.imp;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.apache.commons.io.IOUtils;

import br.com.ammf.model.Livro;
import br.com.ammf.service.ImagemService;
import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class ImagemServiceImp implements ImagemService {
	
	private ServletContext context;
	private String PASTA_IMAGEM_LIVRO;
	
	public ImagemServiceImp(ServletContext context){
		this.context = context;
		
		//PASTA_IMAGEM_LIVRO = this.context.getRealPath("/");
		PASTA_IMAGEM_LIVRO = "C:/Users/cesarsousa/Documents/GitHub/ammf/WebContent/livro";		
		//PASTA_IMAGEM_LIVRO = "/home/cesarsousa/workspacejuno/ammf/WebContent/livro";
		
	}	

	@Override
	public void salvarFotoLivro(UploadedFile imagem, Livro livro) throws FileNotFoundException, IOException {
					
			String nomeLivro = "/livro" + livro.getUuid() + ".jpg";			
			String caminhoImagens = PASTA_IMAGEM_LIVRO + nomeLivro;
			
			File file = new File(caminhoImagens);
			
			/*InputStream i = imagem.getFile();
			OutputStream outputStream = new FileOutputStream(file);
			int var;
			while ((var = i.read()) != -1) {
				outputStream.write(var);
			}
			i.close();
			outputStream.close();*/		
			
			IOUtils.copy(imagem.getFile(), new FileOutputStream(file));
			
			livro.setNomeImagem(nomeLivro);		
	}

}
