package teste;

import java.util.Collection;

import teste.model.Item;

public class TesteCollection {
	
	public static Collection<Item> itens;
	
	public static void main(String[] args) {
		Item i = new Item();
		i.setId(1);
		i.setNome("item a");
		Item i2 = new Item();
		i2.setId(2);
		i2.setNome("item b");
		
		itens.add(i);
		itens.add(i2);
		
		if (itens.contains(i.getNome())){
			System.out.println("Contem");
		}else {
			System.out.println("nao");
		}
		
		
	}

}
