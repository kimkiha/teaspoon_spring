package com.kh.teaspoon.space.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Space {

	private int reservNo;          // 예약번호   
	private int userNo;            // 회원번호
	private Date appDate;          // 예약요청날짜
	private String reservDate;     // 대관날짜
	private String reservTime;     // 대관시간
	private int visitNum;          // 인원수
	private String phone;          // 연락처
	private String reservReason;   // 사용목적
	private String accept;         // 승인여부
	private String goods;           // 비품
	private int gradeCode;         // 회원등급
	private int total;
	private String userName;
	
}
