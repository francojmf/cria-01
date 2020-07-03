package br.com.unifesp.cria.services;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import br.com.unifesp.cria.domain.Categoria;
import br.com.unifesp.cria.domain.Cidade;
import br.com.unifesp.cria.domain.Usuario;
import br.com.unifesp.cria.domain.Endereco;
import br.com.unifesp.cria.domain.Estado;
import br.com.unifesp.cria.domain.ItemPedido;
import br.com.unifesp.cria.domain.Pedido;
import br.com.unifesp.cria.domain.Produto;
import br.com.unifesp.cria.domain.enums.EstadoEntrega;
import br.com.unifesp.cria.domain.enums.Perfil;
import br.com.unifesp.cria.domain.enums.TipoUsuario;
import br.com.unifesp.cria.repositories.CategoriaRepository;
import br.com.unifesp.cria.repositories.CidadeRepository;
import br.com.unifesp.cria.repositories.UsuarioRepository;
import br.com.unifesp.cria.repositories.EnderecoRepository;
import br.com.unifesp.cria.repositories.EstadoRepository;
import br.com.unifesp.cria.repositories.ItemPedidoRepository;
import br.com.unifesp.cria.repositories.PedidoRepository;
import br.com.unifesp.cria.repositories.ProdutoRepository;

@Service
public class DBService {

