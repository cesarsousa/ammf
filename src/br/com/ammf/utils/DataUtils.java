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
	public static String getFullString(Date postagem) {
		SimpleDateFormat spf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		return spf.format(postagem.getTime());
	}

	public static String getString(Date postagem, String formato) {
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
	 * @return
	 * @throws ParseException
	 */
	public static Date getDate(String data) throws ParseException{
		return new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").parse(data);
	}

}
