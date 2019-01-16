package teste;

import javax.swing.JOptionPane;

public class TesteOptionPane {

	public static void main(String[] args) {
		Integer num1 = Integer.valueOf(JOptionPane.showInputDialog("num 1"));
		Integer num2 = Integer.valueOf(JOptionPane.showInputDialog("num 2"));
		
		Integer num3 = num1 + num2;
		if (num3 % 2 == 0) {
			JOptionPane.showMessageDialog(null, "par");
		} else {
			JOptionPane.showMessageDialog(null, "impar");
		}
		
		JOptionPane.showMessageDialog(null, ((num1 + num2) % 2 == 0) ? "par" : "impar");
		
	}
	
}
