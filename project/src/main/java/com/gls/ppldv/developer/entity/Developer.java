package com.gls.ppldv.developer.entity;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.gls.ppldv.user.entity.Member;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * dno (작성프로필 식별자) - dno <br/>
 * title (프로필 제목) - developer_title <br/>
 * content (프로필 소개) - developer_content <br/>
 * skill (기술 스택) - developer_skill <br/>
 * tendency (FRONT, BACK, APP) <br/>
 * school (학력사항) - developer_school <br/>
 * member (회원 식별자) - uno <br/>
 * updateDate (프로필 수정 시간) - updatedate <br/>
 * viewCount (조회수) - viewcnt  <br/>
 * imgUrl (프로필 이미지) - image_url // img src 처리 <br/>
 * fileName (이미지 명) - image_name // uploadFile 처리
 */
@Entity
@Table(name = "developer")
@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Developer {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "dno")
	private Long dno;

	@Column(name = "developer_title", nullable = false)
	private String title;

	@Column(name = "developer_content", columnDefinition = "TEXT")
	private String content;

	@Column(name = "developer_skill", columnDefinition = "TEXT")
	private String skill;

	@Enumerated(EnumType.STRING)
	private Tendency tendency;

	@Column(name = "developer_school", columnDefinition = "TEXT")
	private String school;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "uno", referencedColumnName = "uno")
	private Member member;

	@Column(name = "updatedate")
	@Temporal(TemporalType.TIMESTAMP)
	private Date updateDate;

	@Column(name = "viewcnt")
	private Integer viewCount;

	@Column(name = "image_url", nullable = true)
	private String imgUrl;

	@Column(name = "image_name", nullable = true)
	private String fileName;
}
