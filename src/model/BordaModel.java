package model;

import java.util.List;

public class BordaModel {

	private long id;
	private String nome;
	private double valorAdicional;
	private List<BordaIngredienteModel> listaIngredientes;

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

	public double getValorAdicional() {
		return valorAdicional;
	}

	public void setValorAdicional(double valorAdicional) {
		this.valorAdicional = valorAdicional;
	}

	public List<BordaIngredienteModel> getListaIngredientes() {
		return listaIngredientes;
	}

	public void setListaIngredientes(List<BordaIngredienteModel> listaIngredientes) {
		this.listaIngredientes = listaIngredientes;
	}

}
