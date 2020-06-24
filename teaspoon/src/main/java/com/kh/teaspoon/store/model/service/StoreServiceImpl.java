package com.kh.teaspoon.store.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teaspoon.store.model.dao.StoreDao;

@Service("stService")
public class StoreServiceImpl {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private StoreDao stDao;
	
	

}
