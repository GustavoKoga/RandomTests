package teste;

import java.text.DecimalFormat;

import org.apache.commons.lang3.StringUtils;

public class TesteDecimalFormat {
	
	public static void main(String[] args) {
		
//		System.out.println("Teste com zeros no format");
//		
//		DecimalFormat df = new DecimalFormat("000.00");
//		
//		Double numero = new Double("12345.5448594");
//		System.out.println("Num: \t\t" + numero);
//		System.out.println("Num format: \t" + df.format(numero));
//		
//		numero = new Double("12.1");
//		System.out.println("Num: \t\t" + numero);
//		System.out.println("Num format: \t" + df.format(numero));
//		
//		System.out.println("\n");
//		
//		System.out.println("Teste com # no format");
//		
//		df = new DecimalFormat("###.##");
//		
//		numero = new Double("12345.5448594");
//		System.out.println("Num: \t\t" + numero);
//		System.out.println("Num format: \t" + df.format(numero));
//		
//		numero = new Double("12.1");
//		System.out.println("Num: \t\t" + numero);
//		System.out.println("Num format: \t" + df.format(numero));
		
		String valor = "151.5948";
		valor = numberFormat(valor, 2);
	}
	
	public static String numberFormat(String value, int decimalDigits) {
		Double valor = Double.valueOf(value);
		if (decimalDigits > 0) {
			String exp = "#.";
			exp = StringUtils.rightPad(exp, decimalDigits+2, '#');
			DecimalFormat format = new DecimalFormat(exp);
			return format.format(valor);
		}
		
		return value;
	}

}
