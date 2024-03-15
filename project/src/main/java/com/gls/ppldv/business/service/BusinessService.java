package com.gls.ppldv.business.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gls.ppldv.business.dto.BusinessDTO;
import com.gls.ppldv.business.mapper.AttachmentMapper;
import com.gls.ppldv.business.mapper.BusinessMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BusinessService {
	
	private final BusinessMapper mapper;
	private final AttachmentMapper attachMapper;
	
	@Transactional
	public void regist(BusinessDTO dto) throws Exception{
		mapper.regist(dto);
		List<String> files = dto.getFiles();
		if(files != null && !files.isEmpty()) {
			for(String fullName : files) {
				attachMapper.addAttach(fullName);
			}
		}
	}

	public BusinessDTO readBusiness(int bno) throws Exception {
		BusinessDTO dto = mapper.readBusiness(bno);
		List<String> fileList = attachMapper.getAttach(bno);
		dto.setFiles(fileList);
		return dto;
	}

	

	
}
