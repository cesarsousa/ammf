package br.com.ammf.service;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;

import br.com.ammf.model.Imagem;
import br.com.ammf.model.Livro;
import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;

public interface ImagemService {

	Imagem criarESalvarImagem(UploadedFile imagemLivro, String nomeDaImagem) throws FileNotFoundException, IOException;

	void atualizarFotoLivro(UploadedFile imagemLivro, Livro livro) throws Exception;
	
	void removerFoto(String caminhoDaImagem) throws Exception;

	void setImagemDefault(Imagem imagem);

	File visualizarImagemLivro(String uuid);
	
	File visualizarImagemResenha(String uuid);

	String getNomeLivroDefault();

	/*Imagem criarImagemDefault();*/
	
}
