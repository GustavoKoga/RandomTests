package teste;

import java.util.ArrayList;
import java.util.List;

import teste.model.Item;
import teste.model.Objeto;

public class TesteComparable {
	
	public static void main(String[] args) {
		
		Item item = new Item(1, "1");
//		Item item2 = new Item(2, "2");
		
		Objeto o = new Objeto(1, item);
		Objeto o2 = new Objeto(2, null);
		
		List<Objeto> objetos = new ArrayList<Objeto>();
		objetos.add(o);
		objetos.add(o2);
		
	}

}
