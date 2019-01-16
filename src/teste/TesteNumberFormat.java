package teste;

import java.text.NumberFormat;

public class TesteNumberFormat {
	
	public static void main(String[] args) {
		NumberFormat format = NumberFormat.getCurrencyInstance();
		System.out.println(format.format(100));
	}

}
