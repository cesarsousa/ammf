package br.com.ammf.service;

import java.io.FileNotFoundException;
import java.io.IOException;

import br.com.ammf.model.Imagem;
import br.com.ammf.model.Livro;
import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;

public interface ImagemService {

	void salvarFotoLivro(UploadedFile imagemLivro, Livro livro) throws FileNotFoundException, IOException;

	void atualizarFotoLivro(UploadedFile imagemLivro, Livro livro) throws Exception; // TODO trocar por arquivo excception

	void removerFoto(String caminhoDaImagem) throws Exception;
	
	Imagem criarImagemDefault(); 
}
