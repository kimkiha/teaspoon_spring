package com.kh.teaspoon.space.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.teaspoon.space.model.vo.Space;

@Repository("scDao")
public class SpaceDao {

	//공간 대여 등록
	public int insertSpace(SqlSessionTemplate sqlSession, Space s) {
		
		return sqlSession.insert("spaceMapper.insertSpace", s);
	
	}
	
}
