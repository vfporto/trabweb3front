package model;

public class SaborPizzaIngredienteModel {

	private long id;
	private SaborPizzaModel saborPizza;
	private IngredienteModel ingrediente;
	private double quantidade;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public SaborPizzaModel getSaborPizza() {
		return saborPizza;
	}

	public void setSaborPizza(SaborPizzaModel saborPizza) {
		this.saborPizza = saborPizza;
	}

	public IngredienteModel getIngrediente() {
		return ingrediente;
	}

	public void setIngrediente(IngredienteModel ingrediente) {
		this.ingrediente = ingrediente;
	}

	public double getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(double quantidade) {
		this.quantidade = quantidade;
	}

}
