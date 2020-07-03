package br.com.unifesp.cria.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.unifesp.cria.domain.ItemPedido;
import br.com.unifesp.cria.domain.ItemPedidoPK;
import br.com.unifesp.cria.dto.ItemPedidoDTO;
import br.com.unifesp.cria.repositories.ItemPedidoRepository;
import br.com.unifesp.cria.services.exceptions.DataIntegrityException;

@Service
public class ItemPedidoService {

	@Autowired
	private ItemPedidoRepository repo;

	@RequestMapping("/item_pedido") 
	public ItemPedido find(ItemPedidoPK itemPedidoPK) {
		List<ItemPedido> obj = repo.findAllById((Iterable<Integer>) itemPedidoPK);
		return (ItemPedido) obj;
	}
	
	public ItemPedido insert(ItemPedido obj) {
		obj.setId(null);
		return repo.save(obj);
	}
	
	public ItemPedido update(ItemPedido obj) {
		ItemPedido newObj = find(obj.getId());
		updateData(newObj, obj);
		return repo.save(newObj);
	}
	
	public void delete(ItemPedidoPK id) {
		find(id);
		try {
			repo.deleteById(id);
		}
		catch (DataIntegrityViolationException e) {
			throw new DataIntegrityException("Não foi possível excluir ");
		}
	}
	
	public List<ItemPedido> findAll() {
		return repo.findAll();
	}
	
	public ItemPedido fromDTO(ItemPedidoDTO objDto) {
		return new ItemPedido(null, null, null, objDto.getId(), null, null, null, null, null, objDto.getNome(), null);
	}
	
	private void updateData(ItemPedido newObj, ItemPedido obj) {
		newObj.setNome(obj.getNome());
	}
}
