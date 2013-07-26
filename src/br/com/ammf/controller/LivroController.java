package br.com.ammf.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import br.com.ammf.interceptor.Restrito;
import br.com.ammf.model.Livro;
import br.com.ammf.repository.LivroRepository;
import br.com.ammf.service.ImagemService;
import br.com.ammf.service.ValidacaoService;
import br.com.ammf.utils.DataUtils;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;

@Resource
public class LivroController {

	private Result result;
	private ValidacaoService validacaoService;
	private ImagemService imagemService;
	private LivroRepository livroRepository;
	
	public LivroController(
			Result result, 
			ValidacaoService validacaoService,
			ImagemService imagemService,
			LivroRepository livroRepository){
		this.result = result;
		this.validacaoService = validacaoService;
		this.imagemService = imagemService;
		this.livroRepository = livroRepository;
	}
	
	@Restrito
	@Post("/livro/cadastrar")
	public void cadastrarLivro(UploadedFile imagemLivro, Livro livro){
		try {
			boolean validado = validacaoService.livro(imagemLivro, livro, result);		
			
			if(validado){			
				livro.setPostagem(DataUtils.getNow());
				if(imagemLivro != null){
					imagemService.salvarFotoLivro(imagemLivro, livro);
				}
				livroRepository.cadastrar(livro);
				
				// notificar clientes cliente e adm.
				result.include("msgLojaAdm", "O livro <i>" + livro.getTitulo() + "</i> foi cadastrado com sucesso.");
			}			
			
			result.forwardTo(LojaController.class).lojaAdmin();
		} catch (Exception e) { // TODO trocar email exception verificar exeção de salvar arquivos
			e.printStackTrace();
			result.include("msgErroLojaAdm", "N&atilde;o foi poss&iacute;vel efetuar o cadastro do livro '" + livro.getTitulo() + "'.<br/>Mensagem de Erro: " + e.toString() + ".");
			result.redirectTo(LojaController.class).lojaAdmin();
		}
	}
}
