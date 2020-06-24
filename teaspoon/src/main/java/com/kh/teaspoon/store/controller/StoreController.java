package com.kh.teaspoon.store.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.teaspoon.store.model.service.StoreService;

@Controller
public class StoreController {

	@Autowired
	private StoreService stService;
	
	
	
}
