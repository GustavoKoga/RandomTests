package teste;

public class TesteReplace {
	
	public static void main(String[] args) {
		String teste = "|0150|9141|AGEMED PLANOS DE SAÚDE | 1058|02933220000101|| |4209102| |  R DOUTOR PLÁCIDO OLÍMPIO DE OLIVEIRA |693||BUCAREIN|";
		System.out.println(teste);
//		teste = teste.replaceAll("\\s\\|", "|");
		teste = teste.replaceAll("\\s{0,}\\|\\s{0,}", "|");
		System.out.println(teste);
	}
	
	public void teste3() {
		String teste = "_SEPARADOR_C170_SEPARADOR_1_SEPARADOR_109634_SEPARADOR_Conv.ICMS.93/2015: FCP Dest: 0,00 ICMS Dest: 24,61 ICMS Remet: 6,15|Tributos aprox R$ 30,30 Federal e R$ 61,52 Estadual_SEPARADOR_2_SEPARADOR_UN_SEPARADOR_219,7_SEPARADOR_0_SEPARADOR_0_SEPARADOR_240_SEPARADOR_6102_SEPARADOR__SEPARADOR_0_SEPARADOR_0_SEPARADOR_0_SEPARADOR__SEPARADOR__SEPARADOR__SEPARADOR__SEPARADOR__SEPARADOR_999_SEPARADOR_0_SEPARADOR_0_SEPARADOR_0_SEPARADOR_06_SEPARADOR_0_SEPARADOR_0_SEPARADOR_0_SEPARADOR_0_SEPARADOR_0_SEPARADOR_06_SEPARADOR_0_SEPARADOR_0_SEPARADOR_0_SEPARADOR_0_SEPARADOR_0_SEPARADOR__SEPARADOR_";
		System.out.println("." + teste.trim() + ".");
		
		String teste2 = teste.replaceAll("\\|", " - ");
		System.out.println("." + teste2.trim() + ".");
		
		teste2 = teste2.replaceAll("_SEPARADOR_", "|");
		System.out.println("." + teste2.trim() + ".");
		
//		System.out.println("." + teste.trim() + ".");
		
	}
	
	public void teste2() {
		String teste = "|0150|8406|CONECTA HOSPITALAR COMERCIAL LTDA - ME|1058|21222602000163|null|063657295|2304400||R SENADOR";
		teste = teste.replaceAll("null", "");
		System.out.println(teste);
	}
	
	public void teste() {
		String teste = "  A0927.7AW  ";
		System.out.println("." + teste.trim() + ".");
		System.out.println("." + teste + ".");
		teste = teste.replaceAll("[A-Z]", "");
		System.out.println("." + teste + ".");
		teste = teste.replace('.', ',');
		System.out.println("." + teste + ".");
		teste = teste.replaceAll("[^0-9]", "");
		System.out.println("." + teste + ".");
	}

}
;