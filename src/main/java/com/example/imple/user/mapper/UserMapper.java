package com.example.imple.user.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.security.access.method.P;

import com.example.imple.user.model.User;

@Mapper
public interface UserMapper {
	
	@Select("""
			select *
			  from users
			 where id =#{id}
			""")
	User selectById(String id);  //for login
	
	@Insert("""
			insert into users
			values
				(#{id, jdbcType=VARCHAR}, #{password, jdbcType=VARCHAR}, #{role, jdbcType=VARCHAR})
			""")
	int insert(@Param("id")       String id,
			   @Param("password") String password,
			   @Param("role")     String role);
	
	@Insert("""
			insert into users
			values (
				#{u.id,       jdbcType=VARCHAR},
				#{u.password, jdbcType=VARCHAR},
				#{u.role,     jdbcType=VARCHAR}
			)
			""")
	int insertUser(@Param("u") User user);
}
