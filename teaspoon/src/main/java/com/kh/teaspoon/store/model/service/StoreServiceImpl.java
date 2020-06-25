package com.kh.teaspoon.store.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teaspoon.common.model.vo.PageInfo;
import com.kh.teaspoon.store.model.dao.StoreDao;
import com.kh.teaspoon.store.model.vo.Product;
import com.kh.teaspoon.store.model.vo.Review;

@Service("stService")
public class StoreServiceImpl implements StoreService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private StoreDao stDao;

	@Override
	public int selectProductListCount() {
		return stDao.selectProductListCount(sqlSession);
	}

	@Override
	public ArrayList<Product> selectProductList(PageInfo pi) {
		return stDao.selectProductList(pi, sqlSession);
	}

	@Override
	public int insertProduct(Product p) {
		return stDao.insertProduct(p, sqlSession);
	}

	@Override
	public Product selectProduct(int productNo) {
		return stDao.selectProduct(productNo, sqlSession);
	}

	@Override
	public int updateProduct(Product p) {
		return stDao.updateProduct(p, sqlSession);
	}

	@Override
	public int deleteProduct(int productNo) {
		return stDao.deleteProduct(productNo, sqlSession);
	}

	@Override
	public int selectReviewListCount() {
		return stDao.selectReviewListCount(sqlSession);
	}

	@Override
	public ArrayList<Review> selectReviewList(PageInfo pi) {
		return stDao.selectReviewList(sqlSession, pi);
	}

	@Override
	public Review selectReview(int reviewNo) {
		return stDao.selectReview(sqlSession, reviewNo);
	}

	@Override
	public int deleteReview(int reviewNo) {
		return stDao.deleteReview(sqlSession, reviewNo);
	}
	
	

}
