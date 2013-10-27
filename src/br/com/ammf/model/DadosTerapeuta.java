package br.com.ammf.model;

import java.util.ArrayList;
import java.util.List;

public class DadosTerapeuta {
	
	private Terapeuta terapeuta;
		
	List<String> informacaoes = new ArrayList<String>();
	List<String> formacaoes = new ArrayList<String>();
	List<String> atuacoes = new ArrayList<String>();
	List<String> tratamento = new ArrayList<String>();

	public DadosTerapeuta(Terapeuta terapeuta){
		this.terapeuta = terapeuta;
	}
	
	
}
