package com.kh.teaspoon.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.teaspoon.member.model.vo.MemCoupon;
import com.kh.teaspoon.member.model.vo.Member;
import com.kh.teaspoon.member.model.vo.MemberDTO;


@Repository("mDao")
public class MemberDao {
	
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}
	
	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMember", m);
	}

	public MemberDTO selectMyPage(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.selectOne("memberMapper.selectMyPage", userNo);
	}

	public ArrayList<MemCoupon> selectListCoupon(SqlSessionTemplate sqlSession, int userNo) {
		//System.out.println(userNo);
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectListCoupon", userNo);
		
	}
}
	