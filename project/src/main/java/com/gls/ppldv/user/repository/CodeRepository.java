package com.gls.ppldv.user.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.gls.ppldv.user.entity.PassCode;

public interface CodeRepository extends JpaRepository<PassCode, Long> {

	/**
	 * id와 code가 일치하는지 확인
	 *
	 * @param passCode - 객체
	 * @return - 일치하면 반환
	 */
	PassCode findByEmailAndCode(String email, String code);
}
