package br.com.ammf.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="evento")
public class Evento implements Serializable{
	
	private static final long serialVersionUID = 8746186534525150288L;
	
	@Id
	@GeneratedValue
	private long id;

	@Enumerated(EnumType.STRING)
	private TipoEvento tipoEvento;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date postagem = new Date();
	
	@Column(length=255)
	private String data;
	
	@Column(length=255)
	private String local;
	
	private Integer valorIngresso;
	
	private Integer valorParticipacao;
	
	@OneToMany(mappedBy = "evento", cascade = CascadeType.REMOVE, fetch = FetchType.LAZY)
	private List<Participante> participantes;
	
	public Evento() {}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public TipoEvento getTipoEvento() {
		return tipoEvento;
	}

	public void setTipoEvento(TipoEvento tipoEvento) {
		this.tipoEvento = tipoEvento;
	}
	
	public void setPostagem(Date postagem) {
		this.postagem = postagem;
	}
	
	public Date getPostagem() {
		return postagem;
	}
	
	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public String getLocal() {
		return local;
	}

	public void setLocal(String local) {
		this.local = local;
	}
	
	public Integer getValorIngresso() {
		return valorIngresso;
	}
	
	public void setValorIngresso(Integer valorIngresso) {
		this.valorIngresso = valorIngresso;
	}
	
	public Integer getValorParticipacao() {
		return valorParticipacao;
	}
	
	public void setValorParticipacao(Integer valorParticipacao) {
		this.valorParticipacao = valorParticipacao;
	}

	public List<Participante> getParticipantes() {
		return participantes;
	}

	public void setParticipantes(List<Participante> participante) {
		this.participantes = participante;
	}
	
	public int getTotalParticipantes(){
		return participantes.size();
	}
		
}
