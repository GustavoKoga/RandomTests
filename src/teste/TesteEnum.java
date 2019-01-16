package teste;

public class TesteEnum {
	
	public enum EnumTipo {
		
		OUTROS("outros");
		
		private EnumTipo(String descricao) {
			this.descricao = descricao;
		}

		private String descricao;

		public String getDescricao() {
			return descricao;
		}

		public void setDescricao(String descricao) {
			this.descricao = descricao;
		}

	}
	
	public static void main(String[] args) {
		EnumTipo tipo = EnumTipo.OUTROS;
		
		// outros
		System.out.println(tipo.getDescricao()); 
		// class teste.Tipo
		System.out.println(tipo.getDeclaringClass());
		// OUTROS
		System.out.println(tipo.name());
		// OUTROS
		System.out.println(tipo.toString());
	}
}
