package com.example.imple.user.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.imple.user.model.User;



@Mapper
public interface UserMapper {
	
	
	@Select("select * from users")
	List<User> selectAll();
		
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
	
	
	@Update("""
			update users
			   set password = #{password, jdbcType=VARCHAR},
				   role     = #{role,     jdbcType=VARCHAR}
		     where id = #{id}
			""")

	int update (@Param("id")       String id,
			    @Param("password") String password,
			    @Param("role")     String role);
	
	@Update("""
			update users
			  set password = #{password, jdbcType=VARCHAR},
				   role    = #{role,     jdbcType=VARCHAR}
			 where id = #{id}
			""")
	int updateUser(@Param("u") User user);
	
}
