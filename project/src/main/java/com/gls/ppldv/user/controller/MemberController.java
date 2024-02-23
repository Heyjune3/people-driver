package com.gls.ppldv.user.controller;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.gls.ppldv.user.entity.Member;
import com.gls.ppldv.user.service.MemberService;
import com.gls.ppldv.user.util.FileUtil;

import lombok.RequiredArgsConstructor;

@RequestMapping("/user")
@RestController
@RequiredArgsConstructor
public class MemberController {

	private final MemberService ms;
	
	// 회원가입 처리
	@PostMapping("/register")
	public ResponseEntity<String> register(
			//@RequestParam(required=false, name="file") MultipartHttpServletRequest request,
			MultipartFile file,
			Member member
	){
		String message = null;
		ResponseEntity<String> response = null;
		HttpHeaders headers = new HttpHeaders();
		// MultipartFile로 변환
		headers.add("Content-Type", "text/plain;charset=utf-8");
		if (file != null && !file.isEmpty()) {
			try {
				message = ms.register(member, file);
				response = new ResponseEntity<>(message, headers, HttpStatus.OK);
			}catch (IllegalArgumentException e) { 
				response = new ResponseEntity<>(e.getMessage(), headers, HttpStatus.OK);
			}catch (Exception e) {
				response = new ResponseEntity<>(e.getMessage(), headers, HttpStatus.BAD_REQUEST);
				e.printStackTrace();
			}
		} else {
			try {
				message = ms.register(member);
				response = new ResponseEntity<>(message, headers, HttpStatus.OK);
			} catch (IllegalArgumentException e) { 
				response = new ResponseEntity<>(e.getMessage(), headers, HttpStatus.OK);
			} catch (Exception e) {
				response = new ResponseEntity<>(e.getMessage(), headers, HttpStatus.BAD_REQUEST);
				e.printStackTrace();
			}
		}
		return response;
	}
	
}
