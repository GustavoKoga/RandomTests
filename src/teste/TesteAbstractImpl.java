package teste;

import teste.model.abstractimpl.Brinquedo;
import teste.model.abstractimpl.TV;

public class TesteAbstractImpl {

	@SuppressWarnings("static-access")
	public static void main(String[] args) {
		
		Brinquedo b = new Brinquedo();
		System.out.println(b.getCount());
		
		TV t = new TV();
		System.out.println(t.getCount());
		
	}

}
