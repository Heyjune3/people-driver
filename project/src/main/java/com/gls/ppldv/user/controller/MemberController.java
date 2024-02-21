package com.gls.ppldv.user.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/user")
@RestController
public class MemberController {

	@PostMapping("/register")
	public ResponseEntity<String> register(){
		String message = "¼º°ø";
		return new ResponseEntity<>(message ,HttpStatus.OK);
	}
	
}
