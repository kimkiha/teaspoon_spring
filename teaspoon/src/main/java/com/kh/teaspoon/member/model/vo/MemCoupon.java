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
public class MemCoupon {

	private int couponNo;
	private int userNo;
	private String use;
	private int order_no;
	private String startDate;
	private String endDate;
	private String couponName;
	private int discountM;
	
}
