package teste;

public class TesteChar {
	
	public static void main(String[] args) {
		String cfop = "6102";
		char primeiro = cfop.charAt(0);
		if (primeiro == 6) {
			System.out.println(1);
		}
		if (primeiro == '6') {
			System.out.println(2);
		}
		
		StringBuilder myName = new StringBuilder(cfop);
		myName.setCharAt(0, '2');

		System.out.println(myName);
	}

}
