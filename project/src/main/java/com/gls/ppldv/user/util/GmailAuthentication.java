package com.gls.ppldv.user.util;

import java.util.Properties;

import javax.annotation.PostConstruct;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

import lombok.Getter;


@Getter
@PropertySource("classpath:prop/gmail.properties") // 프로퍼티 가져오기
@Component
public class GmailAuthentication extends Authenticator {
	
	private PasswordAuthentication passwordAuthentication;
	
	@Value("${id}")
	private String id;
	@Value("${pw}")
	private String pw;
	
	@PostConstruct
	public void init() {
		passwordAuthentication = new PasswordAuthentication(id, pw);
	}
	
	public Properties getProp() {
		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", "587");
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.auth", "true");
		return prop;
	}
}
