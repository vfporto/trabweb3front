package model;

public class TamanhoModel {
	
	private long id;
	private String nome;
	private String descricao;
	private int numMaximoSabores;
	private double preco;
	private double fatorMultiplicacao; //Qtas vezes essa pizza eh maior que a pequena (usada como referencia para calculo de ingredientes)
	
	
	
	
	
	
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
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public int getNumMaximoSabores() {
		return numMaximoSabores;
	}
	public void setNumMaximoSabores(int numMaximoSabores) {
		this.numMaximoSabores = numMaximoSabores;
	}
	public double getPreco() {
		return preco;
	}
	public void setPreco(double preco) {
		this.preco = preco;
	}
	public double getFatorMultiplicacao() {
		return fatorMultiplicacao;
	}
	public void setFatorMultiplicacao(double fatorMultiplicacao) {
		this.fatorMultiplicacao = fatorMultiplicacao;
	}
}
