package br.com.ammf.service;

import br.com.ammf.exception.CadastroException;
import br.com.ammf.model.Livro;
import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;

public interface LivroService {

	void cadastrar(UploadedFile imagemLivro, Livro livro) throws CadastroException;

	void cadastrarCategoria(String categoria);

	void atualizar(UploadedFile novaImagemLivro, String dataPostagem, Livro livro, boolean removerImagem) throws CadastroException;

}
