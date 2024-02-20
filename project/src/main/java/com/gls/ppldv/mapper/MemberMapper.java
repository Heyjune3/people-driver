package com.gls.ppldv.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.gls.ppldv.entity.Member;

public interface MemberMapper {

	/**
	 * 회원 조회
	 */
	@Select("SELECT * FROM member WHERE uno = #{id} ORDER BY uno DESC")
	List<Member> memberList(int id) throws Exception;
}
