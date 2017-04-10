package br.com.ammf.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import br.com.ammf.utils.DataUtils;

@Entity
@Table(name="texto")
public class Texto implements Serializable{	
	
	private static final long serialVersionUID = 7207551872029736394L;

	@Id
	@GeneratedValue
	private long id;
	
	@Column(length=45)
	private String uuid = UUID.randomUUID().toString();
	
	@Enumerated(EnumType.STRING)
	private Local local;
	
	private String autor;
	
	private String titulo;
	
	@Lob
	private String conteudo;	
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date postagem = new Date();
	
	private boolean confirmado;
	
	@OneToMany(mappedBy = "texto", cascade = CascadeType.REMOVE, fetch = FetchType.EAGER)
	private List<Comentario> comentarios;

	public Texto(Local local) {
		this.local = local;
	}

	public Texto() {
		// TODO Auto-generated constructor stub
	}

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
	
	public Local getLocal() {
		return local;
	}
	
	public void setLocal(Local local) {
		this.local = local;
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
	
	public boolean isConfirmado() {
		return confirmado;
	}
	
	public void setConfirmado(boolean confirmado) {
		this.confirmado = confirmado;
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
	
	/**
	 * 
	 * @return data no formato dd/MM/yyyy HH:mm:ss.
	 */
	public String getDataFormatada(){
		return DataUtils.getStringDataHora(postagem);
	}
	
	/**
	 * 
	 * @return data no formato dd/MM/yyyy.
	 */
	public String getDataFormatadaSimples(){
		String data = DataUtils.getStringFormato(postagem, "dd/MM/yyyy");
		return data.replace("/", "\n");
	}
		
}
