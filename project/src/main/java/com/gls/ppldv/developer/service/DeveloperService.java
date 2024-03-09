package com.gls.ppldv.developer.service;

import org.springframework.data.domain.Page;
import org.springframework.web.multipart.MultipartFile;

import com.gls.ppldv.common.util.Criteria;
import com.gls.ppldv.common.util.PageMaker;
import com.gls.ppldv.common.util.Paging.Cri;
import com.gls.ppldv.common.util.Paging.PMaker;
import com.gls.ppldv.developer.dto.DeveloperDTO;
import com.gls.ppldv.developer.entity.Developer;
import com.gls.ppldv.user.entity.Member;

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
	 * 전체 회원 통해 등록된 게시물 찾아오기
	 * 
	 * @param id
	 * @return - DEVELOPER
	 */
	Page<Developer> searchDev2(Criteria cri);


	/**
	 * 등록된 회원 no를 통해 PageMaker 만들기
	 * 
	 * @param id  - 등록된 회원 no
	 * @param cri - Criteria
	 */
	PMaker getPageMaker(Long id, Cri cri) throws Exception;
	
	/**
	 * 등록된 회원 no를 통해 PageMaker 만들기
	 * 
	 * @param id  - 등록된 회원 no
	 * @param cri - Criteria
	 */
	PageMaker getPageMaker(Criteria cri) throws Exception;
	
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
	String edit(Long dno, DeveloperDTO developerDTO, MultipartFile file) throws Exception;
	
	/**
	 * 하나의 dno 삭제
	 * @param dno - 하나의 dno
	 * @return
	 */
	String remove(Long dno);

	/**
	 * uno가 생성해놓은 전체 dno 삭제
	 * @param uno - 유저 uno
	 * @return
	 */
	String removeAll(Long uno);

	
	/**
	 * 한번 만 쓰는 필요없는 서비스(developer에 해당하는 member 찾기)
	 * @param uno
	 * @return
	 */
	Member findName(Long uno);
}
