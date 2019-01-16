package teste;

public class TesteBoleto {
	
	public static void main(String[] args) {
		TesteBoleto teste = new TesteBoleto();
		String testeNumeto = teste.preencherNumero("123", 10);
		System.out.println(testeNumeto + "-" + testeNumeto.length());
		String testeString = teste.preencherString("  ", 10);
		System.out.println(testeString + "-" + testeString.length());
	}
	
	protected String preencherString(String string, int length) {
		
		if (string.length() == length) {
			return string;
		} else if (string.length() < length) {
			StringBuilder retorno = new StringBuilder(string);
			for (int i = (length - string.length()); i > 0; i--) {
				retorno.append(" ");
			}
			return retorno.toString();
		} else {
			return string.substring(0, length);
		}
		
	}
	
	protected String preencherNumero(String numero, int length) {
		numero = numero.replaceAll("[^0-9]+", "");
		
		if (numero.length() == length) {
			return numero;
		} else if (numero.length() < length) {
			StringBuilder retorno = new StringBuilder();
			while ((retorno.length() + numero.length()) < length) {
				retorno.append("0");
			}
			retorno.append(numero);
			return retorno.toString();
		} else {
			return numero.substring(0, length);
		}
		
	}

}
