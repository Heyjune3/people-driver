package com.project.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.project.project.entity.Member;

public interface MemberRepository extends JpaRepository<Member, Long>{
	List<Member> findAllByUno(Long uno);
}
