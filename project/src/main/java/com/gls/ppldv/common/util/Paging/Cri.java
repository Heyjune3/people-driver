package com.gls.ppldv.common.util.Paging;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

@Getter
@AllArgsConstructor
@ToString
public class Cri {

	private int page1; // 요청 한 페이지
	private int perPageNum1; // 한페이지에 보여줄 게시글 수

	public Cri() {
		this(1, 5);
	}

	public void setPage1(int page) {
		if (page <= 0) {
			this.page1 = 1;
			return;
		}
		this.page1 = page;
	}

	public void setPerPageNum1(int perPageNum) {
		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum1 = 10;
			return;
		}
		this.perPageNum1 = perPageNum;
	}

	// 게시굴 검색시에 limit를 활용
	// 시작 인덱스 , 게시물 수
	// limit startRow, perPageNum
	public int getStartRow() {
		return (this.page1 - 1) * perPageNum1;
	}
}
