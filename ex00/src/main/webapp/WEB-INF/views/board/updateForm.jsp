<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반게시판 글 수정 폼</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div class="container">
	<h1>일반게시판 글쓰기 폼</h1>
	<form action="update.do" method="post">
	<input value="${vo.no }" type="hidden">
		<div class="form-group">
			<label for="title">제목</label>
			<input class="form-control" name="title" id="title" required value="${vo.title }" >
		</div>
		<div class="form-group">
			<label for="content">내용</label>
			<textarea rows="5" class="form-control" name="content" id="content" required   >${vo.content }</textarea>
		</div>
		
		<div class="form-group">
			<label for="writer">작성자</label>
			<input class="form-control" name="writer" id="writer" required value="${vo.writer }" >
		</div>
		<div class="form-group">
			<label for="pw">비밀번호</label>
			<input class="form-control" name="pw" id="pw" required="required" type="password"  >
		</div>
		<button type="submit" class="btn btn-dark">업데이트</button>
		<button type="reset" class="btn btn-dark">새로입력</button>
		<button type="button" class="cancelBtn btn btn-dark">취소</button>
	</form>
</div>
</body>
</html>