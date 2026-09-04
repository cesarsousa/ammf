package br.com.ammf.model;

import java.io.Serializable;
import java.util.Date;
import java.util.UUID;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import br.com.ammf.utils.DataUtils;

@Entity
@Table(name = "comentario")
public class Comentario implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue
	private long id;
	
	@Column(length = 45)
	private String uuid = UUID.randomUUID().toString();
	
	private String nome;
	
	private String email;
	
	@Column(length = 1000)
	private String conteudo;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date postagem = new Date();
	
	@Enumerated(EnumType.STRING)
	private Status status;
	
	@Enumerated(EnumType.STRING)
	private Local local;
	
	@ManyToOne(cascade = CascadeType.PERSIST)
	private Texto texto;
	
	@ManyToOne(cascade = CascadeType.PERSIST)
	private Resenha resenha;
	
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

	public void setNome(String nome) {
		this.nome = nome;
	}
	
	public String getNome() {
		return nome;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
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
	
	public Local getLocal() {
		return local;
	}
	
	public void setLocal(Local local) {
		this.local = local;
	}

	public Texto getTexto() {
		return texto;
	}

	public void setTexto(Texto texto) {
		this.texto = texto;
	}
	
	public Resenha getResenha() {
		return resenha;
	}
	
	public void setResenha(Resenha resenha) {
		this.resenha = resenha;
	}
	
	public boolean isConfirmado(){
		return Status.CONFIRMADO == this.status;
	}

	public String getDataHora(){
		return DataUtils.getStringDataHora(postagem);
	}
	
	public String getData(){
		return DataUtils.getStringData(postagem);
	}	

}
