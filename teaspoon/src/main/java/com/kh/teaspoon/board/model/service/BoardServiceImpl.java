package com.kh.teaspoon.board.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teaspoon.board.model.dao.BoardDao;

@Service("bService")
public class BoardServiceImpl implements BoardService{


	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private BoardDao bDao;
}
