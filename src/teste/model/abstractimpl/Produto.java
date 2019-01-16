package teste.model.abstractimpl;

public abstract class Produto {

	private static int count = 0;

	public Produto() {
		count++;
	}

	public static int getCount() {
		return count;
	}

}
