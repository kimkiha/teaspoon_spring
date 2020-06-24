package com.kh.teaspoon.store.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teaspoon.common.model.vo.PageInfo;
import com.kh.teaspoon.store.model.dao.StoreDao;
import com.kh.teaspoon.store.model.vo.Product;

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
	
	

}
