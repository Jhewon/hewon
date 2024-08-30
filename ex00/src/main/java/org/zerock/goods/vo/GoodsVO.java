package org.zerock.goods.vo;

import java.util.Date;

import lombok.Data;

@Data
public class GoodsVO {

	private Long goods_no,hit;
	private Integer cate_code1, cate_code2,discont_rate , saved_rate,price,dicount,delivery_charge;
	private String goods_name,company,image_name , detail_image_name,content;
	private Date product_date , sale_startDate,sale_endDate; // sql - java.sql.Date : casting - spring에서는 자동 캐스팅
	
	
}
