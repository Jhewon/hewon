
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 게시판 리스트</title>
<style type="text/css">
/* 이곳을 주석입니다. Ctrl + Shift + C로 자동 주석 가능. 그러나 푸는 건 안된다.
	선택자 {스타일 항목 : 스타일 값;스타일 항목 : 스타일 값;...}
	기본 선택자 : a - a tag, .a - a라는 클래스(여러개), #a - a라는 아이디(한개)
	다수 선택자 : ","로 선택. a, #a : a tag와 a라는 아이디
	상태 선택자 : ":". ":hover" - 마우스가 올라갔을 때.
				 "a:hover" - a tag 위에 마우스가 올라갔을 때
	선택의 상속 : a .data - a tag 안에 data class의 태그를 찾는다.
 */
.dataRow:hover{
	opacity: 70%;
	cursor: pointer;
}
.dataRow{
	margin-top: 10px;
}
h2{
	text-align: center;
	margin-top: 10px;
} 
.imgDiv{
	background: #F1FAFF;
}
.title{
	height: 50px;
}
</style>

<script type="text/javascript">
$(function(){

	// 이미지 사이즈 조정 5:4
	let imgwidth = $(".imgDiv:first").width();
	let imgheight = $(".imgDiv:first").height();
	console.log("width = " + imgwidth  + " ,  height = " + imgheight)
	// 높이 계산 - 너비는 동일하다. : 이미지와 이미지를 감싸고 있는 div의 높이로 사용
	let height = imgheight/5 * 4;
	// 전체 imgDiv의 높이를 조정한다.
	$(".imgDiv").height(height);
	// 이미지 배열로 처리하면 안된다. foreach 사용 - jquery each() 
	$(".imgDiv>img").each(function(idx,image){
		console.log(image);
		// 이미지가 계산된 높이보다 크면 줄인다.
		if($(image).height() > height){
			let image_width = $(image).width();
			let image_height = $(image).height();
			let width = height / image_height * image_width;
			
			console.log(width);
			// 이미지 높이 줄이기
			$(image).height(height);
			// 이미지 너비 줄이기
			$(image).width(width);
		}
	});
	
	
	// 이벤트 처리
	$(".dataRow").click(function(){
		// alert("click");
		// 글번호 필요 - 수집
		let no = $(this).find(".no").text();
		console.log("no = " + no);
		location="view.do?no=" + no + "&inc=1&${pageObject.pageQuery}";
	});
	
	// perPageNum 처리
	$("#perPageNum").change(function(){
		// alert("change perPageNum");
		// page는 1페이지 + 검색 데이터를 전부 보낸다.
		$("#searchForm").submit();
	});
	
	// 검색 데이터 세팅
	$("#key").val("${(empty pageObject.key)?'t':pageObject.key}");
	$("#perPageNum")
		.val("${(empty pageObject.perPageNum)?'10':pageObject.perPageNum}");
});
</script>

</head>
<body>
<div class="container">
	<h2>이미지 게시판 리스트</h2>
  <form action="list.do" id="searchForm">
  	<input name="page" value="1" type="hidden">
	  <div class="row">
	  	<div class="col-md-8">
	  		<div class="input-group mb-3">
			  <div class="input-group-prepend">
			      <select name="key" id="key" class="form-control">
			      	<option value="t">제목</option>
			      	<option value="c">내용</option>
			      	<option value="tc">제목/내용</option>
			      	<option value="f">파일명</option>
			      	<option value="tcw">모두</option>
			      </select>
			  </div>
			  <input type="text" class="form-control" placeholder="검색"
			   id="word" name="word" value="${pageObject.word }">
			  <div class="input-group-append">
			      <button class="btn btn-outline-primary">
			      	<i class="fa fa-search"></i>
			      </button>
			  </div>
			</div>
	  	</div>
	  	<!-- col-md-8의 끝 : 검색 -->
	  	<div class="col-md-4">
	  		<!-- 너비를 조정하기 위한 div 추가. float-right : 오른쪽 정렬 -->
	  		<div style="width: 200px;" class="float-right">
			  <div class="input-group mb-3">
			    <div class="input-group-prepend">
			      <span class="input-group-text">Rows/Page</span>
			    </div>
			    <select id="perPageNum" name="perPageNum" class="form-control">
			    	<option>6</option>
			    	<option>9</option>
			    	<option>12</option>
			    	<option>15</option>
			    </select>
			  </div>
		  </div>
	  	</div>
	  	<!-- col-md-4의 끝 : 한페이지당 표시 데이터 개수 -->
	  </div>
  </form>
  <c:if test="${ empty list }">
  	<div class="jumbotron">
  <h4>데이터가 존재 하지 않습니다.</h4>
	</div>
  </c:if>
  
  <c:if test="${ !empty list }">
  <div class="row">
  <!-- 이미지의 데이터가 있는 만큼 반복 해서 표시하는 처리 시작 -->
  <c:forEach  items="${list }" var="vo" varStatus="vs">
  	<!-- 줄 바꿈 처리 - 인덱스 번호가 가 3의 배수이면  줄바꿈을 한다. -->
  	<c:if test="${(vs.index != 0) && (vs.index % 3 == 0) }">
  		${"</div>" }
  		${"<div class='row'>" }
  	</c:if>
  		<!-- 데이터 표시 시작 -->
  	<div class="col-sm-4 dataRow">
  		<div class="card" style="width:100%">
  		<div class="imgDiv text-center align-content-center ">
		  <img class="card-img-top" src=${vo.fileName } alt="image">
  		</div>
		 <div class="card-body">
		    <strong class="card-title">
		    <span class="float-right">${vo.writeDate }</span>
		    ${vo.name }(${vo.id })
		    </strong>
		    <p class="card-text text-truncate title"><span class="no">${vo.no}</span>. ${vo.title }</p>
		 </div>
		</div>
  	</div>
  		<!-- 데이터 표시 끝 -->
  </c:forEach>
  <!-- 이미지의 데이터가 있는 만큼 반복 해서 표시하는 처리 끝 -->
  </div> <!-- div row -->
	<div><pageNav:pageNav listURI="list.do" pageObject="${pageObject }"/></div> <!-- 페이지 네이션 -->
	<c:if test="${ !empty login}">
	<!-- 로그인이 되어있으면 보이게 하자 -->
	</c:if>
  </c:if>
	<a href="writeForm.do?perPageNum=${pageObject.perPageNum }" class="btn btn-primary">등록</a>
</div>
</body>
</html>