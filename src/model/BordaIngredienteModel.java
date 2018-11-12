package model;

public class BordaIngredienteModel {
	
	private long id;
	private BordaModel borda;
	private IngredienteModel ingrediente;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public BordaModel getBorda() {
		return borda;
	}

	public void setBorda(BordaModel borda) {
		this.borda = borda;
	}

	public IngredienteModel getIngrediente() {
		return ingrediente;
	}

	public void setIngrediente(IngredienteModel ingrediente) {
		this.ingrediente = ingrediente;
	}
	
	
	

}
