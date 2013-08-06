package br.com.ammf.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Date;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import br.com.ammf.utils.DataUtils;

@Entity
@Table(name="livro")
public class Livro implements Serializable {

	private static final long serialVersionUID = -6616282805018803282L;
	
	@Id
	@GeneratedValue
	private long id;
	
	private String uuid = UUID.randomUUID().toString();
	
	@Column(length=1005)
	private String sinopse;
	
	private String nomeImagem = "/capaLivroDefault.jpg";
	
	private String titulo;
	private String autor;
	private String subtitulo;
	private String editora;
	private String isbn;
	private int paginas;
	private int edicao;
	private int ano;
	private String assunto;
	private String idioma;
	private String codigoBarra;
	private BigDecimal preco;
	private Date postagem;
		
	private String linkVenda;
	
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
	public String getSinopse() {
		return sinopse;
	}
	public void setSinopse(String sinopse) {
		this.sinopse = sinopse;
	}
	public String getNomeImagem() {
		return nomeImagem;
	}
	public void setNomeImagem(String nomeImagem) {
		this.nomeImagem = nomeImagem;
	}
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public String getAutor() {
		return autor;
	}
	public void setAutor(String autor) {
		this.autor = autor;
	}
	public String getSubtitulo() {
		return subtitulo;
	}
	public void setSubtitulo(String subtitulo) {
		this.subtitulo = subtitulo;
	}
	public String getEditora() {
		return editora;
	}
	public void setEditora(String editora) {
		this.editora = editora;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public int getPaginas() {
		return paginas;
	}
	public void setPaginas(int paginas) {
		this.paginas = paginas;
	}
	public int getEdicao() {
		return edicao;
	}
	public void setEdicao(int edicao) {
		this.edicao = edicao;
	}
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	public String getAssunto() {
		return assunto;
	}
	public void setAssunto(String assunto) {
		this.assunto = assunto;
	}
	public String getIdioma() {
		return idioma;
	}
	public void setIdioma(String idioma) {
		this.idioma = idioma;
	}
	public String getCodigoBarra() {
		return codigoBarra;
	}
	public void setCodigoBarra(String codigoBarra) {
		this.codigoBarra = codigoBarra;
	}
	public BigDecimal getPreco() {
		return preco;
	}
	public void setPreco(BigDecimal preco) {
		this.preco = preco;
	}
	
	public Date getPostagem() {
		return postagem;
	}
	
	public void setPostagem(Date postagem) {
		this.postagem = postagem;
	}
	
	public String getLinkVenda() {
		return linkVenda;
	}
	
	public void setLinkVenda(String linkVenda) {
		this.linkVenda = linkVenda;
	}
		
	public String getDataFormatada(){
		return DataUtils.getString(postagem, "dd/MM/yyyy");
	}
	
	public String getPrecoFormatado(){		
		return preco == null ? "0,00" : this.preco.toString();
	}
}
