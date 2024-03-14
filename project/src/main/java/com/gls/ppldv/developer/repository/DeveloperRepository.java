package com.gls.ppldv.developer.repository;

import java.util.List;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.gls.ppldv.developer.entity.Developer;

@Repository
public interface DeveloperRepository extends JpaRepository<Developer, Long> {

	// 기존 데이터들만 불러오는 것
	/* List<Developer> findByMember(Member member); */

	// 전체 개인 회원이 작성한 프로필 개수 가져오는 메서드
	Integer countByMemberId(Long id);
	
	// 이름이 검색된 회원이 작성한 프로필 개수 가져오는 메서드
	Integer countByMemberNameContaining(String name);
	
	// 페이징 1(현재 유저만)
	Page<Developer> findByMemberId(Long id, Pageable pageable);

	// 페이징 2(전체 회원)
	Page<Developer> findAll(Pageable pageable);
	
	// 페이징 3 (검색된 이름 회원)
	Page<Developer> findByMemberNameContaining(String name, Pageable pageable);
	
	void deleteAllByMemberId(Long uno);

	List<Developer> findAllByMemberId(Long uno);

	/**
	 * 조회수 증가 로직
	 */
	@Modifying
	@Transactional
	@Query("UPDATE Developer SET viewcnt = viewcnt + 1 WHERE dno = :dno")
	void updateViewCount(@Param("dno") Long dno);
}