	@Autowired
	private BCryptPasswordEncoder pe;
	@Autowired
	private CategoriaRepository categoriaRepository;
	@Autowired
	private ProdutoRepository produtoRepository;
	@Autowired
	private EstadoRepository estadoRepository;
	@Autowired
	private CidadeRepository cidadeRepository;
	@Autowired
	private UsuarioRepository usuarioRepository;
	@Autowired
	private EnderecoRepository enderecoRepository;
	@Autowired
	private PedidoRepository pedidoRepository;
	@Autowired
	private ItemPedidoRepository itemPedidoRepository;

	
	public void instantiateTestDatabase() throws ParseException {
		
		Categoria cat1 = new Categoria(null, "CriaD");
		Categoria cat2 = new Categoria(null, "CriaE");
		
		Produto p1 = new Produto(null, "CRIA direita", null, null);
		Produto p2 = new Produto(null, "CRIA esquerda", null, null);
		
		cat1.getProdutos().addAll(Arrays.asList(p1));
		cat2.getProdutos().addAll(Arrays.asList(p2));
//		p1.getCategorias().addAll(Arrays.asList(cat1));
//		p2.getCategorias().addAll(Arrays.asList(cat2));
		
		categoriaRepository.saveAll(Arrays.asList(cat1, cat2));
		produtoRepository.saveAll(Arrays.asList(p1, p2));
		
		Estado est1 = new Estado(null, "São Paulo");
		Estado est2 = new Estado(null, "Minas Gerais");
		
		Cidade c1 = new Cidade(null, "Belo Horizonte", est2);

		Cidade c2 = new Cidade(null, "São José dos Campos", est1);
		Cidade c3 = new Cidade(null, "Jacareí", est1);
		
		est1.getCidades().addAll(Arrays.asList(c2, c3));
		est2.getCidades().addAll(Arrays.asList(c1));

		estadoRepository.saveAll(Arrays.asList(est1, est2));
		cidadeRepository.saveAll(Arrays.asList(c1, c2, c3));
		
		Usuario user1 = new Usuario(null, "UNFESP SJC", "unifesp@gmail.com", "96486444000158", TipoUsuario.PESSOAJURIDICA, pe.encode("123"));
		user1.getTelefones().addAll(Arrays.asList("1227363323", "1293838393"));
		user1.addPerfil(Perfil.ADMIN);
		
		Usuario user2 = new Usuario(null, "Maria Silva", "maria@gmail.com", "36378912377", TipoUsuario.PESSOAFISICA, pe.encode("123"));
		user2.getTelefones().addAll(Arrays.asList("3127363323", "3193838393"));
		
		
		Usuario user3 = new Usuario(null, "Joao Franco", "francojmf31@gmail.com", "31628382740", TipoUsuario.PESSOAFISICA, pe.encode("123"));
		user3.getTelefones().addAll(Arrays.asList("1293883321", "1234252625"));
		user3.addPerfil(Perfil.ADMIN);
		
		Endereco e1 = new Endereco(null, "Rua Flores", "300", "Apto 303", "Jardim", "12220834", user1, c2);
		Endereco e2 = new Endereco(null, "Avenida Matos", "105", "Sala 800", "Centro", "38777012", user2, c1);
		Endereco e3 = new Endereco(null, "Avenida Floriano", "2106", null, "Centro", "12377012", user3, c3);
		
		user1.getEnderecos().addAll(Arrays.asList(e1));
		user2.getEnderecos().addAll(Arrays.asList(e2));
		user2.getEnderecos().addAll(Arrays.asList(e3));
		
		usuarioRepository.saveAll(Arrays.asList(user1, user2, user3));
		enderecoRepository.saveAll(Arrays.asList(e1, e2, e3));
		
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm");
		
		Pedido ped1 = new Pedido(null, EstadoEntrega.PENDENTE, sdf.parse("30/09/2019 10:32"), user1, e1, null);
		ped1.setEnderecoDeEntrega(e1);
		Pedido ped2 = new Pedido(null, EstadoEntrega.PENDENTE, sdf.parse("30/09/2019 10:50"), user1, e1, null);
		ped1.setEnderecoDeEntrega(e1);
		
		Pedido ped3 = new Pedido(null, EstadoEntrega.PENDENTE, sdf.parse("30/09/2019 19:35"), user2, e2, null);
		ped2.setEnderecoDeEntrega(e2);

		Pedido ped4 = new Pedido(null, EstadoEntrega.PENDENTE, sdf.parse("10/10/2019 19:50"), user2, e2, null);
		ped3.setEnderecoDeEntrega(e2);	
		
		
ItemPedido ip1 = new ItemPedido(ped1, p2, "Andre", 36, 27, 33, 30, 14 ,25, "Emiplegia usa esquerda", 1);
ItemPedido ip2 = new ItemPedido(ped1, p1, "Gustavo", 38, 27, 33, 30, 16 ,27, "Emiplegia usa direita", 1);
ItemPedido ip3 = new ItemPedido(ped2, p1,  "Andriana", 36, 25, 30, 28, 14 ,25, "Paralisia da cintura para baixo",1);
ItemPedido ip4 = new ItemPedido(ped2, p2,  "Matheus", 37, 26, 31, 29, 15 ,26, "Paralisia cerebral, usa esquerda",1);
ItemPedido ip5 = new ItemPedido(ped3, p1, "Vinicius", 35, 24, 30, 27, 15 ,26, "Paralisia cerebral, usa direita",1);
ItemPedido ip6 = new ItemPedido(ped3, p2, "Vanessa", 35, 24, 30, 28, 15 ,26, "Amputação de pernas, canhoto",1);
ItemPedido ip7 = new ItemPedido(ped4, p2, "Maria", 35, 24, 29, 27, 13 ,24, "Emiplegia usa esquerda",1);
ItemPedido ip8 = new ItemPedido(ped4, p1, "Ricardo", 38, 27, 33, 29, 15 ,26, "Emiplegia usa direita",1);


//itemPedidoRepository.saveAll(Arrays.asList(ip1, ip2, ip3, ip4, ip5, ip6, ip7, ip8));

//ped1.getItens().addAll(Arrays.asList(ip1, ip2));
//ped2.getItens().addAll(Arrays.asList(ip3, ip4));
//ped3.getItens().addAll(Arrays.asList(ip5, ip6));
//ped4.getItens().addAll(Arrays.asList(ip7, ip8));		

//p1.getItens().addAll(Arrays.asList(ip2, ip3, ip5, ip8));
//p2.getItens().addAll(Arrays.asList(ip1, ip4, ip6, ip7));

	}
}
