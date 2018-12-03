package model;

public class IngredienteModel {

	private long id;
	private String nome;
	private double qtEstoque;
	private double qtMinima;
	private double qtMaxima;
	private String unidadeMedida;
	
	public IngredienteModel() {
		super();
	}


	public IngredienteModel(long id) {
		super();
		this.id = id;
	}




	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public double getQtEstoque() {
		return qtEstoque;
	}

	public void setQtEstoque(double qtEstoque) {
		this.qtEstoque = qtEstoque;
	}

	public double getQtMinima() {
		return qtMinima;
	}

	public void setQtMinima(double qtMinima) {
		this.qtMinima = qtMinima;
	}

	public double getQtMaxima() {
		return qtMaxima;
	}

	public void setQtMaxima(double qtMaxima) {
		this.qtMaxima = qtMaxima;
	}

	public String getUnidadeMedida() {
		return unidadeMedida;
	}

	public void setUnidadeMedida(String unidadeMedida) {
		this.unidadeMedida = unidadeMedida;
	}

}
