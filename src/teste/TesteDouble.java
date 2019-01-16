package teste;

public class TesteDouble {

	
	public static void main(String[] args) {
		Double valor = 2000.0;
//		Integer descontoPorcento = 15;
//		valor -= valor * descontoPorcento/100;
//		System.out.println(valor);
//		System.out.println(valor.toString());
		
		String num = "0000000001558";
		
		num = num.substring(0, num.length()-2) + "." + num.substring(num.length()-2);
		valor = new Double(num);
		System.out.println(valor);
		
	}
}
