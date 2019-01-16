package teste.model;

public class Objeto {

	private Integer id;
	private Item item;

	public Objeto() {}

	public Objeto(Integer id, Item item) {
		this.id = id;
		this.item = item;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Item getItem() {
		return item;
	}

	public void setItem(Item item) {
		this.item = item;
	}

}
