<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 리스트</title>
<style type="text/css">
.dataRow:hover{
	background: #ddd;
	cursor: pointer;
}
 h1{
  text-align: center;
 }
</style>

<script type="text/javascript">
$(function(){
		<!-- $("#${pageObject.period}").prop('checked',true); -->
		$("[value='${pageObject.period}']").prop('checked',true);
	// 이벤트 처리
	$(".dataRow").click(function(){
		// alert("click");
		// 글번호 필요 - 수집
		let no = $(this).find(".no").text();
		console.log("no = " + no);
		location="view.do?no=" + no + "&inc=0&${pageObject.pageQuery}" ;
	});
	
	// perPageNum 처리
	$("#perPageNum").change(function(){
		// alert("asdasd");
		// page 는 1페이지 + 검색 데이터를 전부 보낸다.
		$("#searchForm").submit();
		
	});
	
	// 검색 데이터 세팅
	$("#key").val("${(empty pageObject.key)?'t': pageObject.key }");
	$("#perPageNum").val("${(empty pageObject.perPageNum)?'10': pageObject.perPageNum }");
	
	$(".noticeOption").change(function(){
		//alert("클릭");		
		if( this.optionList[0].checked){
			//alert("현재공지");
			location="/notice/list.do?period=pre";
		}
		else if( this.optionList[1].checked){
			//alert("이전공지");
			location="/notice/list.do?period=old";
		}
		else if( this.optionList[2].checked){
			//alert("예정공지");
			location="/notice/list.do?period=res";
		}
		else if( this.optionList[3].checked){
			//alert("모두");
			location="/notice/list.do?period=all";
		}
		
	});
	
});
</script>

</head>
<body>
<div class="container">
	<h1>공지사항 리스트</h1>
	<c:if test="${!empty login && login.gradeNo == 9 }">
		<form class="noticeOption">
		  <div class="custom-control custom-radio custom-control-inline">
		    <input type="radio" class="custom-control-input" id="pre" name="optionList" value="pre">
		    <label class="custom-control-label" for="pre">현재공지</label>
		  </div>
		  <div class="custom-control custom-radio custom-control-inline">
		    <input type="radio" class="custom-control-input" id="old" name="optionList" value="old">
		    <label class="custom-control-label" for="old">이전공지</label>
		  </div>
		  <div class="custom-control custom-radio custom-control-inline">
		    <input type="radio" class="custom-control-input" id="res" name="optionList" value="res">
		    <label class="custom-control-label" for="res">예정공지</label>
		  </div>
		  <div class="custom-control custom-radio custom-control-inline">
		    <input type="radio" class="custom-control-input" id="all" name="optionList" value="all">
		    <label class="custom-control-label" for="all">모든공지</label>
		  </div>
		</form>
	</c:if>
	
	<!-- 검색란의 시작 -->
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
			    	<option>10</option>
			    	<option>15</option>
			    	<option>20</option>
			    	<option>25</option>
			    </select>
			  </div>
		  </div>
	  	</div>
	  	<!-- col-md-4의 끝 : 한페이지당 표시 데이터 개수 -->
	  </div>
  </form>
  
 	<table class="table">
		<!-- tr : table row - 테이블 한줄 -->
		<!-- 게시판 데이터의 제목 -->
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>게시일</th>
			<th>종료일</th>
			<th>수정일</th>
		</tr>
		<!-- 실제적인 데이터 표시 : 데이터가 있는 만큼 줄(tr)이 생긴다. -->
		<!-- JS로 글보기로 페이지 이동
			onclick : click 이벤트 핸들러 속성 -->
		<c:forEach items="${list }" var="vo">
			<tr class="dataRow">
				<!-- td : table data - 테이블 데이터 텍스트 -->
				<td class="no">${vo.no}</td>
				<td>${vo.title}</td>
				<td>${vo.startDate }</td>
				<td>${vo.endDate}</td>
				<td>${vo.updateDate}</td>
			</tr>
		</c:forEach>
		<c:if test="${!empty login && login.gradeNo == 9 }">
			<tr>
				<td colspan="5">
						<!-- a tag : 데이터를 클릭하면 href의 정보를 가져와서 페이지 이동시킨다. -->
						<a href="writeForm.do?perPageNum=${pageObject.perPageNum }" class="btn btn-primary">등록</a>
					</td>
			</tr>
		</c:if>
	</table>
	<div><pageNav:pageNav listURI="list.do" pageObject="${pageObject }"></pageNav:pageNav></div>
</div>
</body>
</html>