/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;

import java.util.Date;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import JavaBean.LoginBean;

/**
 *
 * @author OEM
 */
public class Mailer {
    public void SendConfirmationMail(String toMail,String FullName,String UserName,String PasswordHashed,String UserType){
       /*
            Java klasa za slanje aktivacionog maila koristeni smtp server i bez unosenja sifre i korisnickom imena
            Koriscena su tri jar fajla mail.jar,smtp.jar,activation.jar, jer su njihove klase neophodne
            */
          try{
            LoginBean loginBean=new LoginBean();
            
            String host ="smtp.gmail.com" ;
            String user = "nikola9371@gmail.com";
            String pass = "fontana93";
            String to = toMail;
            String from = "nikola9371@gmail.com";
            String subject = "Potvrdi mejl, kliknite na link ispod da bi ste potvrdi Vasu registraciju.";
            String messageText = "<a href=http://localhost:8080/Projekat_Java/RegisterServlet?FullName="+FullName+"&UserName="+UserName+"&Password="+PasswordHashed+"&Email="+toMail+"&UserType="+UserType+">Kliknite ovde da bi potvrdili nalog</a>";
            boolean sessionDebug = false;

            Properties props = System.getProperties();

            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", host);
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.required", "true");

            java.security.Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
            Session mailSession = Session.getDefaultInstance(props, null);
            mailSession.setDebug(sessionDebug);
            Message msg = new MimeMessage(mailSession);
            msg.setFrom(new InternetAddress(from));
            InternetAddress[] address = {new InternetAddress(to)};
            msg.setRecipients(Message.RecipientType.TO, address);
            msg.setSubject(subject); msg.setSentDate(new Date());
            msg.setContent(messageText,"text/html");

           Transport transport=mailSession.getTransport("smtp");
           transport.connect(host, user, pass);
           transport.sendMessage(msg, msg.getAllRecipients());
           transport.close();
           
        }catch(Exception ex)
        {
            System.out.println(ex);
        }
        
    }
    public void MailRecoveryMail(String toMail){
                  try{
            LoginBean loginBean=new LoginBean();
            
            String host ="smtp.gmail.com" ;
            String user = "nikola9371@gmail.com";
            String pass = "fontana93";
            String to = toMail;
            String from = "nikola9371@gmail.com";
            String subject = "Potvrdi mejl promene lozinke.";
            String messageText = "<p>Lozinka je uspesno promenenjena</p><br>"
                    + "<p>Sledite link ispod da bi ste se ulogovali sa novom lozinkom</p><br>"
                    + "<a href=http://localhost:8080/Projekat_Java/index.jsp>Pocetna strana</a>";
            boolean sessionDebug = false;

            Properties props = System.getProperties();

            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", host);
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.required", "true");

            java.security.Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
            Session mailSession = Session.getDefaultInstance(props, null);
            mailSession.setDebug(sessionDebug);
            Message msg = new MimeMessage(mailSession);
            msg.setFrom(new InternetAddress(from));
            InternetAddress[] address = {new InternetAddress(to)};
            msg.setRecipients(Message.RecipientType.TO, address);
            msg.setSubject(subject); msg.setSentDate(new Date());
            msg.setContent(messageText,"text/html");

           Transport transport=mailSession.getTransport("smtp");
           transport.connect(host, user, pass);
           transport.sendMessage(msg, msg.getAllRecipients());
           transport.close();
           
        }catch(Exception ex)
        {
            System.out.println(ex);
        }
        
    }
    public void MailAppartmentPaid(String toMail){
        try{
            
            String host ="smtp.gmail.com" ;
            String user = "nikola9371@gmail.com";
            String pass = "fontana93";
            String to = toMail;
            String from = "nikola9371@gmail.com";
            String subject = "Potvrda uplate.";
            String messageText = "<p>Uspesno ste uplatili rezervaciju</p><br>";
            boolean sessionDebug = false;

            Properties props = System.getProperties();

            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", host);
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.required", "true");

            java.security.Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
            Session mailSession = Session.getDefaultInstance(props, null);
            mailSession.setDebug(sessionDebug);
            Message msg = new MimeMessage(mailSession);
            msg.setFrom(new InternetAddress(from));
            InternetAddress[] address = {new InternetAddress(to)};
            msg.setRecipients(Message.RecipientType.TO, address);
            msg.setSubject(subject); msg.setSentDate(new Date());
            msg.setContent(messageText,"text/html");

           Transport transport=mailSession.getTransport("smtp");
           transport.connect(host, user, pass);
           transport.sendMessage(msg, msg.getAllRecipients());
           transport.close();
           
        }catch(Exception ex)
        {
            System.out.println(ex);
        }
    }
}
