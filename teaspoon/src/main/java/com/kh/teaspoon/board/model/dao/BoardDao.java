package com.kh.teaspoon.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.teaspoon.board.model.vo.Board;
import com.kh.teaspoon.common.model.vo.Attachment;
import com.kh.teaspoon.common.model.vo.PageInfo;

@Repository("bDao")
public class BoardDao {
	
	public int selectMagazineListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectMagazineListCount");
	}

	public ArrayList<Board> selectMagazineList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.selectMagazineList", null, rowBounds);
		
	}
	
	public int insertMagazine(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertMagazine", b);
	}
	
	public int insertAttachment(SqlSessionTemplate sqlSession, Attachment at) {
		return sqlSession.insert("boardMapper.insertAttachment", at);
	}
}
