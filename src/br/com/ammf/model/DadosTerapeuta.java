package br.com.ammf.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class DadosTerapeuta implements Serializable{		
	private static final long serialVersionUID = -833277830674254230L;
	
	private String titulo;
	private List<String> informacoes = new ArrayList<String>();
	private List<String> formacoes = new ArrayList<String>();
	private List<String> atuacoes = new ArrayList<String>();
	private List<String> tratamentos = new ArrayList<String>();

	public DadosTerapeuta(Terapeuta terapeuta){
		titulo = terapeuta.getTitulo();
		if(terapeuta.getInformacao() != null) informacoes = obterDados(terapeuta.getInformacao(), ".");
		if(terapeuta.getFormacao() != null) formacoes = obterDados(terapeuta.getFormacao(), ".");
		if(terapeuta.getAtuacao() != null) atuacoes = obterDados(terapeuta.getAtuacao(), "");
		if(terapeuta.getTratamento() != null) tratamentos = obterDados(terapeuta.getTratamento(), "");
	}
	
	public String getTitulo() {
		return titulo;
	}
	
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public List<String> getInformacoes() {
		return informacoes;
	}

	public void setInformacoes(List<String> informacoes) {
		this.informacoes = informacoes;
	}

	public List<String> getFormacoes() {
		return formacoes;
	}

	public void setFormacoes(List<String> formacoes) {
		this.formacoes = formacoes;
	}

	public List<String> getAtuacoes() {
		return atuacoes;
	}

	public void setAtuacoes(List<String> atuacoes) {
		this.atuacoes = atuacoes;
	}

	public List<String> getTratamentos() {
		return tratamentos;
	}

	public void setTratamentos(List<String> tratamentos) {
		this.tratamentos = tratamentos;
	}
	
	private List<String> obterDados(String dado, String pontoFinal) {
		List<String> listagem = new ArrayList<String>();
		String[] dados = dado.split("\\.");
		for(String d : dados){
			listagem.add(d + pontoFinal);
		}		
		return listagem;
	}
		
}
