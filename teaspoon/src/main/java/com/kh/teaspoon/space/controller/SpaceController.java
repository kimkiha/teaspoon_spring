package com.kh.teaspoon.space.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.teaspoon.space.model.service.SpaceService;
import com.kh.teaspoon.space.model.vo.Space;

@Controller
public class SpaceController {
	
	@Autowired
	private SpaceService scService;
	
	
	@RequestMapping("insert.sc")
	public String insertSpace(Space s, Model model, HttpSession session) {
		
		int result = scService.insertSpace(s);
		
		if(result > 0) {
			
			session.setAttribute("msg", "공간대여 등록 되셨습니다.");
			return "redirect:/";
			
		}else {
			
			model.addAttribute("msg", "공간대여 등록 실패하셨습니다.");
			return "common/errorPage";
		}
		
		
	}
	
	
}
