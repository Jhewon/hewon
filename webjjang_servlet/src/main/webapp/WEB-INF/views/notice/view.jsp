<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
<meta charset="utf-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>

<div class="container">
	<div>
	<h2><i class="fa fa-book"></i>공지사항 상세보기</h2>
	<table class="table">
		
		<tr>
			<th>글번호</th>
			<td>${vo.no }</td>
			<th>제목</th>
			<td>${vo.title }</td>
			<th>작성일</th>
			<td  colspan="3">${vo.writeDate }</td>
		</tr>
		<tr>
			<th>게시일</th>
			<td>${vo.startDate }</td>
			<th>종료일</th>
			<td>${vo.endDate }</td>
			<th>수정일</th>
			<td>${vo.updateDate }</td>
			
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="6">
				<pre>${vo.content }</pre>
			</td>
		</tr>
		<tr>
			<td colspan="6">
				<a href="list.do?page=${param.page }&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}" 
				class="btn btn-dark">목록</a>
				<a href="updateForm.do?no=${vo.no}&page=${param.page }&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}"
				 class="btn btn-light">수정</a>
				<a href="delete.do?no=${vo.no}&page=${param.page }&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}"
				 class="btn btn-dark">삭제</a>
				
			</td>			
		</tr>
	</table>
	</div>
<!-- 댓글 시작 -->
<!-- 댓글 끝 -->
</div><!-- 컨테이너 끝 -->
</body>
</html>