package com.example.imple.language.mapper;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.assertj.core.api.Assertions.*;

import java.io.IOException;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@SpringBootTest
public class LanguageMapperTest {
	
	@Autowired
	LanguageMapper languageMapper;
	
	@Autowired
	ObjectMapper objectMapper;
	
	@Test
	void countAll() {
		var cnt = languageMapper.countAll();
		assertThat(cnt).isEqualTo(984);
	}
	
	@Test
	void selectAll() throws IOException {
		var list = languageMapper.selectAll();
		assertThat(list.size()).isEqualTo(984);
	}
	
	@Test
	void selectAllWithCountry() {
		var list = languageMapper.selectAllWithCountry();
		assertThat(list.size()).isEqualTo(984);
		
		assertThat(list).allSatisfy(e->{
			assertThat(e.getCountry()).isNotNull();
		});
	}
	
	@Test
	void selectPage() {
		PageHelper.startPage(50, 5);
		var list = languageMapper.selectPage();
		System.out.println(list.size());
		assertThat(list.size()).isEqualTo(5);
		
//		var paging = PageInfo.of(list, 20);
//		System.out.println(paging);
//		paging.getTotal();
//		paging.getList();
//		paging.getPageNum();
//		paging.getSize();
//		paging.getStartRow();
//		paging.getEndRow();
//		paging.getPages();
//		paging.getPrePage();
//		paging.getNextPage();
//		paging.isIsFirstPage();
//		paging.isIsLastPage();
//		paging.isHasPreviousPage();
//		paging.isHasNextPage();
	
	}
	
	@Test
	void selectPageWithCountry() {
		PageHelper.startPage(1000, 5);
		var list = languageMapper.selectPageWithCountry();
		
		assertThat(list).allSatisfy(e->{
			assertThat(e.getCountry()).isNotNull();
		});
		
		var paging = PageInfo.of(list,10);
		
		assertThat(paging).satisfies(e-> {
			assertThat(e.getTotal()).isEqualTo(984);
			long pages = e.getTotal()/5 + (e.getTotal()%5!=0 ? 1:0);
			assertThat(e.getPages()).isEqualTo(pages);
		});
	}
	
	@Test
	void selectByLanguage() {
		var language = languageMapper.selectByLanguage("Korean");
		System.out.println(language);		
	}
	
	@Test
	void selelctByLanguageWithCountry( ) {
		var language = languageMapper.selectByLanguageWithCountry("Korean");
		System.out.println(language);
	}
	
	@Test
	void selectByCountryCode() {
		var list = languageMapper.selectByCountryCode("KOR");
		System.out.println(list);
		
	}
	
	
}
