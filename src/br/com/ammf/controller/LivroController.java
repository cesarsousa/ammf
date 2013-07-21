package br.com.ammf.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;

import br.com.ammf.exception.EmailException;
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
	private ServletContext context;
	
	public LivroController(
			Result result, 
			ValidacaoService validacaoService,
			LivroRepository livroRepository,
			ServletContext context){
		this.result = result;
		this.validacaoService = validacaoService;
		this.livroRepository = livroRepository;
		this.context = context;
	}
	
	@Restrito
	@Post("/livro/cadastrar")
	public void cadastrarLivro(UploadedFile imagemLivro, Livro livro){
		try {
			boolean validado = validacaoService.livro(livro, result);		
			
			if(validado){			
				livro.setPostagem(DataUtils.getNow());
				livroRepository.cadastrar(livro);
				if(imagemLivro != null){
					//imagemService.salvarFotoLivro(imagemLivro, livro);
					
					String nomeLivro = "livro" + livro.getId() + ".imagem";
					
					String caminhoImagens = context.getRealPath("/WEB-INF/livro");
					//File pastaImagens = new File(caminhoImagens);
					//pastaImagens.mkdir();
					
					File destino = new File(caminhoImagens, nomeLivro);
					
					System.out.println("path");
					System.out.println(destino.getAbsolutePath());
					System.out.println(destino.getPath());

					try {
					IOUtils.copy(imagemLivro.getFile(), new FileOutputStream(destino));
					} catch (FileNotFoundException e) {
					e.printStackTrace();
					throw new FileNotFoundException("Arquivo não encontrado!");
					} catch (IOException e) {
					e.printStackTrace();
					throw new IOException("Não foi possível enviar o arquivo!");
					}
					
					
					
					livro.setNomeImagem(nomeLivro);
					livroRepository.atualizar(livro);
				}
				
				// TODO notificar clientes por email
				result.include("msgLojaAdm", "O livro <i>" + livro.getTitulo() + "</i> foi cadastrado com sucesso.");
			}
			result.forwardTo(LojaController.class).lojaAdmin();
		} catch (Exception e) { // TODO trocar email exception verificar exeção de salvar arquivos
			e.printStackTrace();
			result.include("msgLojaAdm", "O livro <i>" + livro.getTitulo() + "</i> foi cadastrado com sucesso.");
			result.include("msgErroLojaAdm", "N&atilde;o foi poss&iacute;vel enviar os emails de notifica&ccedil;&atilde;o para os clientes referente ao cadastro do livro '" + livro.getTitulo() + "'.<br/>Mensagem de Erro: " + e.toString() + ".");
			result.redirectTo(LojaController.class).lojaAdmin();
		}
	}
}
