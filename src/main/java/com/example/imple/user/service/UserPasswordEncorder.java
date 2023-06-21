package com.example.imple.user.service;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

//@Component   //일반 bean의 경우 component Ok || @Service -> BCryptPasswordEncoder로
@Slf4j
public class UserPasswordEncorder implements PasswordEncoder {

	@Override
	public String encode(CharSequence rawPassword) {
		return rawPassword.toString(); // 사용자가 입력한 암호를 스트링으로 변환해서 그대로 return하도록 but 여기서는 아직 암호화 하지 X
	}

	@Override
	public boolean matches(CharSequence rawPassword, String encodedPassword) {
		log.info("rawPassword = {}", rawPassword);
		log.info("encodedPassword = {}", encodedPassword);
		return encodedPassword.equals(encode(rawPassword));
	} //rqsPassword에는 사용자가 입력한 Password가 / encodedPassword에는 DB에서 조회해온 password 즉 (1234)encoded Password

}
