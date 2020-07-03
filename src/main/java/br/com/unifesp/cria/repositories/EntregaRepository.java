package br.com.unifesp.cria.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.com.unifesp.cria.domain.Entrega;

@Repository
public interface EntregaRepository extends JpaRepository<Entrega, Integer> {

}
