package br.com.ammf.service.imp;

import java.io.File;
import java.text.ParseException;
import java.util.Date;

import br.com.ammf.exception.CadastroException;
import br.com.ammf.model.Categoria;
import br.com.ammf.model.Imagem;
import br.com.ammf.model.Resenha;
import br.com.ammf.model.TipoCategoria;
import br.com.ammf.repository.CategoriaRepository;
import br.com.ammf.repository.ImagemRepository;
import br.com.ammf.repository.ResenhaRepository;
import br.com.ammf.service.ImagemService;
import br.com.ammf.service.ResenhaService;
import br.com.ammf.utils.DataUtils;
import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class ResenhaServiceImp implements ResenhaService {
	
	private ResenhaRepository resenhaRepository;
	private CategoriaRepository categoriaRepository;
	private ImagemRepository imagemRepository;
	private ImagemService imagemService;
	
	public ResenhaServiceImp(
			ResenhaRepository resenhaRepository, 
			CategoriaRepository categoriaRepository,
			ImagemRepository imagemRepository,
			ImagemService imagemService){
		this.resenhaRepository = resenhaRepository;
		this.categoriaRepository = categoriaRepository;
		this.imagemRepository = imagemRepository;
		this.imagemService = imagemService;
	}

	@Override
	public void cadastrar(UploadedFile imagemResenha, Resenha resenha) throws CadastroException{
		try {
			resenha.setPostagem(DataUtils.getDateNow());
			resenha.setImagem(imagemService.criarESalvarImagem(imagemResenha, "resenha" + resenha.getUuid() + ".jpg"));
			resenha.setCategoria(categoriaRepository.obterPor(resenha.getCategoria().getId()));
			resenhaRepository.cadastrar(resenha);
		} catch (Exception e) {
			throw new CadastroException(e.getMessage());
		}		
	}

	@Override
	public void atualizar(UploadedFile novaImagemResenha, Resenha resenha, String dataPostagem, boolean removerImagem) throws CadastroException {
		try {
			Date postagem = DataUtils.getDate(dataPostagem);
			resenha.setPostagem(postagem);
			resenha.setCategoria(categoriaRepository.obterPor(resenha.getCategoria().getId()));
			
			if(removerImagem && !resenha.getImagem().getNome().equals(imagemService.getNomeLivroDefault())){
				Imagem imagem = resenha.getImagem();
				imagemService.removerFoto(imagem.getCaminho());
				resenha.setImagem(null);				
				imagemRepository.remover(imagem);
			}else if(novaImagemResenha != null){
				imagemService.atualizarFotoResenha(novaImagemResenha, resenha);
			}
			
			resenhaRepository.atualizar(resenha);
		} catch (Exception e) {
			throw new CadastroException(e.getMessage());
		}		
	}

	@Override
	public void cadastrarCategoria(String categoria) {
		Categoria novaCategoria = new Categoria();
		novaCategoria.setDescricao(categoria);
		novaCategoria.setTipoCategoria(TipoCategoria.Resenha);
		resenhaRepository.cadastrarCategoria(novaCategoria);		
	}

	@Override
	public File visualizarImagemResenha(String uuid) {
		return imagemService.visualizarImagemResenha(uuid);
	}
	
	

}
