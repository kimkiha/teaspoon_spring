package com.kh.teaspoon.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.teaspoon.admin.model.vo.Grade;

@Repository("adDao")
public class AdminDao {
	public ArrayList<Grade> selectGradeList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("adminMapper.selectGradeList");
	}

	public int insertGrade(SqlSessionTemplate sqlSession, Grade grade) {
		return sqlSession.selectOne("adminMapper.insertGrade",grade);
	}
}
