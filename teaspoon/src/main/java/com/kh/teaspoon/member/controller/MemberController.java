package com.kh.teaspoon.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.teaspoon.member.model.service.MemberService;
import com.kh.teaspoon.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired // DI
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	// 로그인페이지
	@RequestMapping("loginPage.me")
	public String loginPage() {
		return "mypage/login";
	}
	
	// 로그인
	@RequestMapping("login.me")
	public ModelAndView login(Member m, HttpSession session, ModelAndView mv) {
		
		Member loginUser = mService.loginMember(m);
		
		System.out.println("객체 확인 : " + m);
		System.out.println("결과 확인 : "  + loginUser);
		
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
			session.setAttribute("loginUser", loginUser);

			if(loginUser.getUserId().equals("admin")) { // 관리자 아이디
				mv.setViewName("redirect:"); // 관리자 페이지 적는곳
			}else {
				mv.setViewName("redirect:/");
			}
			
		}else {
			mv.addObject("msg", "로그인실패!!").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	
	// 회원가입
	@RequestMapping("loginPage1.me")
	public String login1() {
		return "member/login";
	}
	
	// 회원정보변경
	@RequestMapping("loginPage2.me")
	public String login2() {
		return "member/login";
	}

	// 아디찾기
	@RequestMapping("loginPage3.me")
	public String login3() {
		return "member/login";
	}

	// 비밀번호찾기
	@RequestMapping("loginPage4.me")
	public String login4() {
		return "member/login";
	}
	
	// 배송지등록
	@RequestMapping("loginPage5.me")
	public String login5() {
		return "member/login";
	}
	
}
