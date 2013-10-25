package br.com.ammf.model;

import java.io.Serializable;
import java.util.Date;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import br.com.ammf.utils.DataUtils;

@Entity
@Table(name="depoimento")
public class Depoimento implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue
	private long id;
	
	@Column(length=45)
	private String uuid = UUID.randomUUID().toString();
	
	private String autor;
	
	private String email;
	
	@Lob
	private String conteudo;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date postagem = new Date();
	
	@Enumerated(EnumType.STRING)
	private Status status;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getAutor() {
		return autor;
	}

	public void setAutor(String autor) {
		this.autor = autor;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getEmail() {
		return email;
	}

	public String getConteudo() {
		return conteudo;
	}

	public void setConteudo(String conteudo) {
		this.conteudo = conteudo;
	}

	public Date getPostagem() {
		return postagem;
	}

	public void setPostagem(Date postagem) {
		this.postagem = postagem;
	}

	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}
	
	public String getDataFormatada(){
		return DataUtils.getFullString(postagem);
	}
	
	public boolean isPendente(){
		return Status.PENDENTE == this.status;
	}
}
