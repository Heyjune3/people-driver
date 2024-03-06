package com.gls.ppldv.developer.repository;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.gls.ppldv.developer.entity.Developer;

@Repository
public interface DeveloperRepository extends JpaRepository<Developer, Long>{

	// 기존 데이터들만 불러오는 것
	/* List<Developer> findByMember(Member member); */
	
	// 전체 개인 회원이 작성한 프로필 개수 가져오는 메서드
	Integer countByMemberId(Long id);
	
	Page<Developer> findByMemberId(Long id, Pageable pageable);
}
