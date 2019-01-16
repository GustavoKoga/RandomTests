package teste;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Scanner;

public class TesteFile {
	
	private static Scanner ler;

	public static void main(String[] args) {
		try {
			System.out.println("Gravação de arquivo texto.");
			
		    String nomeArquivo = "/tmp/tabuada.txt";
		    
		    ler = new Scanner(System.in);
		    int i, n;
		 
		    System.out.printf("Informe o número para a tabuada:\n");
		    n = ler.nextInt();
		 
		    // Abertura do arquivo externo para escrita
		    FileWriter arq = new FileWriter(nomeArquivo);
		    // Objeto de gravação associado a um fluxo de saída de dados baseado em caracteres
		    PrintWriter gravarArq = new PrintWriter(arq);
		 
		    gravarArq.printf("+--Resultado--+%n");
		    for (i=1; i<=10; i++) {
		      gravarArq.printf("| %2d X %d = %2d |%n", i, n, (i*n));
		    }
		    gravarArq.printf("+-------------+%n");
		 
		    arq.close();
		 
		    System.out.println("Fim");
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
