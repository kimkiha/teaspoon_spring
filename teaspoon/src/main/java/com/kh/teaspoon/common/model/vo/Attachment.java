package com.kh.teaspoon.common.model.vo;

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
public class Attachment {
	
	private int fileNo;
	private int refBno;
	private String originName;
	private String changeName;
	private String filePath;
	private int fileLevel;
	private String fileStatus;
	private int boardLevel;

}
