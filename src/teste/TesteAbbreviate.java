package teste;

import org.apache.commons.lang3.StringUtils;

public class TesteAbbreviate {
	
	public static void main(String[] args) {
		String s = "abcdefg";
		
		System.out.println(StringUtils.abbreviate(s, 4));
		
		System.out.println(s.substring(0, Math.min(s.length(), 4)));
		
	}

}
