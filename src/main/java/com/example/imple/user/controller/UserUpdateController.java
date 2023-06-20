package com.example.imple.user.controller;

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
import com.example.imple.user.mapper.UserMapper;
import com.example.imple.user.model.UserDTO;
import com.example.standard.controller.CreateController;
import com.example.standard.controller.UpdateController;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import oracle.net.aso.m;

@Controller
@RequestMapping("/user")
public class UserUpdateController implements UpdateController<UserDTO> {
	
	@Autowired
	UserMapper mapper;
		
	@Override
	public void update(Model model, HttpServletRequest request) {
		var error = request.getParameter("error");
		if(Objects.isNull(error)) {
			var session = request.getSession();
			session.removeAttribute("user");
			session.removeAttribute("binding");		
		}
		
		var id = request.getParameter("id");
		if(Objects.nonNull(id)) {
			var key = String.valueOf(id);
			var user= mapper.selectById(key);
			model.addAttribute("user", user);
		}
	}

	@Override
	public String update(@Valid UserDTO dto, BindingResult binding, Model model, HttpServletRequest request,
			RedirectAttributes attr) {
		
		var session = request.getSession();
		session.setAttribute("user", dto);
		session.setAttribute("binding", binding);
		

		
		if(binding.hasErrors()) {		
			return "redirect:/user/update?error";
		}
		
		var user =  dto.getModel();
		
		try {
			mapper.updateUser(user);
		} catch (DataIntegrityViolationException e) {
			binding.rejectValue("id","9999", "입력한 id는 없습니다.");
			return "redirect:/user/update?error";
		}
				
		return "redirect:/user/success?update";
	}

	
}
