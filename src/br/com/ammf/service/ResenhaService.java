package br.com.ammf.service;

import java.text.ParseException;

import br.com.ammf.model.Resenha;

public interface ResenhaService {
	
	void cadastrar(Resenha resenha);

	void atualizar(Resenha resenha, String dataPostagem) throws ParseException;

	void cadastrarCategoria(String categoria);

}
