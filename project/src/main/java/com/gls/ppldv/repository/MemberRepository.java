package com.gls.ppldv.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.gls.ppldv.entity.Member;

public interface MemberRepository extends JpaRepository<Member, Long>{
	public List<Member> findAll();
}
