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
public class Payment {

	private int reservNo;     // 예약번호       
	private int goodsPay;     // 비품금액
	private int total;        // 결제금액
	private int reservPay;    // 대관금액
}
