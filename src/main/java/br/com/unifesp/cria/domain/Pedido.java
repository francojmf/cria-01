package br.com.unifesp.cria.domain;

import java.io.Serializable;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import com.fasterxml.jackson.annotation.JsonFormat;
import br.com.unifesp.cria.domain.enums.EstadoEntrega;
import javax.persistence.OneToOne;
import com.fasterxml.jackson.annotation.JsonFormat;


@Entity
public class Pedido implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	private EstadoEntrega entrega;

	@JsonFormat(pattern="dd/MM/yyyy HH:mm")
	private Date instante;

	@ManyToOne
	@JoinColumn(name="usuario_id")
	private Usuario usuario;
	
	@ManyToOne
	@JoinColumn(name="endereco_de_entrega_id")
	private Endereco enderecoDeEntrega;
	
	@OneToMany(mappedBy="pedido")
	private List<ItemPedido> itens = new ArrayList<>();
	
	@Column(columnDefinition = "boolean default false") 
	private boolean aprovado;

	@JsonFormat(pattern="dd/MM/yyyy")
	private Date data_entrega;

	@JsonFormat(pattern="dd/MM/yyyy")
	private Date data_envio;


	public Pedido() {
	}


	public Pedido(Integer id, EstadoEntrega entrega, Date instante, Usuario usuario, Endereco enderecoDeEntrega,
			List<ItemPedido> itens) {
		super();
		this.id = id;
		this.entrega = entrega;
		this.instante = instante;
		this.usuario = usuario;
		this.enderecoDeEntrega = enderecoDeEntrega;
		this.itens = itens;
	}


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getInstante() {
		return instante;
	}

	public void setInstante(Date instante) {
		this.instante = instante;
	}


	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	
	private EstadoEntrega getEntrega() {
		return entrega;
	}

	private void setEntrega(EstadoEntrega entrega) {
		this.entrega = entrega;
	}

	public Endereco getEnderecoDeEntrega() {
		return enderecoDeEntrega;
	}

	public void setEnderecoDeEntrega(Endereco enderecoDeEntrega) {
		this.enderecoDeEntrega = enderecoDeEntrega;
	}
	
	private Date getData_entrega() {
		return data_entrega;
	}

	private void setData_entrega(Date data_entrega) {
		this.data_entrega = data_entrega;
	}

	private Date getData_envio() {
		return data_envio;
	}

	private void setData_envio(Date data_envio) {
		this.data_envio = data_envio;
	}

	public List<ItemPedido> getItens() {
		return itens;
	}

	public void setItens(List<ItemPedido> itens) {
		this.itens = itens;
	}
	
	private boolean isAprovado() {
		return aprovado;
	}

	private void setAprovado(boolean aprovado) {
		this.aprovado = aprovado;
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
		Pedido other = (Pedido) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
	
	@Override
	public String toString() {
		NumberFormat nf = NumberFormat.getCurrencyInstance(new Locale("pt", "BR"));
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		StringBuilder builder = new StringBuilder();
		builder.append("Pedido número: ");
		builder.append(getId());
		builder.append(", Instante: ");
		builder.append(sdf.format(getInstante()));
		builder.append(", Usuario: ");
		builder.append(getUsuario().getNome());
//		builder.append(", Situação da entrega: ");
//		builder.append(getEstado().getData());
		return builder.toString();
	}
}
