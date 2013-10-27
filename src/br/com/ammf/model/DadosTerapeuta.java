package br.com.ammf.model;

import java.util.ArrayList;
import java.util.List;

public class DadosTerapeuta {
	
	private String titulo;
	private List<String> informacoes = new ArrayList<String>();
	private List<String> formacoes = new ArrayList<String>();
	private List<String> atuacoes = new ArrayList<String>();
	private List<String> tratamentos = new ArrayList<String>();

	public DadosTerapeuta(Terapeuta terapeuta){
		titulo = terapeuta.getTitulo();
		informacoes = obterDados(terapeuta.getInformacao());
		formacoes = obterDados(terapeuta.getFormacao());
		atuacoes = obterDados(terapeuta.getAtuacao());
		tratamentos = obterDados(terapeuta.getTratamento());
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
	
	private List<String> obterDados(String dado) {
		List<String> listagem = new ArrayList<String>();
		String[] dados = dado.split(".");
		for(String d : dados){
			listagem.add(d);
		}		
		return listagem;
	}
		
}
