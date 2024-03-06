package com.gls.ppldv.business.controller;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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

}
