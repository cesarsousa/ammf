package br.com.ammf.service.imp;

import java.text.ParseException;
import java.util.Date;

import br.com.ammf.model.Categoria;
import br.com.ammf.model.Resenha;
import br.com.ammf.model.TipoCategoria;
import br.com.ammf.repository.CategoriaRepository;
import br.com.ammf.repository.ResenhaRepository;
import br.com.ammf.service.ResenhaService;
import br.com.ammf.utils.DataUtils;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class ResenhaServiceImp implements ResenhaService {
	
	private ResenhaRepository resenhaRepository;
	private CategoriaRepository categoriaRepository;
	
	public ResenhaServiceImp(ResenhaRepository resenhaRepository, CategoriaRepository categoriaRepository){
		this.resenhaRepository = resenhaRepository;
		this.categoriaRepository = categoriaRepository;
	}

	@Override
	public void cadastrar(Resenha resenha) {
		resenha.setPostagem(DataUtils.getDateNow());
		resenhaRepository.cadastrar(resenha);
		resenha.setCategoria(categoriaRepository.obterPor(resenha.getCategoria().getId()));
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
	
	

}
