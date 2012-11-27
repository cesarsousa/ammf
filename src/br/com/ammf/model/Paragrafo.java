package br.com.ammf.model;

import java.io.Serializable;

public class Paragrafo implements Serializable {
	
	private static final long serialVersionUID = 530833542237092262L;
	
	private String trechoTexto;
	
	public String getTrechoTexto() {
		return trechoTexto;
	}
	
	public void setTrechoTexto(String trechoTexto) {
		this.trechoTexto = trechoTexto;
	}

}
