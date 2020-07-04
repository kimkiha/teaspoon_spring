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
public class MenToMenDTO {

	private int mtmNo;          
	private int userNo;
	private int mtmType;
	private String mtmTitle;
	private String content;
	private String createDate;
	private String reComment;
	private String commentDate;
	private String sendEmail;
	private String answer;
	private String status;
	private int fileNo;
	private int refBno;
	private String originName;
	private String changeName;
	private String filePath;
	private String uploadDate;
	private int fileLevel;
	private String fileStatus;
	private int boardLevel;
}
