package com.kh.teaspoon.member.controller;

import java.util.ArrayList;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.teaspoon.member.model.service.MailService;
import com.kh.teaspoon.member.model.service.MemberService;
import com.kh.teaspoon.member.model.vo.Member;

@Controller
public class MailController {

	@Autowired
	MailService ms;
	
	@Autowired // DI
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	@RequestMapping(value = "")
	public ModelAndView board2() {

		ModelAndView mv = new ModelAndView();
		int ran = new Random().nextInt(900000) + 100000;

		System.out.println(ran);
		// mv.setViewName("test/email");
		mv.addObject("random", ran);
		return mv;
	}

	@ResponseBody
	@RequestMapping(value = "createEmailCheck.do")
	public String createEmailCheck(@RequestParam String email, HttpServletRequest req) {

		System.out.println(email);
		
		// 이메일 인증
		int ran = new Random().nextInt(900000) + 100000;

		HttpSession session = req.getSession(true);
		String authCode = String.valueOf(ran);
		String subject = "teaspoon 회원가입 인증 코드 발급 안내 입니다.";
		StringBuilder sb = new StringBuilder();
		sb.append("귀하의 인증 코드는 " + authCode + "입니다.");

		session.setAttribute("authCode", authCode);

		System.out.println(authCode);

		if (ms.send(subject, sb.toString(), "khk7333@gmail.com", email, null)) {
			// 메일 발송 성공
			return authCode;
		} else {
			// 메일 발송 실패
			return "fail";
		}

	}
	
	//아이디찾기(완료)
	// 아이디찾기 이메일로 조회한 후 가입한 이력이있으면 회원메일로 아이디 전송
	@ResponseBody
	@RequestMapping(value = "emailCheck.me")
	public String emailCheck(@RequestParam String email, HttpServletRequest req) {

		System.out.println("아이디찾기 이메일 : " + email);
		
		ArrayList<String> nlist = mService.idCheckList(email);
		
		System.out.println("nlist : " + nlist );
		
		System.out.println("nlist : " + nlist.get(0) );
		
		if(!nlist.isEmpty()) {
			
			String idList = "";
			
			for(int i=0; i<nlist.size(); i++) {
				idList += nlist.get(i) + "\n";
			}
			
			// 이메일 인증

			HttpSession session = req.getSession(true);
			String subject = "teaspoon 아이디찾기 안내 입니다.";
			StringBuilder sb = new StringBuilder();
			sb.append("귀하의 아이디는 " + idList + "입니다.");


			if (ms.send(subject, sb.toString(), "khk7333@gmail.com", email, null)) {
				// 메일 발송 성공
				return idList;
			} else {
				// 메일 발송 실패
				return "fail";
			}
			
		}else {
			return "fail";
		}

	}
	
	//비밀번호찾기(완료)
	// 비밀번호찾기 아이디로 조회한 후 가입한 이력이있으면 회원메일로 임시비밀번호 전송
	@ResponseBody
	@RequestMapping(value = "idCheck1.me")
	public String idCheck1(Member m, HttpServletRequest req) {

		Member userIdCheck = mService.idCheck1(m);
		userIdCheck.setUserId(m.getUserId());
		System.out.println("비밀번호변경!! : " + userIdCheck);
		
		if(!userIdCheck.getUserId().equals("")) {
			
			// 이메일 인증
			int ran = new Random().nextInt(900000) + 100000;

			HttpSession session = req.getSession(true);
			String authCode = String.valueOf(ran);
			String subject = "teaspoon 아이디찾기 안내 입니다.";
			StringBuilder sb = new StringBuilder();
			sb.append("귀하의 임시비밀번호는 " + authCode + "입니다.");
			
			// 임시비밀번호로 변경
			String encPwd = bcryptPasswordEncoder.encode(authCode);
			userIdCheck.setUserPwd(encPwd); // 암호문으로 받아서 insert 요청
			
			int result = mService.temporary(userIdCheck);
			
			if (ms.send(subject, sb.toString(), "khk7333@gmail.com", userIdCheck.getEmail(), null)) {
				// 메일 발송 성공
				return "success";
			} else {
				// 메일 발송 실패
				return "fail";
			}
			
		}else
			return "fail";

	}

	@RequestMapping(value = "emailAuth.do")
	@ResponseBody
	public String emailAuth(@RequestParam String certified,String email, HttpSession session) {

		String authCode = (String) session.getAttribute("authCode");

		if (certified.equals(authCode)) {
			System.out.println("일치합니다.");
			
			String status = "Y";
			
			session.setAttribute("estatus", status);
			session.setAttribute("certified", certified);
			session.setAttribute("userId", email);
			
			session.setAttribute("insertEmail", email);
			
			
			/*
			 * return new ResponseEntity<String>("complete", HttpStatus.OK); return new
			 * ResponseEntity<String>("false", HttpStatus.OK);
			 */
			return "complete";
		} else {
			
	
			return "fail";
		}

	}

}
