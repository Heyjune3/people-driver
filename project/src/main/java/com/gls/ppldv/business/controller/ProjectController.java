package com.gls.ppldv.business.controller;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gls.ppldv.business.dto.BusinessDTO;

@RequestMapping("business")
@Controller
public class ProjectController {

	@PostConstruct
	public void init() {

	}

	@GetMapping("/project")
	public String project() {
		return "/business/project";
	}

	@GetMapping("/register")
	public String register() {
		return "/business/register";
	}
	
	@PostMapping("/register")
	public String register(BusinessDTO dto, Model model) {
		
		System.out.println("dto :" + dto);
		
		return "/main/home";
	}
}
