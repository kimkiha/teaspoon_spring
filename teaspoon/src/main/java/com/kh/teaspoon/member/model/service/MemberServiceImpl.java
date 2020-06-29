package com.kh.teaspoon.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teaspoon.common.model.vo.PageInfo;
import com.kh.teaspoon.member.model.dao.MemberDao;
import com.kh.teaspoon.member.model.vo.MemCoupon;
import com.kh.teaspoon.member.model.vo.Member;
import com.kh.teaspoon.member.model.vo.MemberDTO;
import com.kh.teaspoon.member.model.vo.MenToMen;

@Service("mService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private MemberDao mDao;
	
	/*
	  @Inject MemberDAO memberdao; //dao를 사용하기 위해 의존성을 주입*/

	@Override
	public Member loginMember(Member m) {
		return mDao.loginMember(sqlSession,m);
	}

	@Override
	public int insertMember(Member m) {
		return mDao.insertMember(sqlSession, m);
	}
	
	@Override
	public int updateMember(Member m) {
		return mDao.updateMember(sqlSession, m);
	}

	@Override
	public int idCheck(String userId) {
		return mDao.idCheck(sqlSession, userId);
	}

	// 아이디찾기
	@Override
	public ArrayList<String> idCheckList(String email) {
		return mDao.idCheckList(sqlSession, email);
	}

	@Override
	public Member idCheck1(Member m) {
		return mDao.idCheck1(sqlSession, m);
	}

	@Override
	public int temporary(Member userIdCheck) {
		return mDao.temporary(sqlSession, userIdCheck);
	}

	public MemberDTO selectMyPage(int userNo) {
	
		return mDao.selectMyPage(sqlSession, userNo);
	}

	@Override
	public ArrayList<MemCoupon> selectListCoupon(int userNo) {
		//System.out.println(userNo);
		return mDao.selectListCoupon(sqlSession, userNo);
	}
	
	// qna용 페이징바 카운트
	@Override
	public int selectListCount(int userNo) {
		
		return mDao.selectListCount(sqlSession, userNo);
	}

	@Override
	public ArrayList<MenToMen> selectMtmList(PageInfo pi, int userNo) {
		
		return mDao.selectMtmList(sqlSession,pi, userNo);
	}

	@Override
	public MenToMen selectMenToMen(int mno) {
		
		return mDao.selectMenToMen(sqlSession,mno);
	}


}
