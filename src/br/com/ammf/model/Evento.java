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

import br.com.ammf.utils.DataUtils;

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
	private Date data;
	
	@Column(length=255)
	private String local;
	
	@OneToMany(mappedBy = "evento", cascade = CascadeType.REMOVE, fetch = FetchType.LAZY)
	private List<Participante> participante;
	
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

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public String getLocal() {
		return local;
	}

	public void setLocal(String local) {
		this.local = local;
	}

	public List<Participante> getParticipante() {
		return participante;
	}

	public void setParticipante(List<Participante> participante) {
		this.participante = participante;
	}
	
	/**
	 * 
	 * @return data no formato dd/MM/yyyy HH:mm:ss.
	 */
	public String getDataFormatada(){
		return DataUtils.getStringDataHora(data);
	}
	
	/**
	 * 
	 * @return data no formato dd/MM/yyyy.
	 */
	public String getDataFormatadaSimples(){
		return DataUtils.getStringFormato(data, "dd/MM/yyyy");
	}

}
