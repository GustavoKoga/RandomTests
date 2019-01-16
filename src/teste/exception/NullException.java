package teste.exception;

public class NullException extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public NullException(String message) {
		super(message);
	}
	
	public NullException() {
		super("NULL!!");
	}

}
