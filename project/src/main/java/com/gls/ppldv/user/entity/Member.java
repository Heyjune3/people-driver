package com.gls.ppldv.user.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * id (회원 식별자) - uno <br/>
 * name (회원 이름) - uname <br/>
 * email (회원 아이디-이메일형식) - uid <br/>
 * password (회원 비밀번호) - upw <br/>
 * birth (회원 생년월일) - birth_date <br/>
 * phoneNo (회원 패스워드) - phone <br/>
 * pc5 (회원 우편번호) - postcode <br/>
 * address (회원 주소) - address <br/>
 * detail (상세 주소) - address_detail <br/>
 * role (BUSINESS,DEVELOPER) <br/>
 * gender (MALE,FEMALE) <br/>
 * bname (회사 명) - business_name <br/>
 * bpc5 (회사 우편번호) - business_postcode <br/>
 * baddress(회사 주소) - business_address <br/>
 * bdetail (회사 상세주소) - business_address_detail <br/>
 * bphone(회사 전화번호) - business_phone <br/>
 * imgUrl (프로필 이미지) - image_url <br/>
 * 
 * 
 * 지금은 필요없지만, 만약 필요하다면 회원 등록시간, 회원 수정시간, 회원 삭제시간 추가
 */
@Entity
@Table(name="member")
@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Member {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "uno")
	private Long id;
	
	@Column(name = "name", nullable = false)
	private String name;
	
	@Column(name="uid", nullable = false)
	private String email;
	
	@Column(name="upw", nullable = false)
	private String password;
	
	@Column(name="birth_date", nullable = false)
	private Date birth;
	
	@Column(name="phone", nullable = false)
	private String phoneNo;
	
	@Column(name="postcode", nullable = false)
	private int pc5;
	
	@Column(name="address", nullable = false)
	private String address;
	
	@Column(name="address_detail", nullable = false)
	private String detail;
	
	@Enumerated(EnumType.STRING)
	private Role role;
	
	@Enumerated(EnumType.STRING)
	private Gender gender;
	
	@Column(name="business_name", nullable=true)
	private String bname;
	
	@Column(name="business_postcode", nullable=true)
	private int bpc5;
	
	@Column(name="business_address", nullable=true)
	private String baddress;
	
	@Column(name="business_address_detail", nullable=true)
	private String bdetail;
	
	@Column(name="business_phone", nullable=true)
	private String bphone;
	
	@Column(name="image_url", nullable=true)
	private String imgUrl;
}
