package com.gls.ppldv.business.controller;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gls.ppldv.business.dto.BusinessDTO;
import com.gls.ppldv.business.service.BusinessService;

import lombok.RequiredArgsConstructor;

@RequestMapping("business")
@Controller
@RequiredArgsConstructor
public class ProjectController {

	private final BusinessService bs;
	
	@PostConstruct
	public void init() {

	}

	@GetMapping("/project")
	public String project(int bno, Model model) throws Exception {
		BusinessDTO bd = bs.readBusiness(bno);
		model.addAttribute("dto",bd);
		return "/business/project";
	}

	@GetMapping("/register")
	public String register() {
		return "/business/register";
	}
	
	@PostMapping("/register")
	public String register(
			BusinessDTO dto,
			Model model) throws Exception {
		System.out.println("uno : " +dto.getUno());
		model.addAttribute("dto",dto);
		bs.regist(dto);
		return "/main/home";
	}
	
	
}
