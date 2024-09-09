package org.zerock.goods.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Value;

import lombok.Data;

@Data
public class GoodsSearchVO {
	
	private Integer cate_code1; // 대분류 검색 - 상품 등록
	private Integer cate_code2; // 중분류 검색 - 상품 등록
	private String goods_name; // 상품명에 포함되어 있는 문자 검색
	private Integer min; // 제일 작은 금액 검색
	private Integer max; // 제일 큰 금액 검색
	
	// 기본 생성자, getter setter  toString 등 외에 필요한 메소드는 더 추가해서 사용가능
	// url 뒤에 5개의데이터를 붙여서 리턴하는 메소디 작성
	 
	public String getQuery() throws UnsupportedEncodingException {
		return "cate_code1="+toStr(cate_code1)+
				"&cate_code2="+toStr(cate_code2)+
				"&goods_name="+URLEncoder.encode(toStr(goods_name),"utf-8")
				+"&min="+toStr(min)+"&max="+toStr(max);
	}
	
	// uri 를 만들어서 사용하는데 
	private String  toStr(Object obj) throws UnsupportedEncodingException {
		return ((obj == null)?"" : obj.toString());
	}
	// 검색 데이터가 존재하는지 확인 하는 메소드 - return type Boolean 인 경우 get 대신 is 를 붙인다.
	public Boolean isExist() {
		if(cate_code1 != null && cate_code1 != 0) return true;
		if(goods_name != null && goods_name != "") return true;
		if(min != null && min != 0) return true;
		if(max != null && max != 0) return true;
		return false;
	}
}
