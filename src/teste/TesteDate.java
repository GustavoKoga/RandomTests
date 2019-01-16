package teste;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class TesteDate {

	public static void main(String[] args) {
//		Date dt = new Date();
		Locale localeBR = new Locale("pt", "BR");
		SimpleDateFormat fmt = new SimpleDateFormat("dd 'de' MMMM 'de' yyyy", localeBR);
		System.out.println( fmt.format(new Date()) );
		fmt = new SimpleDateFormat("MMMM", localeBR);
		System.out.println(fmt.format(new Date()));
		fmt = new SimpleDateFormat("yyyy", localeBR);
		System.out.println(fmt.format(new Date()));
		
		
		
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
//		System.out.println("dd/MM/yyyy: " + sdf.format(dt));
//		sdf = new SimpleDateFormat("HH:mm");
//		System.out.println("HH:mm: " + sdf.format(dt));
//		sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm");
//		System.out.println("dd/MM/yyyy HH:mm: " + sdf.format(dt));
//		sdf = new SimpleDateFormat("yy");
//		System.out.println("yy: " + sdf.format(dt));
		
//		try {
//			String date = "2016-02-22 00:00:00.0";
//			dt = sdf.parse(date);
//		} catch (ParseException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
//		System.out.println(dt);
		
	}
}
