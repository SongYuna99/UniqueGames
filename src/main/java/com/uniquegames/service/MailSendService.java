package com.uniquegames.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

@Component
public class MailSendService {
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	private int authNumber;
	private String newPassword;
	
	public void makeRandomNumber() {
		
		Random r = new Random();
		int CheckNum = r.nextInt(888888) + 111111;
		System.out.println("checkNum="+ CheckNum);
		authNumber = CheckNum;
	}

	public String generateRandomCode() {
	    String characters = "abcdefghijklmnopqrstuvwxyz0123456789";
	    int length = 7;
	    String randomCode = "";

	    Random random = new Random();
	    for (int i = 0; i < length; i++) {
	        int index = random.nextInt(characters.length());
	        char randomChar = characters.charAt(index);
	        randomCode += randomChar;
	    }

	    return randomCode;
	}
	
	public String joinEmail(String email) {
		makeRandomNumber();
		String setFrom = "a01083529494@gmail.com";
        String toMail = email;
        String title = "회원가입 인증 이메일 입니다.";
        String content = 
                "홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + authNumber + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        mailSend(setFrom, toMail, title, content);
        return Integer.toString(authNumber);
	}
	
	public String newPassword(String email) {
		newPassword = generateRandomCode();
		String setFrom = "a01083529494@gmail.com";
        String toMail = email;
        String title = "유니크게임즈 임시 비밀번호입니다.";
        String content = 
                "<div align='center' style='border:1px solid black; font-family:verdana'>" +
                "<h3 style='color: blue;'>" + 
                "임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>" + 
                "<p>임시 비밀번호 : " + 
                newPassword + "</p></div>";
        
        mailSend(setFrom, toMail, title, content);
        return Integer.toString(authNumber);
	}
	
	public void mailSend(String setFrom, String toMail, String title, String content) {
		 
		MimeMessage message = mailSender.createMimeMessage();
		
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content,true);
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	
	}
	

}
