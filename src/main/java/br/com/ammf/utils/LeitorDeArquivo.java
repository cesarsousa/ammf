package br.com.ammf.utils;

import java.util.Scanner;

public class LeitorDeArquivo {

	public String lerArquivo(String arquivo) {
		String caminho = arquivo.startsWith("./") ? arquivo.substring(2) : arquivo;
		Scanner scanner = new Scanner(getClass().getClassLoader().getResourceAsStream(caminho));
		StringBuilder arquivoBuilder = new StringBuilder();

		while (scanner.hasNext()) {
			arquivoBuilder.append(scanner.nextLine());
			arquivoBuilder.append("\n");
		}

		return arquivoBuilder.toString();
	}

}
