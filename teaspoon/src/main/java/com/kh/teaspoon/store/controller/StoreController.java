package com.kh.teaspoon.store.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.teaspoon.common.model.vo.PageInfo;
import com.kh.teaspoon.common.template.Pagination;
import com.kh.teaspoon.member.model.vo.Member;
import com.kh.teaspoon.store.model.service.StoreService;
import com.kh.teaspoon.store.model.vo.Product;
import com.kh.teaspoon.store.model.vo.Review;

@Controller
public class StoreController {

	@Autowired
	private StoreService stService;
	
	/* 전달받은 파일을 서버에 업로드시킨 후 수정명을 리턴하는 메소드 */
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
		}
		// transferTo : 어떤 폴더에 어떤 이름으로 저장할지 지정하는 메소드
		
		return changeName;
		
	}
	
	// 전달받은 파일명을 가지고 서버로부터 삭제하는 메소드 
	public void deleteFile(String fileName, HttpServletRequest request) {
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources +"\\uploadFiles\\";
		
		File deleteFile = new File(savePath + fileName); 
		deleteFile.delete();
	};
		

	//-----------------------------------------------------------------------------------------------------
	
	/* -------------------- 관리자 ----------------------- */
	
	/* 상품관리 */
	@RequestMapping("list.st")
	public String selectProductList(int currentPage, Model model) {
		int listCount = stService.selectProductListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		
		ArrayList<Product> list = stService.selectProductList(pi);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "admin_storeAndReview/admin_store";
	}
	
	@RequestMapping("enroll.st")
	public String productEnrollForm() {
		return "admin_storeAndReview/admin_storeEnrollForm";
	}
	
	@RequestMapping("insert.st")
	public String insertProduct(Product p, @RequestParam(name="thumb", required=true) MultipartFile file, 
								HttpServletRequest request) {
		
		if(!file.getOriginalFilename().equals("")) {
			String changeName = saveFile(file, request);
			p.setProductOrigin(file.getOriginalFilename());
			p.setProductChange(changeName);
			p.setProductFilepath(request.getSession().getServletContext().getRealPath("resources") + "\\uploadFiles\\" + changeName);
		}
		
		//System.out.println(p);
		
		int result = stService.insertProduct(p);
		
		if(result>0) {
			return "redirect:list.st?currentPage=1";
		} else {
			return "common/errorPage_admin";
		}
	}
	
	@RequestMapping("updateForm.st")
	public String productUpdateForm(int productNo, Model model) {
		Product p = stService.selectProduct(productNo);
		model.addAttribute("p", p);
		return "admin_storeAndReview/admin_storeUpdateForm";
	}
	
	@RequestMapping("update.st")
	public String updateProduct(Product p, @RequestParam(name="thumb", required=true) MultipartFile file, 
			HttpServletRequest request) {
		
		if(!file.getOriginalFilename().equals("")) {
			if(p.getProductChange() != null) {
				deleteFile(p.getProductChange(), request);
			}
			String changeName = saveFile(file, request);
			p.setProductOrigin(file.getOriginalFilename());
			p.setProductChange(changeName);
			p.setProductFilepath(request.getSession().getServletContext().getRealPath("resources") + "\\uploadFiles\\" + changeName);
		}
		
		int result = stService.updateProduct(p);
		
		if(result>0) {
			return "redirect:list.st?currentPage=1";
		} else {
			return "common/errorPage_admin";
		}
	
	}
	
	@RequestMapping("delete.st")
	public String deleteProduct(int productNo, Model model) {
		int result = stService.deleteProduct(productNo);
		
		if(result>0) {
			return "redirect:list.st?currentPage=1";
		} else {
			return "common/errorPage_admin";
		}
	}
	
	
	/* 리뷰관리 */
	@RequestMapping("list.re")
	public String selectReviewList(int currentPage, Model model) {
		int listCount = stService.selectReviewListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		ArrayList<Review> list = stService.selectReviewList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		return "admin_storeAndReview/admin_review";
	}
	
	@RequestMapping("detail.re")
	public String reviewDetail(int reviewNo, Model model) {
		Review r = stService.selectReview(reviewNo);
		model.addAttribute("r", r);
		
		return "admin_storeAndReview/admin_reviewDetail";
	}
	
	@RequestMapping("delete.re")
	public String deleteReview(int reviewNo, Model model) {
		int result = stService.deleteReview(reviewNo);
		
		if(result>0) {
			return "redirect:list.st?currentPage=1";
		} else {
			return "common/errorPage_admin";
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/* -------------------- 사용자 ----------------------- */
	
	@RequestMapping("coffee.st")
	public String selectCoffeeList(int currentPage, Model model) {
		int listCount = stService.selectCoffeeListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 12);
		
		ArrayList<Product> list = stService.selectCoffeeList(pi);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "store/coffeeListView";
	}
	
	@RequestMapping("coffeeDetail.st")
	public String selectCoffee(int productNo, Model model) {
		Product p = stService.selectCoffee(productNo);
		model.addAttribute("p", p);
		return "store/coffeeDetailView";
	}
	
	@RequestMapping("best.st")
	public String selectBest(Model model) {
		ArrayList<Product> list = stService.selectBest();
		model.addAttribute("list", list);
		return "store/storeBestListView";
	}
	
	@RequestMapping("item.st")
	public String selectItemList(int currentPage, Model model) {
		int listCount = stService.selectItemListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 12);
		
		ArrayList<Product> list = stService.selectItemList(pi);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "store/itemListView";
	}
	
	@RequestMapping("itemDetail.st")
	public String selectItem(int productNo, Model model) {
		Product p = stService.selectItem(productNo);
		model.addAttribute("p", p);
		return "store/itemDetailView";
	}
	
	//@ResponseBody
	@RequestMapping(value="selectWish.st")
	public void selectWish(HttpSession session, HttpServletResponse response) throws IOException {
		
		Member loginUser  = (Member)session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();

		ArrayList<Product> list = stService.selectWish(userNo);
		
		Gson gson = new Gson();
		response.setContentType("aplication/json; charset=utf-8");
	    gson.toJson(list, response.getWriter());
	}
	
	@RequestMapping("insertWish.me")
	public void insertWish(int productNo, HttpSession session, HttpServletResponse response) throws JsonIOException, IOException, NullPointerException {
		Member loginUser  = (Member)session.getAttribute("loginUser");
		Gson gson = new Gson();
		response.setContentType("aplication/json; charset=utf-8");
		
		int result;
		if(loginUser == null) {
			result=0;
			gson.toJson(result, response.getWriter());
		}else if(loginUser != null) {
			int userNo = loginUser.getUserNo();
			
			Product p = new Product();
			p.setUserNo(userNo);
			p.setProductNo(productNo);
			
			//System.out.println(productNo);
			
			int count = stService.selectOneWishList(p);
			
			//System.out.println(count);
			if(count >0) {
				result=-1;
				gson.toJson(result, response.getWriter());
			}else {
				result = stService.insertWish(p);
				gson.toJson(result, response.getWriter());
			}
		}
	}
	
	@RequestMapping("deleteWish.me")
	public void deleteWish(int productNo, HttpSession session, HttpServletResponse response) throws JsonIOException, IOException, NullPointerException {
		Member loginUser  = (Member)session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		
		Product p = new Product();
		p.setUserNo(userNo);
		p.setProductNo(productNo);
		
		System.out.println(userNo);
		System.out.println(productNo);
		
		int result = stService.deleteWish(p);
		
		System.out.println(result);
				
		Gson gson = new Gson();
		response.setContentType("aplication/json; charset=utf-8");
		gson.toJson(result, response.getWriter());
	}
	
	
	
}
