package com.gls.ppldv.main.controller;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "main/home";
	}
	
	@GetMapping("register")
	public String logon() {
		return "/member/register";
	}
	
	@GetMapping("login")
	public String login() {
		return "/member/login";
	}
	
	@GetMapping("search")
	public String search() {
		return "/developer/search";
	}
	
	
}
