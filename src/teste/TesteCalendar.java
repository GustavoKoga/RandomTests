package teste;

import java.text.DateFormatSymbols;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Locale;

public class TesteCalendar {
	
	public void fromDateFormatSymbols() {
		long i = System.currentTimeMillis();
		Calendar c = Calendar.getInstance();
		DateFormatSymbols format = new DateFormatSymbols(new Locale("pt", "BR"));
		String[] months = format.getMonths();
		System.out.println(months[c.get(Calendar.MONTH)]);
		long f = System.currentTimeMillis();
		System.out.println("Tempo execução: " + (f - i) + " ms");
	}
	
	public void fromSimpleDateFormat() {
		long i = System.currentTimeMillis();
		Calendar c = Calendar.getInstance();
		SimpleDateFormat format = new SimpleDateFormat("MMM");
		System.out.println(format.format(c.getTime()));
		long f = System.currentTimeMillis();
		System.out.println("Tempo execução: " + (f - i) + " ms");
	}
	
	public void fromCalendar() {
		long i = System.currentTimeMillis();
		Calendar c = Calendar.getInstance();
		System.out.println(c.getDisplayName(Calendar.MONTH, Calendar.LONG, new Locale("pt", "BR")));
		long f = System.currentTimeMillis();
		System.out.println("Tempo execução: " + (f - i) + " ms");
	}
	
	public void listMonths() {
//		Calendar dataFinal = Calendar.getInstance();
//		dataFinal.clear();
//		dataFinal.set(Calendar.DAY_OF_MONTH, 1);
//		dataFinal.set(Calendar.MONTH, 0);
//		dataFinal.set(Calendar.YEAR, 2018);
//		Calendar data = Calendar.getInstance();
//		data.add(Calendar.MONTH, -1);
//		while (data.getTimeInMillis() >= dataFinal.getTimeInMillis()) {
//			System.out.println(data.getDisplayName(Calendar.MONTH, Calendar.LONG, new Locale("pt", "BR")) + " " + data.get(Calendar.YEAR));
//			data.add(Calendar.MONTH, -1);
//		}
		
		
		Calendar dataFinal = Calendar.getInstance();
		dataFinal.clear();
		dataFinal.set(Calendar.YEAR, 2018);
		Calendar data = Calendar.getInstance();
		data.clear();
		data.set(Calendar.MONTH, Calendar.getInstance().get(Calendar.MONTH));
		data.set(Calendar.YEAR, Calendar.getInstance().get(Calendar.YEAR));
		data.add(Calendar.MONTH, -1);
		while (data.getTimeInMillis() >= dataFinal.getTimeInMillis()) {
			System.out.println(data.getTimeInMillis());
			System.out.println(data.getTime());
			System.out.println(data.getDisplayName(Calendar.MONTH, Calendar.LONG, new Locale("pt", "BR")) + " " + data.get(Calendar.YEAR));
			System.out.println();
			data.add(Calendar.MONTH, -1);
		}
	}
	
	public void intervaloDatas() {
		Calendar c = Calendar.getInstance();
		Calendar c2 = Calendar.getInstance();
		c2.set(Calendar.MONTH, 11);
		System.out.println(c2.get(Calendar.DAY_OF_YEAR) - c.get(Calendar.DAY_OF_YEAR));
	}
	
	public void calendarClear() {
		Calendar calendar = Calendar.getInstance();
//		System.out.println(c.getTime());
//		c.clear();
//		System.out.println(c.getTime());
//		c.set(Calendar.YEAR, 2018);
//		System.out.println(c.getTime());
		
		calendar.set(2018, 11, 1);
		System.out.println(calendar.getTime());
		System.out.println(calendar.getTimeInMillis());
	}

	public static void main(String[] args) {
		TesteCalendar teste = new TesteCalendar();
		teste.calendarClear();
//		teste.fromCalendar();
//		teste.fromDateFormatSymbols();
//		teste.fromSimpleDateFormat();
//		teste.intervaloDatas();
//		teste.listMonths();
		
//		Calendar c = Calendar.getInstance();
//		System.out.println(c.get(Calendar.YEAR));
		
	}
	
}
