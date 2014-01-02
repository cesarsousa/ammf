package br.com.ammf.service.imp;

import br.com.ammf.model.Comentario;
import br.com.ammf.model.Local;
import br.com.ammf.model.Status;
import br.com.ammf.model.Texto;
import br.com.ammf.repository.ComentarioRepository;
import br.com.ammf.repository.TextoRepository;
import br.com.ammf.service.BlogService;
import br.com.ammf.utils.DataUtils;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class BlogServiceImp implements BlogService {
	
	private TextoRepository textoRepository;
	private ComentarioRepository comentarioRepository;
	
	public BlogServiceImp(
			TextoRepository textoRepository,
			ComentarioRepository comentarioRepository){
		this.textoRepository = textoRepository;
		this.comentarioRepository = comentarioRepository;
	}

	@Override
	public void cadastrarTexto(Texto texto) {
		texto.setLocal(Local.BLOG);
		texto.setPostagem(DataUtils.getDateNow());
		texto.setConfirmado(true);
		textoRepository.cadastrar(texto);		
	}

	@Override
	public Texto atualizarTexto(Texto texto) {
		Texto textoOriginal = textoRepository.obterPor(texto.getUuid());
		textoOriginal.setAutor(texto.getAutor());
		textoOriginal.setTitulo(texto.getTitulo());
		textoOriginal.setConteudo(texto.getConteudo());
		textoOriginal.setConfirmado(true);
		textoRepository.atualizar(textoOriginal);
		return textoOriginal;
	}

	@Override
	public void cadastrarComentario(String uuidTexto, Comentario comentario) {
		Texto texto = textoRepository.obterPor(uuidTexto);
		comentario.setTexto(texto);
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
