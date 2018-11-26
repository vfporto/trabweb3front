package model;

import java.util.List;

public class SaborPizzaModel {

	private long id;
	private TipoPizzaModel tipoPizza;
	private String nome;
	private String descricao;
	private double valorAdicional;
	private String foto;
	private List<SaborPizzaIngredienteModel> listaIngredientes;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public TipoPizzaModel getTipoPizza() {
		return tipoPizza;
	}

	public void setTipoPizza(TipoPizzaModel tipoPizza) {
		this.tipoPizza = tipoPizza;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public double getValorAdicional() {
		return valorAdicional;
	}

	public void setValorAdicional(double valorAdicional) {
		this.valorAdicional = valorAdicional;
	}

	public List<SaborPizzaIngredienteModel> getListaIngredientes() {
		return listaIngredientes;
	}

	public void setListaIngredientes(List<SaborPizzaIngredienteModel> listaIngredientes) {
		this.listaIngredientes = listaIngredientes;
	}

	public String getFoto() {
		return foto;
	}

	public void setFoto(String foto) {
		this.foto = foto;
	}

}
