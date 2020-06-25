package com.kh.teaspoon.store.model.service;

import java.util.ArrayList;

import com.kh.teaspoon.common.model.vo.PageInfo;
import com.kh.teaspoon.store.model.vo.Product;
import com.kh.teaspoon.store.model.vo.Review;

public interface StoreService {

	/* -------------------- 관리자 ----------------------- */
	
	// 1. 전체 상품 리스트 갯수 조회용 서비스
	int selectProductListCount();

	// 2. 전체 상품 리스트 조회용 서비스 
	ArrayList<Product> selectProductList(PageInfo pi);

	// 3. 상품 등록용 서비스
	int insertProduct(Product p);

	// 4. 수정폼 조회용 서비스
	Product selectProduct(int productNo);

	// 5. 상품 수정용 서비스
	int updateProduct(Product p);

	// 6. 상품 삭제용 서비스
	int deleteProduct(int productNo);

	// 7. 전체리뷰 갯수 조회용 서비스
	int selectReviewListCount();

	// 8. 전체 리뷰 조회용 서비스
	ArrayList<Review> selectReviewList(PageInfo pi);

	// 9.리뷰 상세보기용 서비스  
	Review selectReview(int reviewNo);

	// 10. 리뷰 삭제용 서비스
	int deleteReview(int reviewNo);
	

}
