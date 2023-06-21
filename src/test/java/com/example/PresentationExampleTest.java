package com.example;

import java.util.ArrayList;
import java.util.Collections;

import org.junit.jupiter.api.Test;

public class PresentationExampleTest {

	 @Test
	 void order() {
		 var list = new ArrayList<String>();
		 list.add("손상수");
		 list.add("송동수");
		 list.add("송채현");
		 list.add("조금옥");
		 list.add("홍경영");
		 list.add("이효찬");
		 list.add("김은진");
		 list.add("김상혁");
		 list.add("이강욱");
		 list.add("박소정");
		 list.add("심은미");
		 list.add("유옥천");
		 list.add("정봉문");
		 list.add("한지영");
		 list.add("손진희");
		 list.add("박용호");
		 list.add("김청일");
		 
		 int n = (int)(Math.random()*5+3);
		 
		 for(int i=0; i<n;i++) {
			 Collections.shuffle(list);
			
		 }
		 
		 for(int i =0; i<list.size(); i++) {
			 System.out.printf("%d, %s/n", i+1, list.get(i));
		 }
	 }
}
