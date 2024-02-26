package com.gls.ppldv.user.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.gls.ppldv.user.entity.Member;

@Repository
public interface MemberRepository extends JpaRepository<Member, Long>{
	
	Member findByEmailAndPassword(String email, String password);
}
