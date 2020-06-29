package com.kh.teaspoon.member.model.service;

import java.util.ArrayList;

import com.kh.teaspoon.member.model.vo.Member;

public interface MemberService {
	
	// 1. 로그인용 서비스
	Member loginMember(Member m);
	
	// 2. 회원가입용 서비스
	int insertMember(Member m);
	
	// 3. 회원정보변경
	int updateMember(Member m);

	// 4. 아이디 중복체크용 서비스 (AJAX)
	int idCheck(String userId);

	ArrayList<String> idCheckList(String email);

	Member idCheck1(Member m);

	int temporary(Member userIdCheck);
}
