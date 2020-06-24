package com.kh.teaspoon.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teaspoon.admin.model.dao.AdminDao;
import com.kh.teaspoon.admin.model.vo.Grade;

@Service("adService")
public class AdminServiceImpl implements AdminService  {
	@Autowired
	public SqlSessionTemplate sqlSession;
	@Autowired
	private AdminDao adDao;
	
	@Override
	public ArrayList<Grade> selectGradeList() {
		return adDao.selectGradeList(sqlSession);
	}

}
