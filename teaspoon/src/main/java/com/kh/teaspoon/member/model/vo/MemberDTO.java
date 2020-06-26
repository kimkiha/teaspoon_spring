package com.kh.teaspoon.member.model.vo;

import java.sql.Date;

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
public class MemberDTO {
	
	private int userNo;
	private String userName;
	private int pointSum;
	private String gradeName;
	private int couponCount;
	private int wishlistCount;

}
