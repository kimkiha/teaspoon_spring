package com.kh.teaspoon.store.model.vo;

import java.sql.Date;

public class Review {
	
	/* 리뷰테이블 */
	private int reviewNo;			// 리뷰번호
	private int productNo;			// 상품번호
	private int userNo;				// 회원번호
	private String content;			// 내용
	private Date createDate;		// 작성일
	private String reviewOrigin;	// 리뷰사진 원본명
	private String reviewChange;	// 리뷰사진 수정명
	private String reviewFilepath;	// 리뷰사진 파일경로
	private int rating;				// 제품만족도
	private String reviewStatus;	// 상태값
	
	private String productName;		// 상품명
	private String userName;		// 회원명
	private String userId;			// 회원아이디

}
