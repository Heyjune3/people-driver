package com.gls.ppldv.developer.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.gls.ppldv.developer.dto.DeveloperDTO;
import com.gls.ppldv.developer.entity.Developer;

public interface DeveloperService {

	String register(DeveloperDTO developerDTO, MultipartFile file) throws Exception;

	/**
	 * 등록된 회원 no을 통해 등록된 게시물 찾아오기
	 * @param id
	 * @return - DEVELOPER
	 */
	List<Developer> searchDev(Long id);
	
	
	
}
