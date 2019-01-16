package teste;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

public class TesteImagem {

//	public static void main(String[] args) {
//		try {
//			String caminho = "/home/bluebit/Downloads/";
//			String nome = "rodorpho";
//			ImageIcon i = new ImageIcon("rodolfo.jpeg");
//			BufferedImage image = ImageIO.read(new File(caminho + "rodolfo.jpeg"));
//			int drawLocationX = 300;
//			int drawLocationY = 300;
//
//			double rotationRequired = Math.toRadians(90);
//			double locationX = image.getWidth()/2.5;
//			double locationY = image.getHeight()/2.5;
//			AffineTransform tx = AffineTransform.getRotateInstance(rotationRequired, locationX, locationY);
//			AffineTransformOp op = new AffineTransformOp(tx, AffineTransformOp.TYPE_BILINEAR);
//
//			// Drawing the rotated image at the required drawing locations
//			BufferedImage sonho = new BufferedImage(image.getHeight(), image.getWidth(), BufferedImage.TYPE_INT_ARGB);
//			Graphics2D g2d = sonho.createGraphics();
//			
//			g2d.drawImage(op.filter(image, sonho), drawLocationX, drawLocationY, null);
//
//			File file = new File(caminho + nome + ".png");
//
//			ImageIO.write(sonho, "png", file);
//			ImageIcon rodado = new ImageIcon(caminho + nome + ".png");
//			
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}
	
	public static void main(String[] args) {
		try {
			String caminho = "/home/bluebit/Downloads/";
			String nome = "rodorpho";
			BufferedImage image = ImageIO.read(new File(caminho + "rodolfo.jpeg"));
			BufferedImage rodado = rotateCw(image);
			
			File file = new File(caminho + nome + ".png");
			
			ImageIO.write(rodado, "png", file);
//			ImageIcon asd = new ImageIcon(caminho + nome + ".png");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public static BufferedImage rotateCw( BufferedImage img ){
		int         width  = img.getWidth();
		int         height = img.getHeight();
		BufferedImage   newImage = new BufferedImage( height, width, img.getType() );
		
		for( int i=0 ; i < width ; i++ )
			for( int j=0 ; j < height ; j++ )
				newImage.setRGB( height-1-j, i, img.getRGB(i,j) );
		
		return newImage;
	}

	public static BufferedImage toBufferedImage(Image img) {
		if (img instanceof BufferedImage) {
			return (BufferedImage) img;
		}

		// Create a buffered image with transparency
		BufferedImage bimage = new BufferedImage(img.getWidth(null), img.getHeight(null), BufferedImage.TYPE_INT_ARGB);

		// Draw the image on to the buffered image
		Graphics2D bGr = bimage.createGraphics();
		bGr.drawImage(img, 0, 0, null);
		bGr.dispose();

		// Return the buffered image
		return bimage;
	}

}
