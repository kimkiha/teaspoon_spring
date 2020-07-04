package com.kh.teaspoon.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.teaspoon.common.model.vo.Attachment;
import com.kh.teaspoon.common.model.vo.PageInfo;
import com.kh.teaspoon.common.template.Pagination;
import com.kh.teaspoon.member.model.service.MemberService;
import com.kh.teaspoon.member.model.vo.MemCoupon;
import com.kh.teaspoon.member.model.vo.Member;
import com.kh.teaspoon.member.model.vo.MemberDTO;
import com.kh.teaspoon.member.model.vo.MenToMen;
import com.kh.teaspoon.member.model.vo.MenToMenDTO;

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
	
	
		//마이페이지용 조회 바
		@RequestMapping("main.me")
		public String selectInfoPage(HttpSession session, Model model) {
		
		    Member loginUser = (Member) session.getAttribute("loginUser");
		    //System.out.println(loginUser);
			MemberDTO m  = mService.selectMyPage(loginUser.getUserNo());
			
			model.addAttribute("m", m);
			
			
			return "mypage/mypageMain";
		}
		// 마이페이지 메인용 쿠폰조회용 
		
		//@ResponseBody
		@RequestMapping(value="clist.me")
		public void selectListCoupon(int userNo, ModelAndView mv, HttpServletResponse response) throws JsonIOException, IOException {
			//System.out.println(userNo);
			ArrayList<MemCoupon> list  = mService.selectListCoupon(userNo);
			//System.out.println(list);
			//return new GsonBuilder().setDateFormat("yyyy년MM월dd일").create().toJson(list);
			Gson gson = new Gson();
			response.setContentType("aplication/json; charset=utf-8");
			//406에러는 안쪽에 써주자
			gson.toJson(list, response.getWriter());
		}
		
		
				
		@RequestMapping("myqna.me")
		public String selectMyQna(HttpSession session, Model model , int currentPage) {
//			System.out.println(currentPage);
		    Member loginUser = (Member) session.getAttribute("loginUser");
//		    System.out.println(loginUser);
		    int listCount = mService.selectListCount(loginUser.getUserNo());
//		    System.out.println(listCount);
		    PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
			ArrayList<MenToMen> list = mService.selectMtmList(pi, loginUser.getUserNo());
			
			MemberDTO m  = mService.selectMyPage(loginUser.getUserNo());
			model.addAttribute("pi", pi);
			model.addAttribute("list",list);
			model.addAttribute("m", m);
//			System.out.println(m);
//			System.out.println(list);
//			System.out.println(pi);
			return "mypage/mypage_myqna";
		}
		
		@RequestMapping("myqnadetail.me")
		public String selectQnaDetail(HttpSession session, Model model,int mno) {
			System.out.println(mno);
			Member loginUser = (Member)session.getAttribute("loginUser");
			MemberDTO m  = mService.selectMyPage(loginUser.getUserNo());
		    //System.out.println(loginUser);
			ArrayList<MenToMenDTO> mtm  = mService.selectMenToMen(mno);
			
			System.out.println(mtm);
			model.addAttribute("mtm", mtm);
			model.addAttribute("m",m);
			
			return "mypage/mypage_qnaDetail";
		}
		
		
		@RequestMapping("qnaEnroll.me")
		public String goQnaEnroll() {
			return "mypage/mypage_qnaEnrollForm";
		}
		
		public String uploadFile(MultipartFile file, HttpServletRequest request) {
			// 파일을 업로드 시킬 폴더 경로(String savePath)
			String resources = request.getSession().getServletContext().getRealPath("resources");
			//웹컨테이너의 resources의 물리적인 경로 알아내는 것		

			String savePath = resources + "\\mtmUploadFiles\\";
			
			// 원본명(aaa.jpg)
			String originName = file.getOriginalFilename(); 
				//	File.getO;
			
			// 수정명(20200522202011.jpg 년월일시분초.기존의원본의확장자)
			// 년월일시분초 (String currentTime)
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			
			// 확장자(String ext)
			String ext = originName.substring(originName.lastIndexOf(".")); // ".jpg"
					//lastIndexOf : 원본명이름중에 . 이후 ~ 마지막 까지 선택
			String changeName = currentTime + (int)(Math.random()*1000)+1 + ext ;
			
			try {
				file.transferTo(new File(savePath + changeName));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			// transferTo : 어떤 폴더에 어떤 이름으로 저장할지 지정하는 메소드
			
			return changeName;
		}
		public void deleteFile(String fileName, HttpServletRequest request) {
			String resources = request.getSession().getServletContext().getRealPath("resources"); 
			String savePath = resources + "\\mtmUploadFiles\\";
			
			File deleteFile = new File(savePath + fileName);
			deleteFile.delete();
		}
		
		@ResponseBody
		@RequestMapping(value="insertQNA.me")
		public String insertMtm(MenToMen mtm, HttpServletRequest request,@RequestParam(name="uploadFile", required=false) MultipartFile[] file) {
			
			System.out.println(mtm);
			System.out.println(file.length);
			ArrayList<Attachment> attachList = new ArrayList<>();
			
			if(file.length>0) { // 첨부파일이 있을 때
				String resources = request.getSession().getServletContext().getRealPath("resources"); 
				String savePath = resources + "\\mtmUploadFiles\\";
				
				for(int i=0; i<file.length; i++) {
					Attachment at = new Attachment();
					 System.out.println(file[i].getOriginalFilename());
					at.setOriginName(file[i].getOriginalFilename());
					String changeName  = uploadFile(file[i],request);
					at.setChangeName(changeName);
					at.setFilePath(savePath + changeName);
					attachList.add(at);
				}
				
				 System.out.println(attachList);
				
				int result = mService.insertMtm(mtm);
				if(result>0) { // 게시글 등록 성공 --> 첨부파일 DB에 넣기
					int result2 =0;
					for(Attachment at: attachList) {
						result2 = mService.insertAttachment(at);
					}
					if(result2>0) { // 첨부파일 등록 성공
						return "success";
					}else { // 첨부파일 등록 실패
						return "attachFail";
					}
				}else { // 게시글 등록 실패 --> 첨부파일들 다시 지우기
					for(Attachment at: attachList) {
						deleteFile(at.getChangeName(), request);
					}
					return "insertFail";	
				}
				
			}else { // 첨부파일이 없을 때
				int result = mService.insertMtm(mtm);
				if(result>0) { // 게시글 등록 성공
					return "success";
				}else { // 게시글 등록 실패
					return "insertFail";
				}	
			}
			
		}

		
}
