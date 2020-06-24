package com.kh.teaspoon.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class Board {
	
	private int boardNo;
	private int boardCategory;
	private String boardContent;
	private int boardCount;
	private Date createDate;
	private Date modifyDate;
	private String status;
	private String smallTitle;
	private Date endDate;

}


