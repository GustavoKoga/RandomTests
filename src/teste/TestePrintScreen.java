package teste;

import java.awt.Rectangle;
import java.awt.Robot;
import java.awt.Toolkit;
import java.awt.image.BufferedImage;
import java.io.File;

import javax.imageio.ImageIO;

public class TestePrintScreen {

	public static void main(String[] args) {
		
		try {
			Robot robot = new Robot();
			Rectangle rectangle = new Rectangle(Toolkit.getDefaultToolkit().getScreenSize());
			BufferedImage capture = robot.createScreenCapture(rectangle);
			
			ImageIO.write(capture, "png", new File("./screenshot.png"));
			System.out.println("OK");
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
	}
}
