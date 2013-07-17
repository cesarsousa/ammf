package br.com.ammf.controller;

import br.com.ammf.exception.EmailException;
import br.com.ammf.interceptor.Restrito;
import br.com.ammf.model.Livro;
import br.com.ammf.repository.LivroRepository;
import br.com.ammf.service.ValidacaoService;
import br.com.ammf.utils.DataUtils;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class LivroController {

	private Result result;
	private ValidacaoService validacaoService;
	private LivroRepository livroRepository;
	
	public LivroController(
			Result result, 
			ValidacaoService validacaoService,
			LivroRepository livroRepository){
		this.result = result;
		this.validacaoService = validacaoService;
		this.livroRepository = livroRepository;
	}
	
	@Restrito
	@Post("/livro/cadastrar")
	public void cadastrarLivro(Livro livro){
		try {
			boolean validado = validacaoService.livro(livro, result);
			if(validado){				
				livro.setPostagem(DataUtils.getNow());
				livroRepository.cadastrar(livro);
				// cadastrar
				// TODO notificar clientes por email
				result.include("msgLojaAdm", "O livro <i>" + livro.getTitulo() + "</i> foi cadastrado com sucesso.");
			}
			result.forwardTo(LojaController.class).lojaAdmin();
		} catch (Exception e) { // TODO trocar email exception
			result.include("msgLojaAdm", "O livro <i>" + livro.getTitulo() + "</i> foi cadastrado com sucesso.");
			result.include("msgErroLojaAdm", "N&atilde;o foi poss&iacute;vel enviar os emails de notifica&ccedil;&atilde;o para os clientes referente ao cadastro do livro '" + livro.getTitulo() + "'.<br/>Mensagem de Erro: " + e.toString() + ".");
			result.redirectTo(LojaController.class).lojaAdmin();
		}
	}
}
