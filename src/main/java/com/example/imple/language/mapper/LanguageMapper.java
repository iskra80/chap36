package com.example.imple.language.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.imple.city.model.City;
import com.example.imple.country.model.Country;
import com.example.imple.language.model.Language;
import com.github.pagehelper.Page;

@Mapper
public interface LanguageMapper {
	
	int countAll();
	List<Language> selectAll();
	Country        selectCountry();
	List<Language> selectAllWithCountry();
	Page<Language> selectPage();
	Page<Language> selectPageWithCountry();	
	List<Language> selectByLanguage(String language);
	List<Language> selectByLanguageWithCountry(String language);
	List<Language> selectByCountryCode(String countryCode);
		
//	City           slelctCitys();
//	List<Language> selectAllWithCitys();
//	Page<Language> selectPageWithcitys();
//	List<Language> selectByLanguageWithCitys(String language);
	
	
}
