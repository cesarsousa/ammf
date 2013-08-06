package br.com.ammf.teste;

import java.util.Calendar;
import java.util.Date;

import javax.mail.Session;
import javax.swing.JOptionPane;
import javax.transaction.Transaction;

import br.com.ammf.model.Local;
import br.com.ammf.model.Texto;
import br.com.ammf.repository.TextoRepository;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class DataBase {
	
	private static TextoRepository textoRepository;
	
	@SuppressWarnings("static-access")
	public DataBase(TextoRepository textoRepository){
		this.textoRepository = textoRepository;
	}
	
	public static void main(String[] args) {
		
		Texto texto = new Texto();
		
		texto.setAutor("Matsyendra-Samhitã");
		texto.setConteudo("Os milhares de males que surgem do nascimento de alguém podem ser removidos por meio da prática.");
		texto.setLocal(Local.INDEX);
		texto.setTitulo("sem titulo");
		texto.setPostagem(new Date());
		
		textoRepository.cadastrar(texto);
		
		JOptionPane.showMessageDialog(null, "Verifique a banco de dados");
		
	}
}	
