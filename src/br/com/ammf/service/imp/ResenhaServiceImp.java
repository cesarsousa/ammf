package br.com.ammf.service.imp;

import java.io.File;
import java.text.ParseException;
import java.util.Date;

import br.com.ammf.exception.CadastroException;
import br.com.ammf.model.Categoria;
import br.com.ammf.model.Resenha;
import br.com.ammf.model.TipoCategoria;
import br.com.ammf.repository.CategoriaRepository;
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
	private ImagemService imagemService;
	
	public ResenhaServiceImp(
			ResenhaRepository resenhaRepository, 
			CategoriaRepository categoriaRepository,
			ImagemService imagemService){
		this.resenhaRepository = resenhaRepository;
		this.categoriaRepository = categoriaRepository;
		this.imagemService = imagemService;
	}

	@Override
	public void cadastrar(UploadedFile imagemResenha, Resenha resenha) throws CadastroException{
		try {
			resenha.setPostagem(DataUtils.getDateNow());
			//resenha.setImagem(imagemService.criarESalvarImagem(imagemResenha, "resenha" + resenha.getUuid() + ".jpg"));
			resenhaRepository.cadastrar(resenha);
		} catch (Exception e) {
			throw new CadastroException(e.getMessage());
		}
		
	}

	@Override
	public void atualizar(Resenha resenha, String dataPostagem) throws ParseException {
		Date postagem = DataUtils.getDate(dataPostagem);
		resenha.setPostagem(postagem);
		resenhaRepository.atualizar(resenha);
		resenha.setCategoria(categoriaRepository.obterPor(resenha.getCategoria().getId()));
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
