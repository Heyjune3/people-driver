package com.gls.ppldv.user.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.gls.ppldv.user.entity.Member;

public interface MemberMapper {

	@Select("SELECT * FROM member WHERE uid=#{email}")
	public Member idCheck(String email) throws Exception;
	
	@Insert("INSERT INTO member (uname, uid, upw, birth_date, phone, postcode, address, address_detail, role, gender) VALUES (#{name}, #{email}, #{password}, #{birth}, #{phoneNo}, #{pc5}, #{address}, #{detail}, #{role}, #{gender})")
	public int register(Member member) throws Exception;
	
}
