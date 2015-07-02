package br.com.ammf.model;

import java.io.Serializable;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="usuario")
public class Usuario implements Serializable{

	private static final long serialVersionUID = -2069753749604512978L;

	@Id
	@GeneratedValue
	private long id;
	
	private String uuid = UUID.randomUUID().toString();
	
	private String nome;
	
	private String login;
	
	private String senha;
	
	private String email;
	
	private String emailNotificacao;
	
	private String linkedin;
	
	private String endereco;
	
	@Column(length=1500)
	private String localizacao;
	
	private String telefone;
	
	private boolean mostrarMapa;
	
	private boolean emailAtivado;
	
	private boolean administrativo;
	
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

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getEmailNotificacao() {
		return emailNotificacao;
	}
	
	public void setEmailNotificacao(String emailNotificacao) {
		this.emailNotificacao = emailNotificacao;
	}
	
	public String getLinkedin() {
		return linkedin;
	}
	
	public void setLinkedin(String linkedin) {
		this.linkedin = linkedin;
	}
	
	public String getEndereco() {
		return endereco;
	}
	
	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}
	
	public String getLocalizacao() {
		return localizacao;
	}
	
	public void setLocalizacao(String localizacao) {
		this.localizacao = localizacao;
	}
	
	public String getTelefone() {
		return telefone;
	}
	
	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	
	public boolean isMostrarMapa() {
		return mostrarMapa;
	}
	
	public void setMostrarMapa(boolean mostrarMapa) {
		this.mostrarMapa = mostrarMapa;
	}
	
	public boolean isEmailAtivado() {
		return emailAtivado;
	}
	
	public void setEmailAtivado(boolean emailAtivado) {
		this.emailAtivado = emailAtivado;
	}
	
	public boolean isAdministrativo() {
		return administrativo;
	}
	
	public void setAdministrativo(boolean administrativo) {
		this.administrativo = administrativo;
	}
}
