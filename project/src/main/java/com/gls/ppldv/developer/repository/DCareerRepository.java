package com.gls.ppldv.developer.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.gls.ppldv.developer.entity.DCareer;
import com.gls.ppldv.developer.entity.Developer;

@Repository
public interface DCareerRepository extends JpaRepository<DCareer, Long> {

	// 프로필의 회원 dno에 맞춰서 DCareer 가져오기 (여러개가 있을 수 있음)
	List<DCareer> findByDeveloperDno(Long dno);
}
