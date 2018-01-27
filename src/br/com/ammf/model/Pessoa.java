package br.com.ammf.model;

import java.io.Serializable;
import java.util.Date;
import java.util.UUID;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import br.com.ammf.utils.DataUtils;

@Entity
@Table(name="pessoa")
public class Pessoa implements Serializable{

	private static final long serialVersionUID = -5143384580215530389L;
	
	@Id
	@GeneratedValue
	private long id;
	
	private String uuid = UUID.randomUUID().toString();
	
	private String nome;
	
	private String email;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date dataCadastro;
	
	@Enumerated(EnumType.STRING)
	private Status status;
	
	@Enumerated(EnumType.STRING)
	private Situacao situacao;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date dataExclusao;

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
	
	public Status getStatus() {
		return status;
	}
	
	public void setStatus(Status status) {
		this.status = status;
	}
		
	public Date getDataCadastro() {
		return dataCadastro;
	}
	
	public void setDataCadastro(Date dataCadastro) {
		this.dataCadastro = dataCadastro;
	}
	
	public Situacao getSituacao() {
		return situacao;
	}
	
	public void setSituacao(Situacao situacao) {
		this.situacao = situacao;
	}
	
	public Date getDataExclusao() {
		return dataExclusao;
	}
	
	public void setDataExclusao(Date dataExclusao) {
		this.dataExclusao = dataExclusao;
	}
	
	public String getDataFormatada(){
		return DataUtils.getStringDataHora(dataCadastro);
	}
	
	public String getDataExclusaoFormatada(){
		if(dataExclusao == null) return "";
		return DataUtils.getStringDataHora(dataExclusao);
	}
	
	public boolean isPendente(){
		return Status.PENDENTE == this.status;
	}
	
	public boolean isRemovidoPeloAdm(){
		return Situacao.REMOVIDO_PELO_ADM == this.situacao;
	}
	
	public boolean isInativa(){
		return Situacao.INATIVO == this.situacao || Situacao.INATIVO_NOTIFICADO == this.situacao;
	}
}
