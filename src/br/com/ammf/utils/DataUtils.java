package br.com.ammf.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Classe utilitária para manipulação da datas.
 * @author cesar
 *
 */
public class DataUtils {

	/**
	 * Converte um objeto para uma representação em formato string.
	 * @param postagem
	 * @return data no formato dd/MM/yyyy HH:mm:ss.
	 */
	public static String getStringDataHora(Date postagem) {
		SimpleDateFormat spf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		return spf.format(postagem.getTime());
	}
	
	/**
	 * Converte um objeto para uma representação em formato string.
	 * @param postagem
	 * @return data no formato dd/MM/yyyy.
	 */
	public static String getStringData(Date postagem) {
		SimpleDateFormat spf = new SimpleDateFormat("dd/MM/yyyy");
		return spf.format(postagem.getTime());
	}
	
	/**
	 * Converte um objeto para uma representação em formato string.
	 * @param postagem
	 * @param formato formato da data.
	 * @return
	 */
	public static String getStringFormato(Date postagem, String formato) {
		SimpleDateFormat spf = new SimpleDateFormat(formato);
		return spf.format(postagem.getTime());
	}
	
	public static Date getDateNow(){
		return new Date();
	}
	
	public static int getAnoCorrente(){
		Calendar hoje = Calendar.getInstance();
		return hoje.get(Calendar.YEAR);
	}
	
	/**
	 * 
	 * @param data Representacao de uma data no formato dd/MM/yyyy HH:mm:ss
	 * @return Um objeto do tipo <code>Date</code>
	 * @throws ParseException Caso a String data não esteja no formato 'dd/MM/yyyy HH:mm:ss'.
	 */
	public static Date getDate(String data) throws ParseException{
		return new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").parse(data);
	}

}
