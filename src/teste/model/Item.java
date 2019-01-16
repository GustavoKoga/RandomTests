package teste.model;

public class Item {
	
	private Integer id;
	private String nome;
	
	public Item(){
		System.out.println("New item");
		this.id = (int) Math.random()*100;
	}
	
	public Item(Integer id, String nome) {
		this.id = id;
		this.nome = nome;
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

}
