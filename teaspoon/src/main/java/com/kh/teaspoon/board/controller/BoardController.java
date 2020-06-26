package com.kh.teaspoon.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.teaspoon.board.model.service.BoardService;
import com.kh.teaspoon.board.model.vo.Board;
import com.kh.teaspoon.common.model.vo.Attachment;
import com.kh.teaspoon.common.model.vo.PageInfo;
import com.kh.teaspoon.common.template.Pagination;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService bService;
	

	// 공유해서 쓸 수 있게끔 따로 정의해 놓은 메소드 
	// 전달받은 파일을 서버에 업로드시킨 후 수정명을 리턴하는 메소드
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		
		// 파일을 업로드 시킬 폴더 경로(String savePath)
		String resources = request.getSession().getServletContext().getRealPath("resources");
		//웹컨테이너의 resources의 물리적인 경로 알아내는 것		
	
		String savePath = resources + "\\uploadFiles\\";
		
		// 원본명(aaa.jpg)
		String originName = file.getOriginalFilename();
		
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
		} //
		// transferTo : 어떤 폴더에 어떤 이름으로 저장할지 지정하는 메소드
		
		return changeName;
		
	}
	

	// 전달받은 파일명을 가지고 서버로부터 삭제하는 메소드 
	public void deleteFile(String fileName, HttpServletRequest request) {
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources +"\\uploadFiles\\";
		
		File deleteFile = new File(savePath + fileName);
		deleteFile.delete();
	}

	
	
	@RequestMapping("about.bo")
	public String aboutTeaspoonView() {
		
		return "board/about_teaspoon";
	}
	
	@RequestMapping("magazineList.bo")
	public String magazineView(Model model, int currentPage) {
		
		int listCount = bService.selectMagazineListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 6, 10);
		
		ArrayList<Board> list = bService.selectMagazineList(pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "board/magazine";
	}
	
	@RequestMapping("magazineAdminList.bo")
	public String magazineAdminList(Model model, int currentPage) {
		
		int listCount = bService.selectMagazineListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Board> list = bService.selectMagazineList(pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "admin_board/admin_magazine";
	}
	
	@RequestMapping("magazineInsertForm.bo")
	public String magazineInsertForm() {
		return "admin_board/admin_magazineEnrollForm";
	}
	
	
	@RequestMapping("insertMagazine.bo")
	public String insertMagazine(Board b, @RequestParam(name="file1", required=false) MultipartFile file,
								 HttpServletRequest request, Attachment at, Model model) {
		
		int result = bService.insertMagazine(b);
		
		int result1 = 0;
		System.out.println(file.getOriginalFilename());
		//현재 넘어온 파일이 있을 경우 서버에 업로드 후 원본명, 수정명 뽑아서 r 주섬주섬 담기
		if(!file.getOriginalFilename().equals("")) {//넘어온 파일명이  빈 문자열이 아닐경우
		
			//서버에 파일 업로드 --> 공통모듈로써 메소드 따로 빼서 정의할 것 savaFile  --> 
			String changeName = saveFile(file, request);
			
			at.setOriginName(file.getOriginalFilename());
		    at.setChangeName(changeName);
		    at.setFilePath(request.getSession().getServletContext().getRealPath("resources") + "\\uploadFiles\\" + changeName);
		      
		      result1 = bService.insertAttachment(at);
		      
		}
		int result2 = result * result1;
		
		if (result2 > 0) { //등록 성공
			 return "redirect:magazineList.bo?currentPage=1";
			
		}else { //등록 실패
			model.addAttribute("msg", "게시글 등록 실패!!");
            return "common/errorPage";
		}
		
	}
	
	@RequestMapping("magazineUpdateForm.bo")
	public String updateMagazineForm(int boardNo, Model model) {
		
		Board b = bService.selectMagazine(boardNo);
		
		model.addAttribute("b", b);
		
		return "admin_board/admin_magazineUpdateForm";
			
	}
	
	@RequestMapping("updateMagazine.bo")
	public String updateMagazine(Board b, Model model) {
		
		int result = bService.updateMagazine(b);
		
		if(result>0) {
			 return "redirect:magazineList.bo?currentPage=1";
		}else {
			model.addAttribute("msg", "게시글 등록 실패!!");
            return "common/errorPage";
		}
		return "admin_board/admin_magazineUpdateForm";
			
	}
}
