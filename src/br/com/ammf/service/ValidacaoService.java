package br.com.ammf.service;

import br.com.ammf.model.Comentario;
import br.com.ammf.model.Depoimento;
import br.com.ammf.model.Evento;
import br.com.ammf.model.Faq;
import br.com.ammf.model.Link;
import br.com.ammf.model.Livro;
import br.com.ammf.model.Local;
import br.com.ammf.model.Mensagem;
import br.com.ammf.model.Pessoa;
import br.com.ammf.model.Resenha;
import br.com.ammf.model.Texto;
import br.com.ammf.model.Usuario;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;

public interface ValidacaoService {
	
	void verificarCamposPreenchidos(Texto texto, Local local, Result result);
	
	boolean pessoa(boolean aceiteCadastro, Pessoa pessoa, Result result);

	boolean usuario(Usuario usuario, Result result);	

	boolean depoimento(Depoimento depoimento, Result result);

	boolean blog(Texto texto, Result result);

	boolean mensagem(Mensagem mensagem, Result result);

	boolean cadastrarLivro(UploadedFile imagemLivro, Livro livro, Result result);

	boolean atualizarLivro(UploadedFile imagemLivro, Livro livro, Result result);

	boolean novaResenha(UploadedFile imagemResenha, Resenha resenha, Result result);

	boolean atualizarResenha(UploadedFile novaImagemResenha, Resenha resenha, Result result);

	boolean cadastrarLink(Link link, Result result);

	boolean cadastrarFaq(Faq faq, Result result);

	boolean cadastrarComentario(Comentario comentario, Local local, Result result);

	String cadastrarComentario(String uuidTextoBlog, String comentarioNome, String comentarioEmail, String comentarioConteudo);

	boolean cadastrarEvento(Evento evento, Result result);

	boolean ehEmailValido(String email, Result result);	

}
