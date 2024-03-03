package com.gls.ppldv.user.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.gls.ppldv.user.dto.EditDTO;
import com.gls.ppldv.user.entity.Member;

public interface MemberMapper {

	@Select("SELECT * FROM member WHERE uid=#{email}")
	public Member idCheck(String email) throws Exception;
	
	@Insert("INSERT INTO member (uname, uid, upw, birth_date, phone, postcode, address, address_detail, role, gender) VALUES (#{name}, #{email}, #{password}, #{birth}, #{phoneNo}, #{pc5}, #{address}, #{detail}, #{role}, #{gender})")
	public int register(Member member) throws Exception;
	
	/**
	 * 멤버 비밀번호 변경
	 */
	@Update("UPDATE member SET upw = #{password} WHERE uid = #{email}")
	public int changePass(Member member) throws Exception;
	
	/**
	 * 회원 정보 수정
	 */
	@Update("UPDATE member SET upw= #{password}, phone=#{phoneNo}, postcode=#{pc5}, address=#{address}, address_detail=#{detail}, business_name=#{bname}, business_postcode=#{bpc5}, business_address=#{baddress}, business_address_detail=#{bdetail}, business_phone=#{bphone}, image_url=#{imgUrl}, image_name=#{fileName} WHERE uid=#{email}")
	public int editProfile(EditDTO member) throws Exception;
}
