package br.com.ammf.service;

import java.io.File;
import java.text.ParseException;

import br.com.ammf.exception.CadastroException;
import br.com.ammf.model.Resenha;
import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;

public interface ResenhaService {
	
	void cadastrar(UploadedFile imagemResenha, Resenha resenha) throws CadastroException;

	void atualizar(UploadedFile novaImagemResenha, Resenha resenha, String dataPostagem, boolean removerImagem) throws CadastroException;

	void cadastrarCategoria(String categoria);

	File visualizarImagemResenha(String uuid);

}
