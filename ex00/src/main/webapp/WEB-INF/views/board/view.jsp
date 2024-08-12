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
	글번호 : ${vo.no } <br>
	제목 : ${vo.title }<br>
	내용 : ${vo.content }<br>
	작성자 : ${vo.writer }<br>
	작성일 : <fmt:formatDate value="${vo.writeDate }" pattern="yyyy-MM-dd"/><br>
	조회수 : ${vo.hit }<br>
	<a href="updateForm.do" class="btn btn-dark">글 수정</a>
	<a href="list.do" class="btn btn-dark">글 목록</a>
	<form action="delete.do" method="post">
		<button class="btn btn-dark">삭제</button>		
	</form>
</div>
</body>
</html>