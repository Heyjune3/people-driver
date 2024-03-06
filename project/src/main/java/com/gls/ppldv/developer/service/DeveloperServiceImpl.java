package com.gls.ppldv.developer.service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.gls.ppldv.common.util.FileUtil;
import com.gls.ppldv.common.util.Paging.Cri;
import com.gls.ppldv.common.util.Paging.PMaker;
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
	public String register(DeveloperDTO developerDTO, MultipartFile file) throws Exception {

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
		developer.setViewCount(0);

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
		if (developerDTO.getDCareer() != null && !developerDTO.getDCareer().isEmpty()) {
			for (DCareer career : developerDTO.getDCareer()) {
				if (career.getJobName() != null && !career.getJobName().isEmpty()
						|| career.getJobPeriod() != null && !career.getJobPeriod().isEmpty()
						|| career.getJobResponsibilities() != null && !career.getJobResponsibilities().isEmpty()) {
					career.setDeveloper(savedDeveloper);
					dcr.save(career);
				}
				
			}
		}

		// DLicense 엔티티 저장 (여러개의 데이터를 검사할 때, 꼭 리스트 안에 들어있는 데이터도 검사 필수)
		if (developerDTO.getDLicense() != null && !developerDTO.getDLicense().isEmpty()) {
			for (DLicense license : developerDTO.getDLicense()) {
				if (license.getLicenseName() != null && !license.getLicenseName().isEmpty()
						|| license.getAcquisitionDate() != null && !license.getAcquisitionDate().isEmpty()) {
					license.setDeveloper(savedDeveloper);
					dlr.save(license);
				}
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
	@Transactional
	public Page<Developer> searchDev(Long id, Cri cri) {
		// 페이징 처리 된 게시물 개수 받아오기 (jpa)
		Page<Developer> dlist = null;
		// 아직 JPA의 Query 어노테이션에 대해 배우지 않아서
		/* Pageable pageable = PageRequest.of(pageNumber, 5); */
		Sort sort = Sort.by(Sort.Direction.DESC, "dno");

		// 회원 id와 cri를 받아서 페이징 처리에 사용
		Pageable pageable = PageRequest.of(cri.getPage() - 1, cri.getPerPageNum(), sort);
		dlist = dr.findByMemberId(mr.findById(id).get().getId(), pageable);
		return dlist;
	}

	@Override
	public PMaker getPageMaker(Long id, Cri cri) throws Exception {
		// 전체 게시물 개수
		int totalCount = dr.countByMemberId(mr.findById(id).get().getId());

		PMaker pm = new PMaker(cri, totalCount);
		return pm;
	}
	
	@Override
	public DeveloperDTO searchDev(Long dno) {
		Developer developer = dr.findById(dno).get();
		List<DCareer> dcar = dcr.findByDeveloperDno(dno);
		List<DLicense> dlic = dlr.findByDeveloperDno(dno);
		
		DeveloperDTO developerDTO = new DeveloperDTO();
		developerDTO.setTitle(developer.getTitle());
		developerDTO.setContent(developer.getContent());
		developerDTO.setSkill(developer.getSkill());
		developerDTO.setSchool(developer.getSchool());
		developerDTO.setTendency(developer.getTendency());
		developerDTO.setImgUrl(developer.getImgUrl());
		developerDTO.setFileName(developer.getFileName());
		
		developerDTO.setDCareer(dcar);
		developerDTO.setDLicense(dlic);
		
		return developerDTO;
	}

	@Override
	public String edit(DeveloperDTO developerDTO, MultipartFile file) throws Exception {
		String message = "수정 실패";
		
		// 수정 부분 로직 구현중

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
		developer.setViewCount(0);

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
		if (developerDTO.getDCareer() != null && !developerDTO.getDCareer().isEmpty()) {
			for (DCareer career : developerDTO.getDCareer()) {
				if (career.getJobName() != null && !career.getJobName().isEmpty()
						|| career.getJobPeriod() != null && !career.getJobPeriod().isEmpty()
						|| career.getJobResponsibilities() != null && !career.getJobResponsibilities().isEmpty()) {
					career.setDeveloper(savedDeveloper);
					dcr.save(career);
				}
				
			}
		}

		// DLicense 엔티티 저장 (여러개의 데이터를 검사할 때, 꼭 리스트 안에 들어있는 데이터도 검사 필수)
		if (developerDTO.getDLicense() != null && !developerDTO.getDLicense().isEmpty()) {
			for (DLicense license : developerDTO.getDLicense()) {
				if (license.getLicenseName() != null && !license.getLicenseName().isEmpty()
						|| license.getAcquisitionDate() != null && !license.getAcquisitionDate().isEmpty()) {
					license.setDeveloper(savedDeveloper);
					dlr.save(license);
				}
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

}
