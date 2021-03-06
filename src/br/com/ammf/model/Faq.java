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
@Table(name="faq")
public class Faq {

	@Id
	@GeneratedValue
	private long id;
	
	@Column(length=45)
	private String uuid = UUID.randomUUID().toString();
	
	private String nome;
	private String email;
	
	@Column(length = 500)
	private String pergunta;
	
	@Column(length = 2500)
	private String resposta;
	private boolean publica;
	
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

	public String getPergunta() {
		return pergunta;
	}

	public void setPergunta(String pergunta) {
		this.pergunta = pergunta;
	}

	public String getResposta() {
		return resposta;
	}

	public void setResposta(String resposta) {
		this.resposta = resposta;
	}

	public Date getPostagem() {
		return postagem;
	}

	public void setPostagem(Date postagem) {
		this.postagem = postagem;
	}
	
	public boolean isPublica() {
		return publica;
	}
	
	public void setPublica(boolean publica) {
		this.publica = publica;
	}
	
	public String getVisibilidade(){
		return publica ? "Publica" : "Particular";
	}
	
	public boolean getRespondida(){
		if(resposta == null || resposta.isEmpty()){
			return false;
		}
		return true;
	}
	
	public String getDataFormatada(){
		return DataUtils.getStringFormato(postagem, "dd/MM/yyyy HH:mm:ss");
	}
}
