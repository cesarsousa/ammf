package br.com.ammf.utils;

import java.text.SimpleDateFormat;
import java.util.Calendar;

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
	public static String getFullString(Calendar postagem) {
		SimpleDateFormat spf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		return spf.format(postagem.getTime());
	}	

}
