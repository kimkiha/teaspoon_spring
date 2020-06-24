package com.kh.teaspoon.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.teaspoon.admin.model.service.AdminService;

@Controller
public class AdminCotroller {
	@Autowired
	private AdminService adService;
	
	@RequestMapping("level.me")
	public String level() {
		
		return "admin/admin_level";
	}
}
