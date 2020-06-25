package com.kh.teaspoon.space.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teaspoon.space.model.dao.SpaceDao;
import com.kh.teaspoon.space.model.vo.Space;

@Service("scService")
public class SpaceServiceImpl {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private SpaceDao scDao;
	
	//공간대여 등록
	public int insertSpace(Space s) {
		
		return scDao.insertSpace(sqlSession, s);
	
	};
	
}
