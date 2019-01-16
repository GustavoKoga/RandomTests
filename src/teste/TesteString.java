
package teste;

public class TesteString {

	public static void main(String args[]) {
		String texto;
//		String texto2;
		
//		texto = "abcdfe\n\n\nxhxgaya\n\nnnnn\n";
//		System.out.println(texto);
//		texto = texto.replaceAll("\n{2,}", "\n");
//		System.out.println(texto);
		
		texto = "NOS NEURO ORTHOPAEDICS SURGERIES COM IMP EXP DE MAT CIR LTDA";
		System.out.println(texto);
		System.out.println("tamanho: " + texto.length());
//		texto = "15180308530703000133550010000000951530124135";
//		System.out.println(texto);
//		System.out.println("tamanho: " + texto.length());
		
//		texto = "select * from t_usuarios where";
//		System.out.println(texto.substring(0, texto.length()-5));
//		
//		texto = "R$ 1234.12,12/12-12";
//		System.out.println(texto);
////		texto = texto.replaceAll("\\.", "");
////		texto = texto.replaceAll("\\,", "");
////		texto = texto.replaceAll("\\/", "");
////		texto = texto.replaceAll("\\-", "");
////		texto = texto.replaceAll("\\s", "");
////		texto = texto.replaceAll("\\R$", "");
//		texto = texto.replaceAll("[^0-9]+", "");
//		System.out.println(texto);
		
//		String digitosTexto[] = texto.split("");
//		
//		texto2 = "5678";
//		String digitosTexto2[] = texto2.split("");
//		
//		String texto3 = "90";
//		String digitosTexto3[] = texto3.split("");
//		
//		String[] digitos = (String[]) ArrayUtils.addAll(digitosTexto, digitosTexto2);
//		digitos = (String[]) ArrayUtils.addAll(digitos, digitosTexto3);
//		
//		int ultimoDigito = 2;
//		
//		int total = 0;
//		
//		for (int i = digitos.length; i > 0; i--) {
//			String digito = digitos[i-1];
//			
//			int result = Integer.valueOf(digito) * ultimoDigito;
//			
//			if (StringUtils.length(String.valueOf(result)) > 1) {
//				String resultArray[] = String.valueOf(result).split("");
//				for (int j = 0; j <= resultArray.length-1 ; j++) {
//					total += Integer.valueOf(resultArray[j]);
//				}
//			} else {
//				total += result;
//			}
//			
//			if (ultimoDigito == 2) {
//				ultimoDigito = 1;
//			} else {
//				ultimoDigito = 2;
//			}
//		}
//		
//		int dac = 10 - (total % 10);
//		
//		System.out.println(dac);
//		
//		String string = "BANCO ITAU SA";
//		System.out.println(string.length());
//		int length = 15;
//		if (string.length() == length) {
//			System.out.println(string);
//			System.out.println(string.length());
//		} else if (string.length() < length) {
//			StringBuilder retorno = new StringBuilder(string);
//			for (int i = (length - string.length()); i > 0; i--) {
//				retorno.append(" ");
//			}
//			
//			System.out.println(retorno.toString());
//			System.out.println(retorno.length());
//			
//		} else {
//			System.out.println(string.substring(0, length));
//			System.out.println(string.substring(0, length).length());
//			
//		}
//		
//		texto = "01234567890123456789";
//		System.out.println(texto.substring(0, 5));
		
//		texto = "Nóva Rússia é demais";
//		
//		texto = Normalizer.normalize(texto, Normalizer.Form.NFD);
//		texto = texto.replaceAll("[^\\p{ASCII}]", "");
//		System.out.println(texto);
		
	}

}
