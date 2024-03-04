package com.gls.ppldv.developer.entity;

import java.util.Date;

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
 * member (회원 식별자) <br/>
 * updateDate (프로필 수정 시간) - updatedate <br/>
 * viewCount (조회수) - viewcnt
 */
@Entity
@Table(name="developer")
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

    @Column(name = "developer_content")
    private String content;

    @Column(name = "developer_skill")
    private String skill;

    @Enumerated(EnumType.STRING)
    private Tendency tendency;

    @Column(name = "developer_school")
    private String school;

    @ManyToOne
    @JoinColumn(name="uno", referencedColumnName = "uno")
    private Member member;

    @Column(name = "updatedate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updateDate;

    @Column(name = "viewcnt")
    private Integer viewCount;
}
