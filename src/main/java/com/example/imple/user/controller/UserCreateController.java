package com.example.imple.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.imple.dept.mapper.DeptMapper;
import com.example.imple.dept.model.DeptDTO;
import com.example.imple.user.mapper.UserMapper;
import com.example.imple.user.model.UserDTO;
import com.example.standard.controller.CreateController;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/user")
@Slf4j
public class UserCreateController implements CreateController<UserDTO> {

	@Autowired
	UserMapper mapper;
	
	@Autowired
	BCryptPasswordEncoder encoder;
	
	@Override
	public void create(Model model, HttpServletRequest request) {
		log.info("GET create()...");
		var error = request.getParameter("error");
		if (error == null) {
			var session = request.getSession();
			session.removeAttribute("user");
			session.removeAttribute("binding");
		}
	}

	@Override
	public String create(@Valid UserDTO dto, BindingResult binding, Model model, HttpServletRequest request,
			RedirectAttributes attr) {
					
		var sesseion = request.getSession();
		sesseion.setAttribute("user", dto);
		sesseion.setAttribute("binding", binding);
		
		if(binding.hasErrors())
			return "redirect:/user/create?error";
		
		var user = dto.getModel();
		
		try {
			user.setPassword(encoder.encode(user.getPassword()));
			mapper.insertUser(user);
		} catch (DuplicateKeyException e) {
			binding.reject("duplicate key", "회원id가 중복됩니다.");
			return "redirect:/user/create?error";
		}
		return "redirect:/user/success?create";
	}
	
}
