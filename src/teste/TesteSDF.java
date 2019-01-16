package teste;

import java.text.SimpleDateFormat;
import java.util.Date;

public class TesteSDF {
	
	public static void main(String[] args) {
//		Calendar c = Calendar.getInstance();
//		for (int i = 0; i < 12; i++) {
//			System.out.println(i);
//			c.set(Calendar.MONTH, i);
//			SimpleDateFormat sdf = new SimpleDateFormat("MMM");
//			System.out.println(sdf.format(c.getTime()));
//			sdf = new SimpleDateFormat("M");
//			System.out.println(sdf.format(c.getTime()));
//			System.out.println("---");
//		}
		
		SimpleDateFormat sdfComGMT = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss Z");
		
		System.out.println(sdfComGMT.format(new Date()));
		
	}

}
