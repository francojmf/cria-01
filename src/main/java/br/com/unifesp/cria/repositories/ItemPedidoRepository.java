package br.com.unifesp.cria.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.com.unifesp.cria.domain.ItemPedido;
import br.com.unifesp.cria.domain.ItemPedidoPK;

@Repository
public interface ItemPedidoRepository extends JpaRepository<ItemPedido, Integer> {

	void deleteById(ItemPedidoPK id);
//	public ItemPedido insert(ItemPedido obj);
//	public ItemPedido find(ItemPedidoPK itemPedidoPK);
}
