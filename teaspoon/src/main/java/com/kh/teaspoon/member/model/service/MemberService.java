package com.kh.teaspoon.member.model.service;

import com.kh.teaspoon.member.model.vo.Member;

public interface MemberService {
	
	// 1. 로그인용 서비스
	Member loginMember(Member m);
	
	// 2. 회원가입용 서비스
	int insertMember(Member m);
}