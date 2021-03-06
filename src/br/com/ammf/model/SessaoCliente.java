package br.com.ammf.model;

import java.io.Serializable;
import java.util.List;

import br.com.caelum.vraptor.ioc.Component;
import br.com.caelum.vraptor.ioc.SessionScoped;

@Component
@SessionScoped
public class SessaoCliente implements Serializable {

	private static final long serialVersionUID = -443208623326199685L;
	
	private Pessoa pessoa;
	
	private DadosTerapeuta terapeuta;	
	
	private Texto textoIndex;
	
	private Constelacao constelacao;
	private Constelacao constelacaoBarra;
	
	private List<Paragrafo> textoPsicologia;
	private List<Paragrafo> textoEducacao;
	private List<Paragrafo> textoCultura;
	private List<Paragrafo> textoArtesOrientais;
	private List<Paragrafo> textoQuiron;
	private Contato contato;
	
	public Texto getTextoIndex() {
		return textoIndex;
	}
	
	public void setTextoIndex(Texto textoIndex) {
		this.textoIndex = textoIndex;
	}
	
	public DadosTerapeuta getTerapeuta() {
		return terapeuta;
	}
	
	public void setTerapeuta(DadosTerapeuta terapeuta) {
		this.terapeuta = terapeuta;
	}
	
	public List<Paragrafo> getTextoPsicologia() {
		return textoPsicologia;
	}
	
	public void setTextoPsicologia(List<Paragrafo> textoPsicologia) {
		this.textoPsicologia = textoPsicologia;
	}
	
	public List<Paragrafo> getTextoEducacao() {
		return textoEducacao;
	}
	
	public void setTextoEducacao(List<Paragrafo> textoEducacao) {
		this.textoEducacao = textoEducacao;
	}
	
	public List<Paragrafo> getTextoCultura() {
		return textoCultura;
	}
	
	public void setTextoCultura(List<Paragrafo> textoCultura) {
		this.textoCultura = textoCultura;
	}
	
	public List<Paragrafo> getTextoArtesOrientais() {
		return textoArtesOrientais;
	}
	
	public void setTextoArtesOrientais(List<Paragrafo> textoArtesOrientais) {
		this.textoArtesOrientais = textoArtesOrientais;
	}	
	
	public List<Paragrafo> getTextoQuiron() {
		return textoQuiron;
	}
	
	public void setTextoQuiron(List<Paragrafo> textoQuiron) {
		this.textoQuiron = textoQuiron;
	}
	
	public Contato getContato() {
		return contato;
	}
	
	public void setContato(Contato contato) {
		this.contato = contato;
	}
	
	public Pessoa getPessoa() {
		return pessoa;
	}
	
	public void setPessoa(Pessoa pessoa) {
		this.pessoa = pessoa;
	}
	
	public Constelacao getConstelacao() {
		return constelacao;
	}
	
	public void setConstelacao(Constelacao constelacao) {
		this.constelacao = constelacao;
	}
	
	public void login(Pessoa pessoa){
		this.pessoa = pessoa;
	}
	
	public void logout(){
		this.pessoa = null;
	}

	public boolean isLogado() {
		return pessoa != null;
	}
	
	public Constelacao getConstelacaoBarra() {
		return constelacaoBarra;
	}
	
	public void setConstelacaoBarra(Constelacao constelacaoBarra) {
		this.constelacaoBarra = constelacaoBarra;
	}
	
}
