package com.kh.teaspoon.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Member {

	private int userNo;
	private int gradeNo;
	private String userId;
	private String userPwd;
	private String userName;
	private String gender;
	private int birthday;
	private String phone;
	private String email;
	private date enrollDate;
	private int buySum;
	private int pointSum;
	private date modifyDate;
	private String admin;
	private String status;
	private String address;
	
	
	
}
