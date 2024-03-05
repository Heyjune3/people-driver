package com.gls.ppldv.developer.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.gls.ppldv.developer.entity.Developer;
import com.gls.ppldv.user.entity.Member;

@Repository
public interface DeveloperRepository extends JpaRepository<Developer, Long>{

	List<Developer> findByMember(Member member);
}
