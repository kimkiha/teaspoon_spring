package com.kh.teaspoon.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teaspoon.member.model.dao.MemberDao;
import com.kh.teaspoon.member.model.vo.Member;

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
		return 0;
	}

}