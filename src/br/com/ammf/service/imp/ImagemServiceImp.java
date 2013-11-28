package br.com.ammf.service.imp;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.apache.commons.io.IOUtils;

import br.com.ammf.model.Imagem;
import br.com.ammf.model.Livro;
import br.com.ammf.model.Resenha;
import br.com.ammf.service.ImagemService;
import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class ImagemServiceImp implements ImagemService {
	
	private File pastaImagens;
	
	private String PASTA_IMAGEM_LIVRO;
	private String NOME_DEFAULT = "imagemDefault.jpg";
	
	public ImagemServiceImp(ServletContext context){		
		//PASTA_IMAGEM_LIVRO = "/home/quironps/ammf/livroImagem";
		PASTA_IMAGEM_LIVRO = context.getRealPath("/WEB-INF/imagens");
				
		pastaImagens = new File(PASTA_IMAGEM_LIVRO);
		pastaImagens.mkdir();
						
	}	

	@Override
	public Imagem criarESalvarImagem(UploadedFile imagemLivro, String nomeDaImagem) throws FileNotFoundException, IOException {
		
			if(imagemLivro == null) return null;
		
			File destino = new File(pastaImagens, nomeDaImagem);
			
			IOUtils.copy(imagemLivro.getFile(), new FileOutputStream(destino));	
			
			return criarImagem(nomeDaImagem, destino.getAbsolutePath());		
	}

	@Override
	public void atualizarFotoLivro(UploadedFile imagemLivro, Livro livro) throws Exception {
		if (livro.getImagem().getNome() != null && !livro.getImagem().getNome().equals(NOME_DEFAULT)){
			removerFoto(livro.getImagem().getCaminho());				
		}
		
		File destino = new File(pastaImagens, "livro" + livro.getUuid() + ".jpg");
		IOUtils.copy(imagemLivro.getFile(), new FileOutputStream(destino));
		
		if(livro.getImagem().getNome() != null && livro.getImagem().getNome().equals(NOME_DEFAULT)){
			livro.setImagem(criarImagem("livro" + livro.getUuid() + ".jpg", destino.getAbsolutePath()));
		}else{
			livro.getImagem().setCaminho(destino.getAbsolutePath());
			livro.getImagem().setNome("livro" + livro.getUuid() + ".jpg");
		}		
	}
	
	@Override
	public void atualizarFotoResenha(UploadedFile imagemResenha, Resenha resenha) throws Exception {
		if (resenha.getImagem().getNome() != null && !resenha.getImagem().getNome().equals(NOME_DEFAULT)){
			removerFoto(resenha.getImagem().getCaminho());				
		}
		
		File destino = new File(pastaImagens, "resenha" + resenha.getUuid() + ".jpg");
		IOUtils.copy(imagemResenha.getFile(), new FileOutputStream(destino));
		
		if(resenha.getImagem().getNome() != null && resenha.getImagem().getNome().equals(NOME_DEFAULT)){
			resenha.setImagem(criarImagem("resenha" + resenha.getUuid() + ".jpg", destino.getAbsolutePath()));
		}else{
			resenha.getImagem().setCaminho(destino.getAbsolutePath());
			resenha.getImagem().setNome("resenha" + resenha.getUuid() + ".jpg");
		}
		
	}
	
	private Imagem criarImagem(String nomeLivro, String caminhoDaImagem) {
		Imagem imagem = new Imagem();
		imagem.setNome(nomeLivro);
		imagem.setCaminho(caminhoDaImagem);
		return imagem;
	}
	
	/*@Override
	public Imagem criarImagemDefault() {
		Imagem imagem = new Imagem();
		imagem.setId(1L);
		imagem.setNome(NOME_DEFAULT);
		return null;
	}*/
	
	@Override
	public void setImagemDefault(Imagem imagem) {
		imagem.setCaminho(null);
		imagem.setNome(NOME_DEFAULT);		
	}

	@Override
	public void removerFoto(String caminhoDaImagem) throws Exception {
		if(caminhoDaImagem != null){		
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

	@Override
	public File visualizarImagemLivro(String uuid) {
		File foto = new File(pastaImagens, "livro" + uuid + ".jpg");
		if(!foto.exists()){
			foto = new File(pastaImagens, NOME_DEFAULT); 
		}				
		return foto;
	}
	
	@Override
	public File visualizarImagemResenha(String uuid) {
		File foto = new File(pastaImagens, "resenha" + uuid + ".jpg");
		if(!foto.exists()){
			foto = new File(pastaImagens, NOME_DEFAULT); 
		}				
		return foto;
	}

	@Override
	public String getNomeLivroDefault() {
		return NOME_DEFAULT;
	}

	

}
