package com.kh.teaspoon.store.model.service;

import java.util.ArrayList;

import com.kh.teaspoon.common.model.vo.PageInfo;
import com.kh.teaspoon.store.model.vo.Product;

public interface StoreService {

	/* -------------------- 관리자 ----------------------- */
	
	// 1. 전체 상품 리스트 갯수 조회용 서비스
	int selectProductListCount();

	// 2. 전체 상품 리스트 조회용 서비스 
	ArrayList<Product> selectProductList(PageInfo pi);

	// 3. 상품 등록용 서비스
	int insertProduct(Product p);
	

}
