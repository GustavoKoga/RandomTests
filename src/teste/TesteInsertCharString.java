package teste;

public class TesteInsertCharString {
	
	public static void main(String[] args) {
		int j = 123456789;
		String str = Integer.toString(j);
		str = new StringBuilder(j).insert(str.length()-2, ".").toString();
		System.out.println(str);
	}

}
