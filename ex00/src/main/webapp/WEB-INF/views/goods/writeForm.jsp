<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<script type="text/javascript">
$(function(){ // HTML 문서가 로딩이 다 되면 실행해 주세요
	// 바로 중분류의 데이터를 세팅한다.
	$("#cate_code2").load("/ajax/getMidList.do?cate_code1=" + $("#cate_code1").val());
	
	// 제[조일] 을 현제 날짜 이전만 입력 가능
	$("#product_date").datepicker("option",{"maxDate" : new Date()});
	// 판매 시작일, 판매 종료일 현재 날짜 이후 가능하다.
	$("#sale_startDate").datepicker("option",{"minDate" : new Date()});
	$("#sale_endDate").datepicker("option",{"minDate" : new Date()});
	
	// 이벤트 처리 - 대분류가 바뀌면 중분류도 바뀌어야 한다.
	$("#cate_code1").change(function(){
		// 바로 중분류 데이터 세팅한다.
		$("#cate_code2").load("/ajax/getMidList.do?cate_code1=" + $("#cate_code1").val());
	});
	
	
	$("#sale_startDate").change(function() {
	//alert($(this).val());
		$("#sale_endDate").datepicker( "option", "minDate", $(this).val());
	});
	$("#sale_endDate").change(function() {
	//alert($(this).val());
		$("#sale_startDate").datepicker( "option", "maxDate", $(this).val());
	});
});
</script>
</head>
<body>
<div class="container">
	<h2>상품 등록</h2>
	<form action="write.do" method="post" enctype="multiparty/form-data">
	<!-- 상품 정보 기본 입력폼 시작 -->
		<div class="form-inline">
			<div class="form-group">
				<label for="title">대분류 : </label>
				<select class="form-control" name="cate_code1" id="cate_code1" style="margin: 0 10px;">
					<c:forEach items="${bigList }" var="vo">
						<option value="${vo.cate_code1 }">${vo.cate_name } </option>
					</c:forEach>
				</select>
			</div>
			<div class="form-group">
				<label for="title">중분류 : </label>
				<select class="form-control" name="cate_code2" id="cate_code2" style="margin:  0 10px;">
					<!-- ajax 를 이용한 중분류 옵션 끼워 로딩하기 -->
				</select>
			</div>
		</div>
		<div class="form-group">
			<label for="goods_name">상품명</label>
			<input class="form-control" name="goods_name" id="goods_name" required>
		</div>
		<div class="form-group">
			<label for="company">제[조사]</label>
			<input class="form-control" name="company" id="company" required>
		</div>
		<div class="form-group">
			<label for="detail_image_name">상세 설명 이미지</label>
			<input type="file" class="form-control" name="detail_image_name" id="detail_image_name">
		</div>
		<div class="form-group">
			<label for="content">상세 설명</label>
			<textarea class="form-control" name="content" id="content"></textarea>
		</div>
		<div class="form-group">
			<label for="product_date">제조 날짜</label>
			<input class="form-control datepicker" name="product_date" id="product_date" required readonly>
		</div>
		<div class="form-group">
			<label for="image_name">대표 이미지</label>
			<input type="file" class="form-control" name="image_name" id="image_name" required>
		</div>
		<!-- 기본정보 입력 끝 -->
		
		<!--  가격 정보 입력 시작 -->
		<div class="form-group">
			<label for="price">정가</label>
			<input class="form-control" name="price" id="price" required>
		</div>
		<div class="form-group">
			<label for="discount">할인가</label>
			<input class="form-control" name="discount" id="discount">
		</div>
		<div class="form-group">
			<label for="discount_rate">할인 율</label>
			<input class="form-control" name="discount_rate" id="discount_rate">
		</div>
		<div class="form-group">
			<label for="delivery_charge">배송료</label>
			<input class="form-control" name="delivery_charge" id="delivery_charge" required value="0">
		</div>
		<div class="form-group">
			<label for="saved_rate">적립 율</label>
			<input class="form-control" name="saved_rate" id="saved_rate" value="0">
		</div>
		<div class="form-group">
			<label for="sale_startDate">판매 시작일</label>
			<input class="form-control datepicker" name="sale_startDate" id="sale_startDate" required readonly>
		</div>
		<div class="form-group">
			<label for="sale_endDate">판매 종료일</label>
			<input class="form-control datepicker" name="sale_endDate" id="sale_endDate" required readonly>
		</div>
		<!--  가격 정보 입력 끝 -->
		<button type="submit" class="btn btn-primary">등록</button>
		<button type="reset" class="btn btn-warning">새로입력</button>
		<button type="button" class="cancelBtn btn btn-success">취소</button>
	</form>
</div>
</body>
</html>