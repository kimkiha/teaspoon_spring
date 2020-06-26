package com.kh.teaspoon.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

	// 로그인페이지(완료)
	@RequestMapping("loginPage.me")
	public String loginPage() {
		return "mypage/login";
	}
	
	// 로그인(완료)
	@RequestMapping("login.me")
	public ModelAndView login(Member m, HttpSession session, ModelAndView mv) {
		
		Member loginUser = mService.loginMember(m);
		
		//System.out.println("객체 확인 : " + m);
		//System.out.println("결과 확인 : "  + loginUser);
		
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
			session.setAttribute("loginUser", loginUser);

			if(loginUser.getUserId().equals("admin")) { // 관리자 아이디
				mv.setViewName("admin/admin_main"); // 관리자 페이지 적는곳
			}else {
				mv.setViewName("redirect:/");
			}
			
		}else {
			mv.addObject("msg", "로그인실패!!").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	// 로그아웃기능(완료)
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	
	// 회원가입
	@RequestMapping("enroll.me")
	public String enroll() {
		return "mypage/mypageEnroll";
	}
	
	// 마이페이지
	@RequestMapping("mymain.me")
	public String myPage() {
		return "mypage/mypageMain";
	}
	
	// 회원정보변경페이지(완료)
	@RequestMapping("modifyPage.me")
	public String modifyPage() {
		return "mypage/mypageModify";
	}
	
	// 회원정보변경(완료)
	@RequestMapping("modify.me")
	public String modify(Member m, String firstnumber, int phonenum, String userId, Model model, HttpSession session) {
		
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		m.setUserPwd(encPwd);
		
		System.out.println("아이디 : " + userId);
		
		System.out.println("전화번호 1 : " + firstnumber);
		System.out.println("전화번호 2 : " + phonenum);
		
		String phone = firstnumber + phonenum;
		
		m.setPhone(phone);
		
		System.out.println("정보변경 객체 : " + m);
		
		int result = mService.updateMember(m);
		System.out.println("회원정보변경 성공여부 : " + result);
		
		if(result > 0) { // 회원정보 수정 성공 --> 마이페이지 요청
			
			session.setAttribute("loginUser", mService.loginMember(m));
			session.setAttribute("msg", "회원정보 수정 성공!");
			
			return "mypage/mypageModifyComplete"; //mymain.me
			
		}else {
			model.addAttribute("msg", "회원 정보 수정 실패!");
			return "common/errorPage";
		}
		
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
