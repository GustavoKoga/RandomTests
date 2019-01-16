package teste;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class TesteRegex {
	
	public static void main(String[] args) {
		String string = "te.ste teste . . . . . . ";
		System.out.println(string);
//		String[] characteres = {"[\\s\\.]+$", "\\.$", };
		String[] characteres = string.split(",");
		for (String c : characteres) {
			string = string.replaceAll(c, "");
		}
		
		string = string.replaceAll("[\\s\\.]+$", "");
		System.out.println(string);
		
	}
	
	public static void teste() {
		StringBuilder birl = new StringBuilder();
		
		birl.append("PACIENTE: PATRICIA LOPES DA SILVA DOS SANTOS\n"
				+ "CONVÊNIO: SUS/PACOTE/  CÓDIGO NA TABELA: 0702030708\n"
				+ "MEDICO: ANDRE CERNICCHIARO\n"
				+ "DATA DA CIRURGIA: 04/07/2017 "
				+ "VENCIMENTO: 11/08/2017\n"
				+ "FORMA DE PAGAMENTO: BOLETO BANCARIO\n"
				+ "NOTA(S) DE REMESSA REF.: 43170711044620000149550010000154291091231540 \n"
				+ "ICMS: Isencao, Livro I, Tit. II, Cap. IV, Art. 9, Inc XXXIX, alinea c - RICMS/RS e Conv. 01/99 prorrog. pelo Conv. 49/17 - Procedimento autorizado pelo Ajuste SINIEF 11/14 \n \n \n   \n \n\n\n"
				+ "Valor aproximado dos impostos: R$ 54,19 (4,105%)");
//		birl.append("a \n \n \n\n a");
//		String bodybuilder = birl.toString();
//		String bodybuilder = birl.toString().replaceAll("\n{2,}\\s?", "\n");
		String bodybuilder = retiraEspacosDuplicados2(birl.toString());
		
		System.out.println(bodybuilder);
	}
	
	public static String retiraEspacosDuplicados(String string) {
		String patternStr = "\n{2,}\\s?";
		String replaceStr = "-";
		Pattern pattern = Pattern.compile(patternStr);
		Matcher matcher = pattern.matcher(string);
		string = matcher.replaceAll(replaceStr);
		return string;
	}
	
	public static String retiraEspacosDuplicados2(String string) {
		String patternStr = "\\s?\n{1,}\\s{0,}\n{1,}\\s?";
		String replaceStr = "\n";
		Pattern pattern = Pattern.compile(patternStr);
		Matcher matcher = pattern.matcher(string);
		string = matcher.replaceAll(replaceStr);
		return string;
	}
}
