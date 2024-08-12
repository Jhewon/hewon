package org.zerock.board.vo;



import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	private long no,hit;
	private String title,content,writer,pw;
	private	Date writeDate; // sql - java.sql.Date : casting - spring에서는 자동 캐스팅
}
