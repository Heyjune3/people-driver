package com.gls.ppldv.developer.dto;

import com.gls.ppldv.developer.entity.DCareer;
import com.gls.ppldv.developer.entity.DLicense;
import com.gls.ppldv.developer.entity.Tendency;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class DeveloperDTO {
	
	private String title;
	private String content;
	private String skill;
	private Tendency tendency;
	private String school;
	private Long uno;
	
	private DCareer[] dCareer;
	private DLicense[] dLicense;
	
}
