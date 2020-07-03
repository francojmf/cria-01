package br.com.unifesp.cria.domain;

import java.io.Serializable;
import java.text.NumberFormat;
import java.util.Locale;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class ItemPedido implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@JsonIgnore
	@EmbeddedId
	private ItemPedidoPK id = new ItemPedidoPK();
	private String nome;
	private Integer med_a;
	private Integer med_b;
	private Integer med_c;
	private Integer med_d;
	private Integer med_e;
	private Integer med_f;
	private String descricao;
	
	@ManyToOne
	@JoinColumn(name="pedido_id", insertable = false, updatable = false)
	private Pedido pedido;
	
	@ManyToOne
	@JoinColumn(name="produto_id", insertable = false, updatable = false)
	private Produto produto;
	
	private Integer quantidade;
	
	public ItemPedido() {
	}

	public ItemPedido(Pedido pedido, Produto produto, String nome, Integer med_a, Integer med_b, Integer med_c, Integer med_d,
			Integer med_e, Integer med_f, String descricao, Integer quantidade) {
		super();
		id.setPedido(pedido);
		id.setProduto(produto);
		this.nome = nome;
		this.med_a = med_a;
		this.med_b = med_b;
		this.med_c = med_c;
		this.med_d = med_d;
		this.med_e = med_e;
		this.med_f = med_f;
		this.descricao = descricao;
		this.quantidade = quantidade;
	}

	@JsonIgnore
	public Pedido getPedido() {
		return id.getPedido();
	}
	
	public void setPedido(Pedido pedido) {
		id.setPedido(pedido);
	}
	
	public Produto getProduto() {
		return id.getProduto();
	}
	
	public void setProduto(Produto produto) {
		id.setProduto(produto);
	}
	
	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public ItemPedidoPK getId() {
		return id;
	}

	public void setId(ItemPedidoPK id) {
		this.id = id;
	}

	public Integer getMed_a() {
		return med_a;
	}

	public void setMed_a(Integer med_a) {
		this.med_a = med_a;
	}
	
	private Integer getMed_b() {
		return med_b;
	}

	private void setMed_b(Integer med_b) {
		this.med_b = med_b;
	}

	private Integer getMed_c() {
		return med_c;
	}

	private void setMed_c(Integer med_c) {
		this.med_c = med_c;
	}

	private Integer getMed_d() {
		return med_d;
	}

	private void setMed_d(Integer med_d) {
		this.med_d = med_d;
	}

	private Integer getMed_e() {
		return med_e;
	}

	private void setMed_e(Integer med_e) {
		this.med_e = med_e;
	}

	private Integer getMed_f() {
		return med_f;
	}

	private void setMed_f(Integer med_f) {
		this.med_f = med_f;
	}

	private String getDescricao() {
		return descricao;
	}

	private void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Integer getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(Integer quantidade) {
		this.quantidade = quantidade;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ItemPedido other = (ItemPedido) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

}
