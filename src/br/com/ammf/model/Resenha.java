package br.com.ammf.model;

import java.io.Serializable;
import java.util.Calendar;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import br.com.ammf.utils.DataUtils;

@Entity
@Table(name="resenha")
public class Resenha implements Serializable {

	private static final long serialVersionUID = 567161445014302712L;
	
	@Id
	@GeneratedValue
	private long id;
	
	@Column(length=45)
	private String uuid = UUID.randomUUID().toString();
	
	private String titulo;
	
	@Lob
	private String descricao;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Calendar postagem = Calendar.getInstance();	
	
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

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Calendar getPostagem() {
		return postagem;
	}

	public void setPostagem(Calendar postagem) {
		this.postagem = postagem;
	}

	public String getDataFormatada(){
		return DataUtils.getFullString(postagem);
	}
	
}
