package teste;

import teste.exception.NullException;
import teste.model.abstractimpl.Brinquedo;

public class TesteException {
	
	public static void main(String[] args) {
		
		Brinquedo brinquedo = null;
		
		try {
			teste(brinquedo);
		} catch (NullException e) {
			e.printStackTrace();
			System.out.println(e.getLocalizedMessage());
			System.out.println(e.getMessage());
		}
		
	}
	
	public static void teste(Brinquedo brinquedo) throws NullException {
		if (brinquedo == null) {
			throw new NullException();
		}
		
	}

}
