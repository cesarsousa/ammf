package br.com.ammf.service.imp;

import java.io.File;
import java.util.Date;

import br.com.ammf.exception.CadastroException;
import br.com.ammf.model.Categoria;
import br.com.ammf.model.Comentario;
import br.com.ammf.model.Imagem;
import br.com.ammf.model.Local;
import br.com.ammf.model.Resenha;
import br.com.ammf.model.Status;
import br.com.ammf.model.TipoCategoria;
import br.com.ammf.repository.CategoriaRepository;
import br.com.ammf.repository.ComentarioRepository;
import br.com.ammf.repository.ImagemRepository;
import br.com.ammf.repository.ResenhaRepository;
import br.com.ammf.service.ImagemService;
import br.com.ammf.service.ResenhaService;
import br.com.ammf.utils.DataUtils;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class ResenhaServiceImp implements ResenhaService {
	
	private ResenhaRepository resenhaRepository;
	private CategoriaRepository categoriaRepository;
	private ImagemRepository imagemRepository;
	private ComentarioRepository comentarioRepository;
	private ImagemService imagemService;
	
	public ResenhaServiceImp(
			ResenhaRepository resenhaRepository, 
			CategoriaRepository categoriaRepository,
			ImagemRepository imagemRepository,
			ComentarioRepository comentarioRepository,
			ImagemService imagemService){
		this.resenhaRepository = resenhaRepository;
		this.categoriaRepository = categoriaRepository;
		this.imagemRepository = imagemRepository;
		this.comentarioRepository = comentarioRepository;
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

	@Override
	public void cadastrarComentario(String uuidResenha, Comentario comentario) {
		Resenha resenha = resenhaRepository.obterPorUuid(uuidResenha);
		comentario.setResenha(resenha);
		comentarioRepository.cadastrar(comentario);		
	}

	@Override
	public Comentario obterComentario(
			String comentarioNome, 
			String comentarioEmail, 
			String comentarioConteudo, 
			Local local) {
		
		Comentario comentario = new Comentario();
		comentario.setPostagem(DataUtils.getDateNow());
		comentario.setStatus(Status.PENDENTE);
		comentario.setLocal(local);
		comentario.setNome(comentarioNome);
		comentario.setEmail(comentarioEmail);
		comentario.setConteudo(comentarioConteudo);	
		
		return comentario;
		
	}

	@Override
	public void configurarVisualizacaoParaVisualizacaoComentarios(Status status, Result result) {
		if(Status.TODOS == status){
			result.include("tituloVerComentarios", "Visualiza&ccedil;&atilde;o dos todos os coment&aacute;rios");
			result.include("iconeVerComentarios", "iconeComentarioTodos.png");			
		}
		if(Status.CONFIRMADO == status){
			result.include("tituloVerComentarios", "Visualiza&ccedil;&atilde;o dos coment&aacute;rios confirmados");
			result.include("iconeVerComentarios", "iconeComentarioConfirmados.png");
		}
		if(Status.PENDENTE == status){
			result.include("tituloVerComentarios", "Visualiza&ccedil;&atilde;o dos coment&aacute;rios pendentes");
			result.include("iconeVerComentarios", "iconeComentarioPendentes.png");
		}
		result.include("cssCorTitulo", status.toString());
		result.include("flagTitulo", status.toString());
		
	}
	
	

}
