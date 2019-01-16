package teste;

import java.math.BigDecimal;
import java.math.RoundingMode;

public class TesteBigDecimal {
	
	public static void main(String[] args) {
//		Double valorTotal = 49.99d;
//		Double quantidadeDuplicata = 3d;
//		
//		BigDecimal valorTotalBD = new BigDecimal(valorTotal);
//		
//		BigDecimal quantidadeDuplicataBD = new BigDecimal(quantidadeDuplicata);
//		
//		BigDecimal valorDuplicata = BigDecimal.ZERO;
//		
////		valorDuplicata = valorTotalBD.divide(quantidadeDuplicataBD, 2, RoundingMode.UNNECESSARY);
//		valorDuplicata = valorTotalBD.divide(quantidadeDuplicataBD);
//		
//		System.out.println("ValorDuplicata: " + valorDuplicata);
		
//		BigDecimal a = new BigDecimal("1.6");
//		BigDecimal b = new BigDecimal("9.2");
//		System.out.println(a.divide(b));
		
		BigDecimal valorFrete = new BigDecimal(49.99d);
//		BigDecimal itens = new BigDecimal(3);
//		BigDecimal resultado = valorFrete.divide(itens);
//		System.out.println(resultado);
		System.out.println(valorFrete.setScale(2, RoundingMode.CEILING));
		System.out.println(valorFrete.setScale(2, RoundingMode.FLOOR));
		System.out.println(valorFrete.setScale(2, RoundingMode.DOWN));
		System.out.println(valorFrete.setScale(2, RoundingMode.HALF_DOWN));
		System.out.println(valorFrete.setScale(2, RoundingMode.HALF_EVEN));
		System.out.println(valorFrete.setScale(2, RoundingMode.HALF_UP));
//		System.out.println(valorFrete.setScale(2, RoundingMode.UNNECESSARY));
		System.out.println(valorFrete.setScale(2, RoundingMode.UP));
		System.out.println(valorFrete);
		System.out.println(valorFrete.toEngineeringString());
		System.out.println(valorFrete.toPlainString());
		System.out.println(valorFrete.toString());
		
	}

}
