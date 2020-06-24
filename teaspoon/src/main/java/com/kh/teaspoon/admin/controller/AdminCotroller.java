package com.kh.teaspoon.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminCotroller {

	@RequestMapping("level.me")
	public String level() {
		return "";
	}
}
