package br.com.ammf.utils;

import java.io.File;
import java.util.Scanner;

public class LeitorDeArquivo {
	
	public String lerArquivo(String arquivo) {
		return lerArquivo(new File(arquivo));
	}
	
	private String lerArquivo(File arquivo) {
		Scanner scanner = new Scanner(getClass().getClassLoader().getResourceAsStream(arquivo.getName()));
		StringBuilder arquivoBuilder = new StringBuilder();

		while (scanner.hasNext()) {
			arquivoBuilder.append(scanner.nextLine());
			arquivoBuilder.append("\n");
		}

		return arquivoBuilder.toString();
	}

}
