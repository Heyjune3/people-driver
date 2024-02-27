package com.gls.ppldv.main.controller;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	@PostConstruct
	public void init() {
		System.out.println("test");
	}
	
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
	
	@GetMapping("findPass")
	public String findPass() {
		return "/member/findPass";
	}
	
	@PostMapping("passAuth")
	public String passAuth(String email, HttpServletRequest request) {
		request.setAttribute("email", email);
		return "/member/passAuth";
	}
	
	@PostMapping("changePass")
	public String changePass(String email, HttpServletRequest request) {
		request.setAttribute("email", email);
		return "/member/changePass";
	}
	
}
