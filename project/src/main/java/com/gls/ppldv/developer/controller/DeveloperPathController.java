package com.gls.ppldv.developer.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gls.ppldv.developer.entity.Developer;
import com.gls.ppldv.developer.service.DeveloperService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("developer")
@RequiredArgsConstructor
public class DeveloperPathController {

	private final DeveloperService ds;
	
	@GetMapping("/register")
	public String register() {
		
		return "/developer/register";
	}
	
	@GetMapping("/profile")
	public String profile(Long id, Model model) {
		List<Developer> dlist = null;
		dlist = ds.searchDev(id);
		
		model.addAttribute("developerList", dlist);
		
		return "/developer/profile";
	}

}
