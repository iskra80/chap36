package com.example.imple.user.model;

import java.util.List;

import org.hibernate.validator.constraints.Length;

import com.example.imple.emp.model.Emp;
import com.example.standard.model.Modelable;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@Data
@AllArgsConstructor(staticName = "of")
@NoArgsConstructor
@Builder
public class UserDTO implements Modelable<User>{
	
	@NotBlank
	@Length(min =5, max =  20)
	String id;
	
	@NotBlank
	@Length(min = 5, max = 100)
	String password;
	
	@Length(max = 20)
	String role;
			 
			 
			 
			@Override
			public User getModel() {
				
				return User.builder()
						   .id(id)
						   .password(password)
						   .role(role)
						   .build();
			}
}
