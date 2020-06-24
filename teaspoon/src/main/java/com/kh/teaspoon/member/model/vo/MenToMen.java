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
public class MenToMen {
	
	private int mtmNo;
	private int userNo;
	private int mtmType;
	private String mtmtitle;
	private String content;
	private String createDate;
	private String reComment;
	private String commentDate;
	private String sendEmail;
	private String answer;
	private String status;
	
}
