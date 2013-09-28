package br.com.ammf.service.imp;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.commons.io.IOUtils;

import br.com.ammf.model.Imagem;
import br.com.ammf.model.Livro;
import br.com.ammf.service.ImagemService;
import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class ImagemServiceImp implements ImagemService {
	
	private String PASTA_IMAGEM_LIVRO;
	private String NOME_DEFAULT = "/capaLivroDefault.jpg";
	
	public ImagemServiceImp(){		
		//PASTA_IMAGEM_LIVRO = this.context.getRealPath("/");
		PASTA_IMAGEM_LIVRO = "C:/ammf/imagem";
		//PASTA_IMAGEM_LIVRO = "C:/Users/cesar/Documents/GitHub/ammf/WebContent/livro";		
		//PASTA_IMAGEM_LIVRO = "C:/Users/cesarsousa/Documents/GitHub/ammf/WebContent/livro";		
		//PASTA_IMAGEM_LIVRO = "/home/cesarsousa/workspacejuno/ammf/WebContent/livro";		
	}	

	@Override
	public void salvarFotoLivro(UploadedFile imagemLivro, Livro livro) throws FileNotFoundException, IOException {
		String nomeLivro = "/livro" + livro.getUuid() + ".jpg";			
		String caminhoDaImagem = PASTA_IMAGEM_LIVRO + nomeLivro;
		File file = new File(caminhoDaImagem);			
		IOUtils.copy(imagemLivro.getFile(), new FileOutputStream(file));		
		livro.setImagem(criarImagemLivro(nomeLivro, caminhoDaImagem));		
	}

	@Override
	public void atualizarFotoLivro(UploadedFile imagemLivro, Livro livro) throws Exception {
		if (!livro.getImagem().getNome().equals(NOME_DEFAULT)){
			removerFoto(livro.getImagem().getCaminho());				
		}
		salvarFotoLivro(imagemLivro, livro);
	}
	
	private Imagem criarImagemLivro(String nomeLivro, String caminhoDaImagem) {
		Imagem imagem = new Imagem();
		imagem.setNome(nomeLivro);
		imagem.setCaminho(caminhoDaImagem);
		return imagem;
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
