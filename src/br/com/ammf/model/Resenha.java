package br.com.ammf.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
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
	
	private String autor;
	
	private String titulo;
	
	@Column(length = 10000)
	private String descricao;
	
	@ManyToOne
	private Categoria categoria;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date postagem = new Date();
	
	@OneToOne(cascade=CascadeType.ALL)
	private Imagem imagem;
	
	@OneToMany(mappedBy = "resenha", cascade = CascadeType.REMOVE, fetch = FetchType.EAGER)
	private List<Comentario> comentarios;
	
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

	public Date getPostagem() {
		return postagem;
	}

	public void setPostagem(Date postagem) {
		this.postagem = postagem;
	}
	
	public Categoria getCategoria() {
		return categoria;
	}
	
	public void setCategoria(Categoria categoria) {
		this.categoria = categoria;
	}
	
	public Imagem getImagem() {
		return imagem;
	}
	
	public void setImagem(Imagem imagem) {
		this.imagem = imagem;
	}
	
	public List<Comentario> getComentarios() {
		return comentarios;
	}
	
	public void setComentarios(List<Comentario> comentarios) {
		this.comentarios = comentarios;
	}
	
	public List<Comentario> getComentariosConfirmados() {
		List<Comentario> todos = comentarios;
		List<Comentario> confirmados = new ArrayList<Comentario>();
		
		for(Comentario comentario : todos){
			if (Status.CONFIRMADO == comentario.getStatus()) {
				confirmados.add(comentario);
			}
		}	
		
		return confirmados;
	}

	public String getDataFormatada(){
		return DataUtils.getStringDataHora(postagem);
	}
	
	public String getDataFormatadaSimples(){
		String data = DataUtils.getStringFormato(postagem, "dd/MM/yyyy");
		return DataUtils.decorrarData(data);
	}
	
	
	
}
