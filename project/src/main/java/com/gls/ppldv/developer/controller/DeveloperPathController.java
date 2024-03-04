package com.gls.ppldv.developer.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("developer")
public class DeveloperPathController {

	@GetMapping("/register")
	public String register() {
		return "/developer/register";
	}
	
	@GetMapping("/profile")
	public String profile() {
		return "/developer/profile";
	}

}
