package com.example.imple.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.imple.salgrade.mapper.SalgradeMapper;
import com.example.imple.user.mapper.UserMapper;
import com.example.standard.controller.DetailController;

import jakarta.servlet.http.HttpServletRequest;
import oracle.net.aso.m;

@Controller
@RequestMapping("/user")
public class UserDetailController implements DetailController<String> {

	@Autowired
	UserMapper mapper;

	@Override
	public String detail(String key, Model model, HttpServletRequest request) {
		
		var user = mapper.selectById(key);
		model.addAttribute("user", user);
		
		return "user/detail";
	}
}
