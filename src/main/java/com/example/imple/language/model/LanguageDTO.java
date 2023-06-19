package com.example.imple.language.model;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.Range;

import com.example.standard.util.IsOfficial;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor(staticName = "of")
@NoArgsConstructor
@Builder
public class LanguageDTO {
	
	@NotBlank
	@Length(max = 3)
	String     countryCode;
	
	@Length(max = 30)
	String     language;
	
	@Length(max = 1)
	IsOfficial isOfficial;
	
	@Range(min = 1, max = 999999999)
	Double     percentage;
}
