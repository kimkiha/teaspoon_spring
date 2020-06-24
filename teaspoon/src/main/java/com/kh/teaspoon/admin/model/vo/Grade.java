package com.kh.teaspoon.admin.model.vo;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Grade {
	private int gradeNo;
	private String gradeName;
	private int minAcount;
	private double gradeRate;
}
