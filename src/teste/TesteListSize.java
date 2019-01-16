package teste;

import java.util.ArrayList;
import java.util.List;

public class TesteListSize {
	
	public static void main(String[] args) {
		List<String> list = new ArrayList<String>();
		
		list.add("a");
		list.add("b");
		list.add("c");
		list.add("d");
		list.add("e");
		
		for (String string : list) {
			System.out.println("|" + string + "|");
			System.out.println(list.indexOf(string));
			System.out.println(list.size());
			if (list.indexOf(string) != list.size() - 1) {
				System.out.println("TESTE \n TESTE");
			}
		}
		
	}

}
