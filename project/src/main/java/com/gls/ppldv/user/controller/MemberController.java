package com.gls.ppldv.user.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gls.ppldv.user.service.MemberService;

import lombok.RequiredArgsConstructor;

@RequestMapping("/user")
@RestController
@RequiredArgsConstructor
public class MemberController {

	private final MemberService ms;
	
	// 회원가입 처리
	@PostMapping("/register")
	public ResponseEntity<String> register(){
		// TODO 이제 프론트에서 ajax로 작업하고 보내줄 데이터 생각해보자
		String message = null;
		
		try {
			message = ms.register(null, null);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<>(message ,HttpStatus.OK);
	}
	
}
