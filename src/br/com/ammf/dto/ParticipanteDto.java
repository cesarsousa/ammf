package br.com.ammf.dto;

import br.com.ammf.model.Participante;

public class ParticipanteDto {
	
	private String nome;
	private String email;
	private String telefone;
	private boolean pagouIngresso;
	private boolean constelou;
	private boolean pagouContelacao;
	private String observacao;
	private String data;
	private String local;
	private Integer valorIngresso;
	private Integer valorParticipacao;

	public ParticipanteDto(Participante participante) {
		this.nome = participante.getNome();
		this.email = participante.getEmail();
		this.telefone = participante.getCelular();
		this.pagouIngresso = participante.isPagouIngresso();
		this.constelou = participante.isConstelou();
		this.pagouContelacao = participante.isPagouContelacao();
		this.observacao = participante.getObservacao();
		this.data = participante.getEvento().getData();
		this.local = participante.getEvento().getLocal();
		this.valorIngresso = participante.getEvento().getValorIngresso();
		this.valorParticipacao = participante.getEvento().getValorParticipacao();
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

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
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

}
