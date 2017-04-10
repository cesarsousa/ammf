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
	
	public static String decorrarData(String data) {
		String[] dataSplit = data.split("/");
		
		String dia = dataSplit[0];
		String mes = obterSiglaDoMes(dataSplit[1]);
		String ano = dataSplit[2];
				
		return dia+"\n"+mes+"\n"+ano;
		
	}

	private static String obterSiglaDoMes(String string) {
		if(string.equals("01")) {
			return "Jan";
		}
		if(string.equals("02")) {
			return "Fev";
		}
		if(string.equals("03")) {
			return "Mar";
		}
		if(string.equals("04")) {
			return "Abr";
		}
		if(string.equals("05")) {
			return "Mai";
		}
		if(string.equals("06")) {
			return "Jun";
		}
		if(string.equals("07")) {
			return "Jul";
		}
		if(string.equals("08")) {
			return "Ago";
		}
		if(string.equals("09")) {
			return "Set";
		}
		if(string.equals("10")) {
			return "Out";
		}
		if(string.equals("11")) {
			return "Nov";
		}
		if(string.equals("12")) {
			return "Dez";
		}
		return "";
	}

}
