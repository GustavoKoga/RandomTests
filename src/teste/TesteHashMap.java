package teste;

import java.util.HashMap;

public class TesteHashMap {
	
	public static void main(String[] args) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("teste1", 1);
		map.put("teste2", 2);
		map.put("teste3", 3);
		
		int value = map.get("teste1");
		System.out.println(value);
		value = map.get("teste2");
		System.out.println(value);
		value = map.get("teste3");
		System.out.println(value);
		value = map.get("teste4");
		System.out.println(value);
		
	}

}
