package teste;

public class TesteStringBuilder {

	public static void main(String[] args) {
		StringBuilder string = new StringBuilder(String.valueOf(6102));
		System.out.println(string.toString());
		string.setCharAt(0, '1');
		
		System.out.println(string.toString());
	}
	
	public void test() {
		StringBuilder string = new StringBuilder();
		
		string.append("1234567890");
		string.setLength(string.length()-3);
		
		System.out.println(string.toString());
	}
	
}
