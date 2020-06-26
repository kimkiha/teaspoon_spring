package com.kh.teaspoon.board.model.service;

import java.util.ArrayList;

import com.kh.teaspoon.board.model.vo.Board;
import com.kh.teaspoon.common.model.vo.Attachment;
import com.kh.teaspoon.common.model.vo.PageInfo;

public interface BoardService {
	

	int selectMagazineListCount();
	
	ArrayList<Board> selectMagazineList(PageInfo pi);
	
	int insertMagazine(Board b);
	
	int insertAttachment(Attachment at);
	
	Board selectMagazine(int boardNo);
	
	int updateMagazine(Board b);
}
