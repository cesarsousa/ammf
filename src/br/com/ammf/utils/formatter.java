package br.com.ammf.utils;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import br.com.ammf.model.Titulo;

public class formatter {

	public static List<Titulo> comoArrayList(List<Object[]> titulos) {
		List<Titulo> listaDeTitulos = new ArrayList<Titulo>();
		
		for(Object[] titulo : titulos){
			Calendar data = (Calendar) titulo[1];
			listaDeTitulos.add(new Titulo(String.valueOf(titulo[0]), data, String.valueOf(titulo[2])));			
		}
			
		return listaDeTitulos;
	}

}
