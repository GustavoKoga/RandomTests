package teste;

import teste.model.Item;

public class TesteClazz {
	
	public static void main(String[] args) {
		try {
			Item item = (Item) Class.forName(Item.class.getCanonicalName()).newInstance();
			System.out.println(item.getId());
			
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
	}

}
