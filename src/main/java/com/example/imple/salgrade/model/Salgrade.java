package com.example.imple.salgrade.model;

import jakarta.annotation.Nonnull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor(staticName = "of")
@NoArgsConstructor
@Builder
public class Salgrade {
	@Nonnull Integer grade;
			 Integer losal;
			 Integer hisal;
	
}
