package com.kh.teaspoon.admin.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teaspoon.admin.model.dao.AdminDao;

@Service("adService")
public class AdminServiceImpl implements AdminService  {
	@Autowired
	public SqlSessionTemplate sqlSession;
	@Autowired
	private AdminDao adDao;
	
	@Override
	public int memberList() {
		return 0;
	}

}
