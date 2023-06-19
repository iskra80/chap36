package com.example.imple.salgrade.controller;

import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.imple.salgrade.mapper.SalgradeMapper;
import com.example.imple.salgrade.model.SalgradeDTO;
import com.example.standard.controller.CreateController;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/salgrade")
public class SalgradeCreateController implements CreateController<SalgradeDTO> {

	@Autowired
	SalgradeMapper mapper;
	
	@Override
	public void create(Model model, HttpServletRequest request) {
		
		var error = request.getParameter("error");
		if (error==null) {
			var session = request.getSession();
			session.removeAttribute("salgrade");
			session.removeAttribute("binding");
		}
		
	}

	@Override
	public String create(@Valid SalgradeDTO dto, BindingResult binding, Model model, HttpServletRequest request,
			RedirectAttributes attr) {
		
		var session = request.getSession();
		session.setAttribute("salgrade", dto);
		session.setAttribute("binding", binding);
		
		if(binding.hasErrors()) {
			return "redirect:/salgrade/create?error";
		}
		
		var salgrade = dto.getModel();
		try {
			mapper.insertSalgrade(salgrade);		
		} catch (DuplicateKeyException e) {
			binding.reject("duplicate key", "입력하신 등급은 이미 있습니다.");
			return "redirect:/salgrade/create?error";
		}
		
		
		return "redirect:/salgrade/success?create";
	}
}
