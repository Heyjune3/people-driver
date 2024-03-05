package com.gls.ppldv.developer.service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.gls.ppldv.common.util.FileUtil;
import com.gls.ppldv.developer.dto.DeveloperDTO;
import com.gls.ppldv.developer.entity.DCareer;
import com.gls.ppldv.developer.entity.DLicense;
import com.gls.ppldv.developer.entity.Developer;
import com.gls.ppldv.developer.repository.DCareerRepository;
import com.gls.ppldv.developer.repository.DLicenseRepository;
import com.gls.ppldv.developer.repository.DeveloperRepository;
import com.gls.ppldv.user.entity.Member;
import com.gls.ppldv.user.repository.MemberRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class DeveloperServiceImpl implements DeveloperService {

	private final DeveloperRepository dr;
	private final DCareerRepository dcr;
	private final DLicenseRepository dlr;
	private final MemberRepository mr;
	
	private final FileUtil fu;
	
	@Transactional
	public String register(DeveloperDTO developerDTO, MultipartFile file) throws Exception{
		
		String message = "등록 실패";
		
		// DeveloperDTO에서 Developer 엔티티로 변환
		Developer developer = new Developer();
		developer.setTitle(developerDTO.getTitle());
	    developer.setContent(developerDTO.getContent());
	    developer.setSkill(developerDTO.getSkill());
	    developer.setTendency(developerDTO.getTendency());
	    developer.setSchool(developerDTO.getSchool());
	    Optional<Member> memberOptional = mr.findById(developerDTO.getUno());
	    developer.setMember(memberOptional.get());
	    developer.setUpdateDate(new Date());
		
	    String imgUrl = null;
	    String fileName = null;
	    
		if (file != null && !file.isEmpty()) {
			// 이미지 파일 처리
		    imgUrl = fu.uploadFile(file);
		    if (imgUrl == null) {
		    	message = "네트워크 문제로 이미지가 저장되지 않았습니다. 잠시 후 다시 시도해주세요.";
		    	return message;
		    }
		    fileName = fu.savedFileName(imgUrl);
		    developer.setImgUrl(imgUrl);
		    developer.setFileName(fileName);
		    
		}
		
	    // Developer Entity 저장
	    Developer savedDeveloper = dr.save(developer);
		
	    // DCareer 엔티티 저장
	    if (developerDTO.getDCareer() != null) {
	    	for (DCareer career : developerDTO.getDCareer()) {
	    		career.setDeveloper(savedDeveloper);
	    		dcr.save(career);
	    	}
	    }
	    
	    // DLicense 엔티티 저장
	    if (developerDTO.getDLicense() != null) {
	    	for (DLicense license : developerDTO.getDLicense()) {
	    		license.setDeveloper(savedDeveloper);
	    		dlr.save(license);
	    	}
	    }
	    
	    if (savedDeveloper != null) {
	    	message = "등록 성공";
	    } else {
	    	fu.deleteFile(fileName);
	    	return message;
	    }
	    
		return message;
	}

	@Override
	public List<Developer> searchDev(Long id) {
		List<Developer> dlist = null;
		dlist = dr.findByMember(mr.findById(id).get());
		return dlist;
	}

	
}
