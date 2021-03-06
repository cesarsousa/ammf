package br.com.ammf.model;

import java.util.Date;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import br.com.ammf.utils.DataUtils;

@Entity
@Table(name="link")
public class Link {
	
	@Id
	@GeneratedValue
	private long id;
	
	@Column(length=45)
	private String uuid = UUID.randomUUID().toString();
	
	private String titulo;
	
	@Column(length = 550)
	private String url;
	
	@Column(length = 550)
	private String descricao;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date postagem;
	
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

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Date getPostagem() {
		return postagem;
	}

	public void setPostagem(Date postagem) {
		this.postagem = postagem;
	}

	public String getDataFormatada(){
		return DataUtils.getStringDataHora(postagem);
	}
	
	/**
	 * 
	 * @return data no formato dd MM por extenso yyyy.
	 */
	public String getDataFormatadaSimples(){
		String data = DataUtils.getStringFormato(postagem, "dd/MM/yyyy");
		return DataUtils.decorrarData(data);
	}

}