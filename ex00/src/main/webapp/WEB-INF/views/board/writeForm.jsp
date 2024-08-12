<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반게시판 글 쓰기 폼</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div class="container">
	<h1>일반게시판 글쓰기 폼</h1>
	<form action="write.do" method="post">
		<table>
			<tr>
				<th>제목</th>
				<td>
				  <input name="title">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
				  <textarea rows="3" name="content"></textarea>
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>
				 <input name="writer">
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
				 <input name="pw" type="password">
				</td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td>
				 <input name="pw2" type="password">
				</td>
			</tr>

		</table>					
		<button class="btn btn-dark">등록</button>
		<a href="#" class="btn btn-dark" onclick="history.back();">취소</a>
	</form>
</div>
</body>
</html>