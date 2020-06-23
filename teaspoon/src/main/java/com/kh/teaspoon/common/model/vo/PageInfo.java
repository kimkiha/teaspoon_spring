package com.kh.teaspoon.common.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
//@AllArgsConstructor
@ToString
public class PageInfo {
	private int listCount;	// 총 게시글 갯수
	private int currentPage;// 요청한페이지(현재페이지)
	private int startPage;	// 요청한 페이지에 보여질 페이징바의 시작수
	private int endPage;	// 요청한 페이지에 보여질 페이징바의 끝 수
	private int maxPage;	// 한 페이지에 보여질 페이징바 갯수
	private int pageLimit;	
	private int boardLimit;
	
	
	public PageInfo(int listCount, int currentPage, int startPage, int endPage, int maxPage, int pageLimit,
			int boardLimit) {
		super();
		this.listCount = listCount;
		this.currentPage = currentPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.maxPage = maxPage;
		this.pageLimit = pageLimit;
		this.boardLimit = boardLimit;
	}
	
	
	
	
}
