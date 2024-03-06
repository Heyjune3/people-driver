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
	
	/**
	 * 등록된 게시물 dno를 받아와서 수정페이지 오픈
	 * @param dno - 등록된 게시물 dno
	 * @return - 등록된 게시물 정보
	 */
	DeveloperDTO searchDev(Long dno);

	/**
	 * 프로필 자기소개서 수정
	 * @param developerDTO
	 * @param file
	 * @return
	 */
	String edit(DeveloperDTO developerDTO, MultipartFile file) throws Exception;


}
