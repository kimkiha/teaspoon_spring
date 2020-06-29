package com.kh.teaspoon.member.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.teaspoon.member.model.service.MemberService;
import com.kh.teaspoon.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired // DI
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Inject    //서비스를 호출하기 위해서 의존성을 주입
	JavaMailSender mailSender;     //메일 서비스를 사용하기 위해 의존성을 주입함.
	MemberService memberservice;
	
	// 로그인페이지(완료)
	@RequestMapping("loginPage.me")
	public String loginPage() {
		return "mypage/login";
	}
	
	// 로그인(완료)
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
	
	// 로그아웃기능(완료)
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	// 회원가입페이지(완료)
	@RequestMapping("enrollForm.me")
	public String enroll() {
		return "mypage/mypageEnroll";
	}
	
	// 회원가입(완료)
	@RequestMapping("memberEnrollForm.me")
	public String insertMember(Member m, String firstnumber, String phonenum, String userPwd1, Model model, HttpSession session) {
		
		System.out.println("화악인 : " + m);
		
		String email = (String)session.getAttribute("insertEmail");
		System.out.println("email : " + email);
		
		m.setEmail(email);
		
		String phone = firstnumber + phonenum;
		m.setPhone(phone);
		
		System.out.println("화악인2 : " + m);
		
		String encPwd = bcryptPasswordEncoder.encode(userPwd1);
		m.setUserPwd(encPwd); // 암호문으로 받아서 insert 요청
		
		System.out.println("화악인3 : " + m);
		
		int result = mService.insertMember(m);
		
		if(result > 0) { // 회원가입성공
			
			session.setAttribute("msg", "회원가입 성공!");
			return "redirect:/";
			
		}else {	// 회원가입실패
			
			model.addAttribute("msg", "회원가입 실패");
			return "common/errorPage";
		}
	
	}
	
	// 아이디 중복체크
	@ResponseBody
	@RequestMapping(value="idCheck.me")
	public String idCheck(String userId) {
		
		System.out.println("ajax 아이디 : " + userId);
		
		int count = mService.idCheck(userId);
		
		System.out.println(count);
		
		if(count > 0) { // 중복된 아이디있음!! => 사용불가능!!
			System.out.println("fail");
			return "fail";
		}else { // 중복된 아이디가 없음!! => 사용가능!!
			System.out.println("success");
			return "success";
		}
		
	}
	

	// 마이페이지(완료)
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
	
	// 아디찾기페이지(완료)
	@RequestMapping("mypageIdSearch.me")
	public String mypageIdSearch() {
		return "mypage/mypageIdSearch";
	}

	// 비밀번호찾기페이지(완료)
	@RequestMapping("mypagePwdSearch.me")
	public String mypagePwdSearch() {
		return "mypage/mypagePwdSearch";
	}
	
	// 비밀번호찾기
	@RequestMapping("PwdSearch.me")
	public String PwdSearch() {
		return "mypage/mypagePwdSearch";
	}
	
	
	
	// 배송지등록
	@RequestMapping("loginPage5.me")
	public String login5() {
		return "mypage/login";
	}
	
	// 소셜로그인
	
}
