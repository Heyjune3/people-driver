package com.gls.ppldv.user.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.gls.ppldv.user.entity.Member;

public interface MemberMapper {

	@Select("SELECT * FROM member ORDER BY uno DESC")
	public List<Member> memberList();
}
