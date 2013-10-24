package br.com.ammf.model;

import java.io.Serializable;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "terapeuta")
public class Terapeuta implements Serializable{	
	
	private static final long serialVersionUID = 7141554530881750013L;

	@Id
	@GeneratedValue
	private long id;	
	
	private String titulo;
	
	@Column(length = 3000)
	private String informacao;
	
	@Column(length = 3000)
	private String formacao;
	
	@Column(length = 3000)
	private String atuacao;
	
	@Column(length = 3000)
	private String tratamento;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getInformacao() {
		return informacao;
	}

	public void setInformacao(String informacao) {
		this.informacao = informacao;
	}

	public String getFormacao() {
		return formacao;
	}

	public void setFormacao(String formacao) {
		this.formacao = formacao;
	}

	public String getAtuacao() {
		return atuacao;
	}

	public void setAtuacao(String atuacao) {
		this.atuacao = atuacao;
	}

	public String getTratamento() {
		return tratamento;
	}

	public void setTratamento(String tratamento) {
		this.tratamento = tratamento;
	}
	
}
