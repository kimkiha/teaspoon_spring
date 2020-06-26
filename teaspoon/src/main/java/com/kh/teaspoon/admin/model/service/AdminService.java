package com.kh.teaspoon.admin.model.service;

import java.util.ArrayList;

import com.kh.teaspoon.admin.model.vo.Grade;

public interface AdminService {
	
	ArrayList<Grade> selectGradeList();
	
	int insertGrade(Grade grade);
}
