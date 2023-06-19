package com.example.imple.user.mapper;

import static org.assertj.core.api.Assertions.assertThat;

import java.io.IOException;

import org.apache.ibatis.annotations.Mapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.transaction.annotation.Transactional;

@SpringBootTest
public class UserMapperTest {

	@Autowired
	UserMapper userMapper;
	
	@Test
	void selectById() {
		
		var user = userMapper.selectById("python");
		System.out.println(user);
		assertThat(user).isNotNull();
		
		user = userMapper.selectById("xxx");
		System.out.println(user);
		assertThat(user).isNull();
	}
	
	@Test
	@Transactional
	void insert() {
		
		userMapper.insert("android", "1234", "USER");
		System.out.println(userMapper.selectById("android"));
		
		userMapper.insert("oracle", "1234", null);
		System.out.println(userMapper.selectById("oracle"));
		
		try {
			userMapper.insert("android", "12345", "ADMIN");	
		} catch (DuplicateKeyException e) {
			System.out.println("입력하신 id는 사용할 수 없습니다.");
		}
		
		try {
			userMapper.insert("spring", null, null);		
		} catch (DataIntegrityViolationException e) {
			System.out.println(e.getMessage());
		}
				
	}
	
	@Test
	@Transactional
	void update() {
		int cnt = userMapper.update("oracle", "12346", "user");
		assertThat(cnt).isEqualTo(1);
		
		
//		try {
//		userMapper.insert("oracle", null, null);
//		} catch (DataIntegrityViolationException e) {
//			System.out.println(e.getMessage());
//		}
	}

}
