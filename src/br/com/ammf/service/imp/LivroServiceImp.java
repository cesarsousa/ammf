package br.com.ammf.service.imp;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.lowagie.text.Image;

import br.com.ammf.model.Categoria;
import br.com.ammf.model.Imagem;
import br.com.ammf.model.Livro;
import br.com.ammf.model.TipoCategoria;
import br.com.ammf.repository.ImagemRepository;
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
	private ImagemRepository imagemRepository;

	public LivroServiceImp(ImagemService imagemService, LivroRepository livroRepository, ImagemRepository imagemRepository) {
		this.imagemService = imagemService;
		this.livroRepository = livroRepository;
		this.imagemRepository = imagemRepository;
	}

	@Override
	public void cadastrar(UploadedFile imagemLivro, Livro livro) throws FileNotFoundException, IOException {
		livro.setPostagem(DataUtils.getDateNow());
		imagemService.salvarFotoLivro(imagemLivro, livro);
		livroRepository.cadastrar(livro);		
	}

	@Override
	public void cadastrarCategoria(String categoria) {
		Categoria novaCategoria = new Categoria();
		novaCategoria.setDescricao(categoria);
		novaCategoria.setTipoCategoria(TipoCategoria.Livro);
		livroRepository.cadastrarCategoria(novaCategoria);
		
	}

	@Override
	public void atualizar(UploadedFile novaImagemLivro, String dataPostagem, Livro livro, boolean removerImagem) throws Exception {
		/*try {
			if(removerImagem){
				imagemService.removerFoto(livro.getImagem().getCaminho());
				imagemService.setImagemDefault(livro.getImagem());
			}else if(novaImagemLivro != null){
				imagemService.atualizarFotoLivro(novaImagemLivro, livro);
			}				
			Date postagem = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").parse(dataPostagem);
			livro.setPostagem(postagem);
			livroRepository.atualizar(livro);
			
		} catch (Exception e) {
			throw new Exception(e.getMessage());
		}*/
		
		try {
			Date postagem = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").parse(dataPostagem);
			livro.setPostagem(postagem);
			
			if(removerImagem){
				Imagem imagem = livro.getImagem();
				imagemService.removerFoto(imagem.getCaminho());
				livro.setImagem(imagemService.criarImagemDefault());				
				livroRepository.atualizar(livro);
				imagemRepository.remover(imagem);
			}else if(novaImagemLivro != null){
				imagemService.atualizarFotoLivro(novaImagemLivro, livro);
				livroRepository.atualizar(livro);
			}			
		} catch (Exception e) {
			throw new Exception(e.getMessage());
		}
		
				
	}

}
