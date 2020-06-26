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

	/* -------------------- 사용자 ----------------------- */
	
	// 1. 커피상품 갯수 조회용 서비스 
	int selectCoffeeListCount();
	
	// 2. 커피상품 목록 조회용 서비스 
	ArrayList<Product> selectCoffeeList(PageInfo pi);

	// 3. 커피상품 상세조회용 서비스
	Product selectCoffee(int productNo);

	// 4. 베스트 상품 조회용 서비스
	ArrayList<Product> selectBest();

	// 5. 아이템 갯수 조회용 서비스
	int selectItemListCount();

	// 6. 해당페이지의 아이템 조회용 서비스
	ArrayList<Product> selectItemList(PageInfo pi);

	// 7. 아이템 상세조회용 서비스
	Product selectItem(int productNo);

	// 8. 로그인한 사용자의 위시리스트 목록 조회용 서비스
	ArrayList<Product> selectWish(int userNo);

	// 9. 위시리스트의 상품과 등록하려고 하는 상품이 일치하는지 확인하는 서비스
	int selectOneWishList(Product p);

	// 10. 위시리스트에 등록하는 서비스
	int insertWish(Product p);

	// 11. 위시리스트에서 삭제하는 서비스
	int deleteWish(Product p);

	

}
