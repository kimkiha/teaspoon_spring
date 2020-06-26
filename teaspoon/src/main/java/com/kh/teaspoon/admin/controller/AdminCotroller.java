package com.kh.teaspoon.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.teaspoon.admin.model.service.AdminService;
import com.kh.teaspoon.admin.model.vo.Grade;

@Controller
public class AdminCotroller {
	@Autowired
	private AdminService adService;
	
	@RequestMapping("level.me")
	public String level(Model model) {
		ArrayList<Grade> gList = adService.selectGradeList();
		//System.out.println(gList);
		model.addAttribute("gList", gList);
		return "admin/admin_level";
	}
	
	@RequestMapping("insertGrade.me")
	public String insertGrade(Grade grade) {
		System.out.println(grade);
		int result = 0;
		adService.insertGrade(grade);
		
		if(result > 0) {

			return "redirect:level.me";
			
		}else {
			
			return "";
		}
	}
}
