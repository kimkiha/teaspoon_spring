package com.kh.teaspoon.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teaspoon.board.model.dao.BoardDao;
import com.kh.teaspoon.board.model.vo.Board;
import com.kh.teaspoon.common.model.vo.PageInfo;

@Service("bService")
public class BoardServiceImpl implements BoardService{


	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private BoardDao bDao;
	
	
	@Override
	public int selectMagazineListCount() {
		return bDao.selectMagazineListCount(sqlSession);
	}
	@Override
	public ArrayList<Board> selectMagazineList(PageInfo pi) {
		return bDao.selectMagazineList(sqlSession, pi);
	}
	
	
}
