package com.kh.teaspoon.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.teaspoon.common.model.vo.Attachment;
import com.kh.teaspoon.common.model.vo.PageInfo;
import com.kh.teaspoon.member.model.vo.MemCoupon;
import com.kh.teaspoon.member.model.vo.Member;
import com.kh.teaspoon.member.model.vo.MemberDTO;
import com.kh.teaspoon.member.model.vo.MenToMen;
import com.kh.teaspoon.member.model.vo.MenToMenDTO;


@Repository("mDao")
public class MemberDao {
	
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}
	
	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMember", m);
	}

	public int idCheck(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("memberMapper.idCheck", userId);
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}
	
	public ArrayList<String> idCheckList(SqlSessionTemplate sqlSession, String email) {
		return (ArrayList)sqlSession.selectList("memberMapper.idCheckList", email);
	}
	
	public Member idCheck1(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.idCheck1", m);
	}

	public int temporary(SqlSessionTemplate sqlSession, Member userIdCheck) {
		return sqlSession.update("memberMapper.temporary", userIdCheck);
	}
	
	public MemberDTO selectMyPage(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.selectOne("memberMapper.selectMyPage", userNo);
		
	}

	public ArrayList<MemCoupon> selectListCoupon(SqlSessionTemplate sqlSession, int userNo) {
		//System.out.println(userNo);
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectListCoupon", userNo);
		
	}

	public int selectListCount(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.selectOne("memberMapper.selectListCount",userNo);
	}

	public ArrayList<MenToMen> selectMtmList(SqlSessionTemplate sqlSession, PageInfo pi, int userNo) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
	
		return  (ArrayList)sqlSession.selectList("memberMapper.selectMtmList",userNo,rowBounds);
		
	}

	public ArrayList<MenToMenDTO> selectMenToMen(SqlSessionTemplate sqlSession, int mno) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectMenToMen",mno);
	}

	public int insertMtm(SqlSessionTemplate sqlSession, MenToMen mtm) {
		
		return sqlSession.insert("memberMapper.insertMtm", mtm);
	}
	public int insertAttachment(SqlSessionTemplate sqlSession, Attachment at) {
		return sqlSession.insert("memberMapper.insertAttachment", at);
	}
}
	