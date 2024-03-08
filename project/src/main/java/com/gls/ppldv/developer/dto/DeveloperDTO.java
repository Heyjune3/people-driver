package com.gls.ppldv.developer.dto;

import java.util.List;

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
	private String imgUrl; 
	private String fileName; 
	
	
	private List<DCareer> dCareer;
	private List<DLicense> dLicense;

	// 파일 원상태로 되돌렸는지 수정 여부
	private boolean flag = false;
}
