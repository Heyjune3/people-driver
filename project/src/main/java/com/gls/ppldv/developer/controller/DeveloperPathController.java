package com.gls.ppldv.developer.controller;

import java.util.Collections;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gls.ppldv.common.util.Criteria;
import com.gls.ppldv.common.util.Paging.Cri;
import com.gls.ppldv.common.util.Paging.PMaker;
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
	public String profile(Long id, Cri cri, Model model) {

		Page<Developer> dlist = null;
		PMaker pm = null;

		try {
			pm = ds.getPageMaker(id, cri);
		} catch (Exception e) {
			e.printStackTrace();
		}

		dlist = ds.searchDev(id, cri);
		// Page 객체의 getContent는 List 형태로 바꿔 전송

		model.addAttribute("developerList", dlist.getContent());
		model.addAttribute("pm", pm);

		return "/developer/profile";
	}

	@GetMapping("/readPage")
	public String readPage() {
		return null;
	}

}
