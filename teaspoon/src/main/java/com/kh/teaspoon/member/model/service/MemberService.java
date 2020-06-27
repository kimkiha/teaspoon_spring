package com.kh.teaspoon.member.model.service;

import java.util.ArrayList;

import com.kh.teaspoon.common.model.vo.PageInfo;
import com.kh.teaspoon.member.model.vo.MemCoupon;
import com.kh.teaspoon.member.model.vo.Member;
import com.kh.teaspoon.member.model.vo.MemberDTO;
import com.kh.teaspoon.member.model.vo.MenToMen;

public interface MemberService {
	
	// 1. 로그인용 서비스
	Member loginMember(Member m);
	
	// 2. 회원가입용 서비스
	int insertMember(Member m);
	
	// 3. 회원정보변경
	int updateMember(Member m);
	
	// 4. 마이페이지 메인화면용 조회
	MemberDTO selectMyPage(int userNo);

	ArrayList<MemCoupon> selectListCoupon(int userNo);

	int selectListCount(int userNo);

	ArrayList<MenToMen> selectMtmList(PageInfo pi, int userNo);
}
