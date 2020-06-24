package com.kh.teaspoon.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.teaspoon.admin.model.vo.Grade;

@Repository("adDao")
public class AdminDao {
	public ArrayList<Grade> selectGradeList(SqlSession sqlSession){
		return (ArrayList)sqlSession.selectList("adminMapper.selectGradeList");
	}
}
