package br.com.ammf.utils.email;

import java.util.Date;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.SendFailedException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import br.com.ammf.exception.EmailException;
import br.com.ammf.service.LogAplicacaoService;

public class Email {
		
	private boolean emailAtivado;
	private int SMTP;
	
	private LogAplicacaoService logAplicacaoService;
	
	public Email(boolean emailAtivado, boolean administrativo, LogAplicacaoService logAplicacaoService) {
		this.emailAtivado = emailAtivado;
		
		/*
		 * 0 = SMTP servidor Integrator
		 * 1 = SMTP servidor Google
		 */
		this.SMTP = administrativo ? 1 : 0;
		this.logAplicacaoService = logAplicacaoService;
	}	
		
	public void enviarEmail(
			String emailSender, 
			String emailSenderPassword, 
			String emailReceiver, 
			String assunto, 
			String mensagem) throws EmailException {		
		
		if (emailAtivado) {
			
			switch (SMTP) {
			
			case 0:				
				try{
					Properties props = null;
					Session session = null;
					
					props = System.getProperties();
					props.put("mail.smtp.host", "alcindomiguel.com.br");
					props.put("mail.smtp.port", "25");
					props.put("mail.smtp.auth", "true");
					session = Session.getInstance(props, new Autenticacao(emailSender, emailSenderPassword));
					
					MimeMessage message = new MimeMessage(session);
					message.setRecipient(Message.RecipientType.TO, new InternetAddress(emailReceiver));
					message.setFrom(new InternetAddress(emailSender));
					message.setSubject(assunto);
					message.setSentDate(new Date());
					message.setContent(mensagem,"text/html");
					
					Transport.send(message);				
				}
				catch (MessagingException e) {
					throw new EmailException(e.getMessage());
				}
				
				break;
				
			case 1:
				try {
					Properties properties = new java.util.Properties();
					properties.put("mail.smtp.host", "smtp.gmail.com");
					properties.put("mail.smtp.auth", "true");
					properties.put("mail.debug", "true");
					properties.put("mail.smtp.debug", "true");
					properties.put("mail.mime.charset", "ISO-8859-1");
					properties.put("mail.smtp.port", "465");
					properties.put("mail.smtp.starttls.enable", "true");
					properties.put("mail.smtp.socketFactory.port", "465");
					properties.put("mail.smtp.socketFactory.fallback", "false");
					properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
					properties.put("mail.smtp.quitwait", "false");
					properties.setProperty("mail.transport.protocol", "smtp");

					Session session = Session.getInstance(properties, new Autenticacao(emailSender, emailSenderPassword));

					MimeMessage msg = new MimeMessage(session);
					MimeBodyPart mbp1 = new MimeBodyPart();
					Multipart multipart = new MimeMultipart();

					msg.setFrom(new InternetAddress(emailSender));
					msg.setRecipient(Message.RecipientType.TO, new InternetAddress(emailReceiver));
					msg.setSubject(assunto);

					mbp1.setDataHandler(new DataHandler(mensagem, "text/html"));

					multipart.addBodyPart(mbp1);
					msg.setHeader("X-Mailer", "smtpsend");
					msg.setSentDate(new Date());
					msg.setContent(multipart);
					Transport.send(msg);

				} catch (AddressException e) {
					e.printStackTrace();
					throw new EmailException(e.getMessage());
				} catch (SendFailedException e) {
					e.printStackTrace();
					throw new EmailException(e.getMessage());
				} catch (MessagingException e) {
					e.printStackTrace();
					throw new EmailException(e.getMessage());
				}
				
				break;

			default:
				throw new EmailException("SMTP nao definido");
			}						
		}else {
			String mensagemErro = "Tentativa de envio de email com a configuração padrão de envio de email desligada.";
			logAplicacaoService.erro(mensagemErro);
			throw new EmailException(mensagemErro);
		}
	}		
}
