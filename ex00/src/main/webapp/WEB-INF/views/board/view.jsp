<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반게시판 상세보기</title>
<jsp:include page="../jsp/weblib.jsp"></jsp:include>
</head>
<body>
<div class="container">
	<h1>일반게시판 상세보기</h1>
	
	<div class="card">
	  	<div class="card-header">
			글번호 : ${vo.no } &nbsp;&nbsp;&nbsp; 제목 : ${vo.title }  <span class="float-right">조회수 : ${vo.hit }</span>
		</div>
	  	<div class="card-body">
			내용 : ${vo.content } 
		</div>
	  	<div class="card-footer">
	     작성자 : ${vo.writer }	<span class="float-right">작성일 : <fmt:formatDate value="${vo.writeDate }" pattern="yyyy-MM-dd"/></span>
			
		</div>
	</div>
	<a href="updateForm.do?no=${vo.no }" class="btn btn-dark">글 수정</a>
	<a href="list.do" class="btn btn-dark">글 목록</a>
	<a href="list.do" class="btn btn-dark">취소</a>
	<form action="#" method="post">
		<button class="btn btn-dark float-right">삭제</button>		
	</form>
</div>
</body>
</html>