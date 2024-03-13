package com.gls.ppldv.business.dto;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class BusinessDTO {

	private String title;
	
	private Integer payment;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date startDate;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date EndDate;
	
	private String content;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date applyDate;
	
	private Long uno;
	
	// 첨부된 파일 이름 리스트
	private List<String> files;
}
