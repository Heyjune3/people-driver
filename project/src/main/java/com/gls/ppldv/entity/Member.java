package com.gls.ppldv.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name="member")
@Getter
@Setter
@ToString
public class Member {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "uno")
	private Long id;
	
	@Column(name="uid", nullable = false)
	private String email;
	
	@Column(name="upw", nullable = false)
	private String password;
	
	@Column(name="phone", nullable = false)
	private String phoneNo;
	
	@Column(name="address", nullable = false)
	private String address;
	
	@Enumerated(EnumType.STRING)
	private Role role;
	
	@Enumerated(EnumType.STRING)
	private Gender gender;
}
