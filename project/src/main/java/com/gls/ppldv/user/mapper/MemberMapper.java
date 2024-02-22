package com.gls.ppldv.user.mapper;

import org.apache.ibatis.annotations.Update;

public interface MemberMapper {

	@Update("UPDATE member SET image_url = '${imgUrl}' WHERE uno = LAST_INSERT_ID()")
	public int register(String imgUrl) throws Exception;
	
	
}
