package com.example.imple.country.controller;

import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.imple.city.mapper.CityMapper;
import com.example.imple.city.model.CityDTO;
import com.example.imple.country.mapper.CountryMapper;
import com.example.imple.country.model.CountryDTO;
import com.example.standard.controller.CreateController;
import com.example.standard.controller.UpdateController;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import oracle.net.aso.m;

@Controller
@RequestMapping("/country")
public class CountryUpdateController implements UpdateController<CountryDTO> {
	
	@Autowired
	CountryMapper mapper;
		
	@Override
	public void update(Model model, HttpServletRequest request) {
		var error = request.getParameter("error");
		if(Objects.isNull(error)) {
			var session = request.getSession();
			session.removeAttribute("country");
			session.removeAttribute("binding");
			
			}
		var id = request.getParameter("id");
		if(Objects.nonNull(id)) {
			var key = Integer.parseInt(id);
			var city= mapper.selectById(key);
			model.addAttribute("city", city);
		}
		

	}

	@Override
	public String update(@Valid CityDTO dto, BindingResult binding, Model model, HttpServletRequest request,
			RedirectAttributes attr) {
		
		var session = request.getSession();
		session.setAttribute("city", dto);
		session.setAttribute("binding", binding);
		
		var countryCode = dto.getCountryCode().trim();
		
		if(!countryCode.equals(""))
			if(countryCode.length() !=3) {
				binding.rejectValue("countryCode","9999", "3자리로 입력하세요");
			}
		
		if(binding.hasErrors()) {
			
			return "redirect:/city/update?error";
		}
		
		var city =  dto.getModel();
		
		try {
			mapper.updateCity(city);			
		} catch (DataIntegrityViolationException e) {
			binding.reject("foreign","입력한 국가코드는 없습니다.");
			return "redirect:/city/update?error";
		}
				
		return "redirect:/city/success?update";
	}

	
}
