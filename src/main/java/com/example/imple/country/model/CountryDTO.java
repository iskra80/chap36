package com.example.imple.country.model;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.Range;

import com.example.standard.model.Modelable;
import com.example.standard.util.Continent;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor(staticName = "of")
@NoArgsConstructor
@Builder
public class CountryDTO implements Modelable<Country>{
	
	@NotBlank
	@Length(max = 3)
 	String 	    code;
	
	@NotBlank
	@Length(max = 52)
	String 	    name;	
	
	@Length(max = 20)
	Continent 	continent;		
	
	@Length(max = 26)
	String 	    region;		
	
	@Range(min = 1, max = 999999999)
	Double 	    surfaceArea;	
	
	@Range(min = 1, max = 6)
	Integer 	indepYear;	
	
	@Range(min = 1, max = 99999999999L)	
	Long 		population;	
	
	@Range(min = 1, max = 999999999)
	Double 	    lifeExpectancy;						
	
	@Range(min = 1, max = 999999999)
	Double 	    gnp;
	
	@Range(min = 1, max = 999999999)
	Double 	    gnpOld;
	
	@Length(max = 45)
	String 	    localName;		
	
	@Length(max = 45)
	String 	    governmentForm;
	
	@Length(max = 60)
	String 	    headOfState;
	
	@Range(min = 1, max = 99999999999L)	
	Long 		capital;
	
	@Length(max = 2)
	String 	    code2;

	@Override
	public Country getModel() {
		
		return Country.builder()
					  .code(code)
					  .name(name)
					  .continent(continent)
					  .region(region)
					  .surfaceArea(surfaceArea)
					  .indepYear(indepYear)
					  .population(population)
					  .lifeExpectancy(lifeExpectancy)
					  .gnp(gnp)
					  .gnpOld(gnpOld)
					  .localName(localName)
					  .governmentForm(governmentForm)
					  .headOfState(headOfState)
					  .capital(capital)
					  .code2(code2)
					  .build();
	}
	}
