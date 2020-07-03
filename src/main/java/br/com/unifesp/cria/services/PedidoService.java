package br.com.unifesp.cria.services;

import java.util.Date;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import br.com.unifesp.cria.domain.Usuario;
import br.com.unifesp.cria.domain.ItemPedido;
import br.com.unifesp.cria.domain.Pedido;
import br.com.unifesp.cria.domain.enums.EstadoEntrega;
import br.com.unifesp.cria.repositories.ItemPedidoRepository;
import br.com.unifesp.cria.repositories.PedidoRepository;
import br.com.unifesp.cria.security.UserSS;
import br.com.unifesp.cria.services.exceptions.AuthorizationException;
import br.com.unifesp.cria.services.exceptions.ObjectNotFoundException;

@Service
public class PedidoService {
	
	@Autowired
	private PedidoRepository repo;

	
	@Autowired
	private ProdutoService produtoService;
	
	@Autowired
	private UsuarioService usuarioService;
	
	@Autowired
	private EmailService emailService;
	
	public Pedido find(Integer id) {
		Optional<Pedido> obj = repo.findById(id);
		return obj.orElseThrow(() -> new ObjectNotFoundException(
				"Objeto não encontrado! Id: " + id + ", Tipo: " + Pedido.class.getName()));
	}
	
	public Pedido insert(Pedido obj) {
		obj.setId(null);
		obj.setInstante(new Date());
		obj.setUsuario(usuarioService.find(obj.getUsuario().getId()));
		obj = repo.save(obj);
//		obj.setEstado(EstadoEntrega.PENDENTE);
		obj = repo.save(obj);
		emailService.sendOrderConfirmationEmail(obj);
		return obj;
	}
	
	public Page<Pedido> findPage(Integer page, Integer linesPerPage, String orderBy, String direction) {
		UserSS user = UserService.authenticated();
		if (user == null) {
			throw new AuthorizationException("Acesso negado");
		}
		PageRequest pageRequest = PageRequest.of(page, linesPerPage, Direction.valueOf(direction), orderBy);
		Usuario usuario =  usuarioService.find(user.getId());
		return repo.findByUsuario(usuario, pageRequest);
	}
}
