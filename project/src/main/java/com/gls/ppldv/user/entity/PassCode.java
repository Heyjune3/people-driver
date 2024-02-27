package com.gls.ppldv.user.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

/**
 * id - 발신한 이메일
 * code - 5자리의 랜덤한 숫자
 */
@Entity
@Getter
@Setter
@NoArgsConstructor
@Table(name="passwordCode")
public class PassCode {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long num;
	
	@Column
	private String email;
	
	@Column(length=5)
	private String code;
}
