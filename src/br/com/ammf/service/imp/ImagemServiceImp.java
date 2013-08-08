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
	private String NOME_DEFAULT = "/capaLivroDefault.jpg";
	
	public ImagemServiceImp(ServletContext context){
		this.context = context;
		
		//PASTA_IMAGEM_LIVRO = this.context.getRealPath("/");
		//PASTA_IMAGEM_LIVRO = "C:/ammflivros";
		PASTA_IMAGEM_LIVRO = "C:/Users/cesar/Documents/GitHub/ammf/WebContent/livro";		
		//PASTA_IMAGEM_LIVRO = "C:/Users/cesarsousa/Documents/GitHub/ammf/WebContent/livro";		
		//PASTA_IMAGEM_LIVRO = "/home/cesarsousa/workspacejuno/ammf/WebContent/livro";
		
	}	

	@Override
	public void salvarFotoLivro(UploadedFile imagemLivro, Livro livro) throws FileNotFoundException, IOException {
		String nomeLivro = "/livro" + livro.getUuid() + ".jpg";			
		String caminhoDaImagem = PASTA_IMAGEM_LIVRO + nomeLivro;
		File file = new File(caminhoDaImagem);			
		IOUtils.copy(imagemLivro.getFile(), new FileOutputStream(file));
		livro.setNomeImagem(nomeLivro);		
	}

	@Override
	public void atualizarFotoLivro(UploadedFile imagemLivro, Livro livro) throws Exception {
		String nomeOriginal = livro.getNomeImagem();
		if (!nomeOriginal.equals(NOME_DEFAULT)){
			String caminhoDaImagem = PASTA_IMAGEM_LIVRO + livro.getNomeImagem();
			removerFoto(caminhoDaImagem);				
		}
		salvarFotoLivro(imagemLivro, livro);
	}

	@Override
	public void removerFoto(String caminhoDaImagem) throws Exception {
		File file = new File(caminhoDaImagem);
		try {
			if (!file.exists()) {
				throw new FileNotFoundException("Arquivo não encontrado: " + file.getAbsolutePath());
			}
			file.delete();
		} catch (Exception e) {
			throw new Exception("Erro ao tentar deletar arquivo: "	+ file.getAbsolutePath());
		}
		
	}

}
