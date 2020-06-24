package com.kh.teaspoon.space.model.vo;

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
public class Goods {

	private int gsNo;        // 비품번호    
	private String gsName;   // 비품명
	private int gsPrice;     // 비품대여비
	private int gsCount;     // 비품수량
	private int gsUsing;     // 비품사용수
	private int gsSaving;     // 비품적립금
	
}
