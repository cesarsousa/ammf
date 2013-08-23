package br.com.ammf.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "logAplicacao")
public class LogAplicacao implements Serializable {
	
	@Override
	public String toString() {
		return "[Data: " + data + " Ip: " + ip + " - Login: " + login + " Erro: " + descricaoErro + "]";
	}

	private static final long serialVersionUID = 1L;

	@Id	@GeneratedValue
	private Long id;

	@Temporal(value = TemporalType.TIMESTAMP)
	private Date data;

	private String ip;

	private String login;

	private String aplicacao;

	@Lob
	private String descricaoErro;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getAplicacao() {
		return aplicacao;
	}

	public void setAplicacao(String aplicacao) {
		this.aplicacao = aplicacao;
	}

	public String getDescricaoErro() {
		return descricaoErro;
	}

	public void setDescricaoErro(String descricaoErro) {
		this.descricaoErro = descricaoErro;
	}
}
