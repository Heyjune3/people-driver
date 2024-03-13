package com.gls.ppldv.business.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.gls.ppldv.user.entity.Member;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "business")
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class BusinessEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "bno")
	private Long bno;
	
	@Column(name = "business_title", nullable = false)
	private String title;
	
	@Column(name = "business_pay", nullable = false)
	private Integer payment;
	
	@Column(name = "business_startdate", nullable = false)
	private Date startDate;
	
	@Column(name = "business_enddate", nullable = false)
	private Date EndDate;
	
	@Column(name = "business_content", columnDefinition = "TEXT")
	private String content;
	
	@Column(name = "business_applydate", nullable = false)
	private Date applyDate;
	
	@ManyToOne
	@JoinColumn(name = "uno", referencedColumnName = "uno")
    private Member member;
	
}
