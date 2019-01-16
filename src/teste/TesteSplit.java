package teste;

public class TesteSplit {
	
	public static void main(String[] args) {
		String string = "2018-12-1";
		String[] date = string.split("-");
		for (String data : date) {
			System.out.println(data);
		}
	}

}
