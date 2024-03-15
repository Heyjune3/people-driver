package com.gls.ppldv.business.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.gls.ppldv.business.dto.BusinessDTO;

public interface BusinessMapper {

	@Insert("INSERT INTO business(business_title,"
			+ "business_pay,business_startdate,business_enddate,"
			+ "business_content,business_applydate,uno,process,field)"
			+ "VALUES(#{title},#{payment},#{startDate},#{EndDate},"
			+ "#{content},#{applyDate},#{uno},#{process},#{field})")
	void regist(BusinessDTO dto) throws Exception;

	@Select("SELECT * FROM business WHERE bno = #{bno}")
	BusinessDTO readBusiness(int bno)throws Exception;
	
}
