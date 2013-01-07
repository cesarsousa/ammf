package br.com.ammf.controller;

import static br.com.caelum.vraptor.view.Results.json;

import java.util.List;

import br.com.ammf.interceptor.Restrito;
import br.com.ammf.model.Local;
import br.com.ammf.model.SessaoUsuario;
import br.com.ammf.model.Texto;
import br.com.ammf.repository.TextoRepository;
import br.com.ammf.repository.UsuarioRepository;
import br.com.ammf.service.MenuService;
import br.com.ammf.service.ValidacaoService;
import br.com.ammf.utils.DataUtils;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class BlogController {
	
	private Result result;
	private TextoRepository textoRepository;
	
	public BlogController(Result result, TextoRepository textoRepository){
		this.result = result;
		this.textoRepository = textoRepository;
	}
	
	@Restrito
	@Get("/blog/editar")
	public void editarBlog(){}
	
	@Restrito
	@Post("/blog/novo")
	public void cadastrarNovo(Texto texto){		
		texto.setLocal(Local.BLOG);
		texto.setPostagem(DataUtils.getNow());		
		textoRepository.cadastrar(texto);
		
		result.include("blogMensagemSucesso", "O texto <i>" + texto.getTitulo() + "</i> foi cadastrado com sucesso.");
		result.redirectTo(this).editarBlog();
	}
	
	@Restrito
	@Get("/blog/busca/texto")
	public void listarTextos(String paramConsulta){
		System.out.println("dados");
		System.out.println(paramConsulta);
		
		List<Texto> textos = textoRepository.listarTitulos(paramConsulta);		
		result.use(json()).withoutRoot().from(textos).exclude("id", "autor", "local").serialize();		
		
	}
	
	@Restrito
	@Get("/blog/visualizar/{uuid}")
	public void visualizarTextoEdicao(String uuid){
		Texto texto = textoRepository.obterPor(uuid);
		result.use(json()).withoutRoot().from(texto).exclude("id", "local", "postagem") .serialize();		
	}

}
