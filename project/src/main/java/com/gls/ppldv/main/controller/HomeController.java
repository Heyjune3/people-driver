package com.gls.ppldv.main.controller;

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

	@GetMapping("search")
	public String search() {
		return "/business/search";
	}
	
	@GetMapping("searchD")
	public String searchD() {
		return "redirect:developer/search";
	}
	
	// 에러 처리
	@GetMapping("error_400")
	public String error400() {
		return "/error/error_400";
	}
	@GetMapping("error_403")
	public String error403() {
		return "/error/error_403";
	}
	@GetMapping("error_404")
	public String error404() {
		return "/error/error_404";
	}
	@GetMapping("error_405")
	public String error405() {
		return "/error/error_405";
	}
	
	
}
