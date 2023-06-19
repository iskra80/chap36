package com.example.imple.user.service;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class BCryptPasswordEncoderTest {

	BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	
	@Test
	void encode() {
		var encodeStr = encoder.encode("1234");
		System.out.println(encodeStr);
	}
	//$2a$10$YxXwI4s3DdSIC1QGBtp7v.VW/6k5juLvU8N6sodRU6mbOKQ5R5YyK
	//$2a$10$NxzmqUQea91tZ/w0pm79Ou6Z1P37ceqAsJOZ9WxrDlg40Yk9PoLx.
	
	@Test
	void matches() {
		var success = encoder.matches("1234", "$2a$10$NxzmqUQea91tZ/w0pm79Ou6Z1P37ceqAsJOZ9WxrDlg40Yk9PoLx.");
		System.out.println(success);
		assertThat(success).isEqualTo(true);
		
		success = encoder.matches("1234", "$2a$10$YxXwI4s3DdSIC1QGBtp7v.VW/6k5juLvU8N6sodRU6mbOKQ5R5YyK");
		System.out.println(success);
		assertThat(success).isEqualTo(true);
		
		success = encoder.matches("1234", "1234");
		System.out.println(success);
		assertThat(success).isEqualTo(false);
	}
	
	
	
}
