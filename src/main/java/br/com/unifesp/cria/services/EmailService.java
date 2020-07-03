package br.com.unifesp.cria.services;

import org.springframework.mail.SimpleMailMessage;

import br.com.unifesp.cria.domain.Usuario;
import br.com.unifesp.cria.domain.Pedido;

public interface EmailService {

	void sendOrderConfirmationEmail(Pedido obj);
	
	void sendEmail(SimpleMailMessage msg);
	
	void sendNewPasswordEmail(Usuario usuario, String newPass);
}
