package com.example.imple.salgrade.model;

import org.hibernate.validator.constraints.Range;

import com.example.standard.model.Modelable;

import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor(staticName = "of")
@NoArgsConstructor
@Builder
public class SalgradeDTO implements Modelable<Salgrade> {
	@NotNull
	@Range(min = 1, max = 10)
	Integer grade;
	
	@NotNull
	Integer losal;
	
	@NotNull
	Integer hisal;
	
	
	@Override
	public Salgrade getModel() {	
		return Salgrade.builder()
					   .grade(grade)
					   .losal(losal)
					   .hisal(hisal)
				       .build();
	}
}
