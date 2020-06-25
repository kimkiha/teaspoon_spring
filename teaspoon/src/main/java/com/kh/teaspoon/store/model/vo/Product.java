package com.kh.teaspoon.store.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Product {
	
	/* 상품 테이블 */
	private int productNo;			// 상품번호
	private String productName;		// 상품명
	private int supPrice;			// 공급가
	private int price;				// 가격
	private int stock;				// 재고
	private String status;			// 진열상태
	private int totalCount;			// 누적판매갯수
	private String productOrigin;	// 썸네일 원본명
	private String productChange;	// 썸네일 수정명
	private String productFilepath;	// 썸네일 파일경로
	private String productContents;	// 상품설명(summerNote)
	private String kind;			// 상품종류
	
	/* 상품상세 테이블 */
	private int detailNo;			// 상품상세번호 +상품번호,옵션코드
	
	/* 옵션코드 테이블 */
	private int optionNo;			// 옵션코드
	private int addPrice;			// 추가가격
	private String optionType1;		// 옵션타입1
	private String optiontype2;		// 옵션타입2
	
	/* 구매상품 테이블 */
	private int amount;				// 상품수량 +장바구니번호,상품상세번호
	
	/* 장바구니 테이블 */
	private int cartNo;				// 장바구니번호
	private Date madeDate;			// 생성일자
	
	/* 위시리스트 테이블 */
	private int userNo;				// 회원번호
	
	
	
}
