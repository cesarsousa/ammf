package br.com.ammf.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="participante")
public class Participante implements Serializable{
	
	private static final long serialVersionUID = 2735423701243485542L;

	@Id
	@GeneratedValue
	private long id;
	
	private String nome;
	
	private String email;
	
	private String celular;
	
	private String comoSoube;
	
	private boolean pagouIngresso;
	
	private boolean constelou;
	
	private boolean pagouContelacao;
	
	@Column(length=1000)
	private String observacao;
	
	@ManyToOne(cascade = CascadeType.PERSIST)
	private Evento evento;
	
	public Participante() {}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCelular() {
		return celular;
	}

	public void setCelular(String celular) {
		this.celular = celular;
	}

	public String getComoSoube() {
		return comoSoube;
	}

	public void setComoSoube(String comoSoube) {
		this.comoSoube = comoSoube;
	}

	public boolean isPagouIngresso() {
		return pagouIngresso;
	}

	public void setPagouIngresso(boolean pagouIngresso) {
		this.pagouIngresso = pagouIngresso;
	}

	public boolean isConstelou() {
		return constelou;
	}

	public void setConstelou(boolean constelou) {
		this.constelou = constelou;
	}

	public boolean isPagouContelacao() {
		return pagouContelacao;
	}

	public void setPagouContelacao(boolean pagouContelacao) {
		this.pagouContelacao = pagouContelacao;
	}
	
	public String getObservacao() {
		return observacao;
	}
	
	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}

	public Evento getEvento() {
		return evento;
	}

	public void setEvento(Evento evento) {
		this.evento = evento;
	}
	
	public String getIngressoPago(){
		return pagouIngresso ? "Sim" : "Não";
	}
	
	public String getParticipouEvento(){
		return constelou ? "Sim" : "Não";
	}
	
	public String getConstelacaoPaga(){
		return pagouContelacao ? "Sim" : "Não";
	}
	
	public boolean isComObservacao(){
		if(observacao == null) return false;
				
		if(observacao.length() == 0){
			return false;
		}
		
		return true;
	}
	
	public boolean isInadimplente(){
		if (!pagouIngresso) return true;
		if(constelou && !pagouContelacao) return true;
		return false;
		
	 }

}
