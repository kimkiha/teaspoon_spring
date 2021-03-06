package com.kh.teaspoon.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Board {
	//board
	private int boardNo;
	private int boardCategory;
	private String boardTitle;
	private String boardContent;
	private int boardCount;
	private Date createDate;
	private Date modifyDate;
	private String status;
	private String smallTitle;
	private Date endDate;

	//attachment
	private int fileNo;
	private int refBno;
	private String originName;
	private String changeName;
	private String filePath;
	private Date uploadDate;
	private int fileLevel;
	private String fileStatus;
	private int boardLevel;
}


