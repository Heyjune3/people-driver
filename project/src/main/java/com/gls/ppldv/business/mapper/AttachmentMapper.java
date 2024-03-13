package com.gls.ppldv.business.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface AttachmentMapper {

	@Insert("INSERT INTO tbl_attach(fullName, bno) VALUES(#{fullName}, LAST_INSERT_ID())")
	void addAttach(String fullName) throws Exception;

	/**
	 * 첨부파일 목록 검색
	 */
	@Select("SELECT fullName FROM tbl_attach WHERE bno = #{bno}")
	List<String> getAttach(int bno)throws Exception;

	/**
	 * @param bno - 게시글 번호가 일치하는 첨부파일 삭제
	 */
	@Delete("DELETE FROM tbl_attach WHERE bno = #{bno}")
	void deleteAttach(int bno) throws Exception;
	
	// mybatis는 1밖에 전달 안됨 - Insert를 호출 할 수 없음
	// == 어노테이션을 쓰면 mybatis가 자동으로 map을 생성
	@Insert("INSERT INTO tbl_attach(fullName, bno) VALUES(#{fullName}, #{bno})")
	void replaceAttach(@Param("bno")int bno, @Param("fullName")String fullName) throws Exception;
	
	
}
