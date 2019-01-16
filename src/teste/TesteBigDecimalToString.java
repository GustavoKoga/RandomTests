package teste;

import java.math.BigDecimal;

public class TesteBigDecimalToString {
	
	public static void main(String[] args) {
		
		BigDecimal value = BigDecimal.valueOf(1.5d);
		System.out.println(value);
		
		String valor = value.toString();
		System.out.println(valor);
		
		valor = value.toEngineeringString();
		System.out.println(valor);
		
		valor = value.toPlainString();
		System.out.println(valor);
		
		valor = valor.replace('.', ',');
		System.out.println(valor);
		
		int valorint = 0;
		try {
			valorint = value.intValueExact();
			valor = String.valueOf(valorint);
			valor = valor.replace('.', ',');
			System.out.println(valorint);
		} catch (ArithmeticException e) {
			valorint = value.intValue();
			System.out.println(valorint);
		}
		
		value = BigDecimal.valueOf(1d);
		try {
			valorint = value.intValueExact();
			valor = String.valueOf(valorint);
			valor = valor.replace('.', ',');
			System.out.println(valorint);
		} catch (ArithmeticException e) {
			valorint = value.intValue();
			System.out.println(valorint);
		}
		
	}

}
