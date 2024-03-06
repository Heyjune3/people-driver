package com.gls.ppldv.developer.service;

import org.springframework.data.domain.Page;
import org.springframework.web.multipart.MultipartFile;

import com.gls.ppldv.common.util.Paging.Cri;
import com.gls.ppldv.common.util.Paging.PMaker;
import com.gls.ppldv.developer.dto.DeveloperDTO;
import com.gls.ppldv.developer.entity.Developer;

public interface DeveloperService {

	String register(DeveloperDTO developerDTO, MultipartFile file) throws Exception;

	/**
	 * 등록된 회원 no을 통해 등록된 게시물 찾아오기
	 * 
	 * @param id
	 * @return - DEVELOPER
	 */
	Page<Developer> searchDev(Long id, Cri cri);

	/**
	 * 등록된 회원 no를 통해 PageMaker 만들기
	 * 
	 * @param id  - 등록된 회원 no
	 * @param cri - Criteria
	 */
	PMaker getPageMaker(Long id, Cri cri) throws Exception;

}
