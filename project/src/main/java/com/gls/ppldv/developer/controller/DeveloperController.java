package com.gls.ppldv.developer.controller;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.gls.ppldv.developer.dto.DeveloperDTO;
import com.gls.ppldv.developer.service.DeveloperService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("developer")
@RequiredArgsConstructor
public class DeveloperController {

	private final DeveloperService ds;

	@PostMapping("/register")
	public ResponseEntity<String> registerDeveloper(@ModelAttribute DeveloperDTO developerDTO,
			@RequestPart(name = "file", required = false) MultipartFile file) throws Exception {
		// developerDTO와 file 객체를 사용하여 데이터 처리

		HttpHeaders headers = new HttpHeaders();
		// MultipartFile로 변환
		headers.add("Content-Type", "text/plain;charset=utf-8");

		String message = ds.register(developerDTO, file);

		ResponseEntity<String> response = null;

		if (message.equals("등록 성공")) {
			response = new ResponseEntity<>(message, headers, HttpStatus.OK);
		} else {
			response = new ResponseEntity<>(message, headers, HttpStatus.OK);
		}

		return response;
	}

}
